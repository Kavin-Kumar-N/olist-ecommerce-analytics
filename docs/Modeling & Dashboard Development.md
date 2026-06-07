
# Power BI Data Modeling & Dashboard Development

This is the most important phase of the project. While data cleaning and validation ensure data quality, the Power BI layer is where business value is delivered.

The objective of this phase is not simply to create attractive visuals.

> The goal is to answer business questions through data and transform raw information into actionable insights.

---

# Data Modeling

The cleaned data was loaded into Power BI, and Power Query was used to create a dimensional model optimized for reporting and analysis.

The resulting model follows a  **star-schema-like design** , although at first glance it may resemble a galaxy schema because the Olist dataset contains multiple transactional tables.

The model structure is shown below:

```text
Customers
    |
Orders
    |
Order_Items
   /       \
Products   Sellers

Orders
   |
Payments

Orders
   |
Reviews
```

Although both `Orders` and `Order_Items` contain transactional data, the `Orders` table mainly acts as a bridge between customers, payments, reviews, and order items. Because of this role, the model behaves similarly to a star schema and supports efficient filtering and reporting within Power BI.

This structure also reduces the need for a large flattened table and allows calculations to be performed at the appropriate level of granularity.

---

# Why Power BI Results Differ from SQL Validation Results

During the SQL validation stage, most KPIs were calculated using the merged `full_data` table.

While this approach is useful for validation and exploratory analysis, it can introduce duplication issues because data from multiple tables is joined together at the lowest level of granularity.

### Example

Assume Order **O1** contains two products:

| Product | Value |
| ------- | ----- |
| P1      | 100   |
| P2      | 50    |

The order has a single payment:

| Payment |
| ------- |
| 150     |

After joining payment information with order items, the data becomes:

| Product | Payment |
| ------- | ------- |
| P1      | 150     |
| P2      | 150     |

Although the actual payment is only  **150** , the payment value appears on both product rows.

If revenue is calculated as:

```sql
SUM(payment_value)
```

the result becomes:

```text
150 + 150 = 300
```

which is incorrect.

This occurs because the payment value is duplicated for every order item after the joins.

### Solution in Power BI

To avoid this issue, revenue measures were created using the dedicated **Payments** table instead of the merged `full_data` table.

Since each payment record exists only once in the Payments table, revenue calculations remain accurate and are not affected by duplication caused by joins.

This is one of the major benefits of dimensional modeling compared to relying solely on a flattened dataset.

---

# Report Interactivity

To improve the analytical experience, slicers were added for:

* Date
* State

These slicers were configured as **global filters** using Power BI's **Sync Slicers** feature.

As a result, any date or state selection made by the user automatically applies across all report pages.

This allows users to:

* Analyze specific time periods across the entire report.
* Compare performance across different states.
* Maintain consistent filter context while navigating between pages.

For example, selecting a particular year or state immediately updates all relevant visuals throughout the dashboard.

---

# Drill-Through Evaluation

A drill-through page was explored during development to provide deeper analysis capabilities.

The intention was to allow users to:

* Right-click a visual.
* Navigate to a detailed analysis page.
* Investigate specific products, sellers, customers, or orders.

However, testing revealed that drill-through only worked effectively for certain visuals and dimensions. Since not all visuals shared the same drill-through fields, the user experience became inconsistent.

Some visuals successfully passed filter context to the drill-through page, while others could not. This resulted in incomplete analysis and could potentially confuse end users.

To maintain a simpler and more consistent experience, the drill-through functionality was removed.

Instead, navigation relies on:

* Global slicers
* Visual cross-filtering
* Dedicated analysis pages

This approach provides a more predictable and user-friendly reporting experience.

---

# Executive Overview Page

The Executive Overview page provides a high-level summary of overall business performance.

### KPI Cards

Key business metrics are displayed using card visuals:

* Total Revenue
* Total Orders
* Average Order Value
* Average Review Score
* Late Delivery %
* Average Delivery Days

These KPIs provide an instant snapshot of marketplace performance.

### Revenue Trend

A line chart displays revenue trends over time, helping identify growth patterns and seasonality.

### Revenue by State

A map visual shows revenue distribution across states, highlighting the strongest-performing regions.

### Revenue by Category

A horizontal bar chart displays revenue by product category, making it easy to identify top-performing categories.

---

# Sales Analysis Page

The Sales Analysis page focuses on revenue generation and purchasing behavior.

### Revenue by Payment Type

A pie chart shows the contribution of each payment method to total revenue.

### Monthly Revenue and Orders

A combined line and column chart displays:

* Monthly Revenue
* Order Count

This allows users to compare sales performance against order volume over time.

### Revenue KPI

A card visual highlights total revenue.

### Product Ranking by Year

A ribbon chart displays:

* Revenue by Product Category
* Category ranking changes across years

The ribbon chart effectively visualizes how category performance changes over time.

---

# Customer Analysis Page

The Customer Analysis page focuses on customer behavior and purchasing patterns.

### Review Score Distribution

A column chart shows the distribution of customer review scores.

### Revenue and Orders by Customer

A combined column-line chart displays:

* Total Revenue
* Total Orders

grouped by customer.

### Repeated Customers

A table visual identifies customers who have placed multiple orders, helping evaluate customer retention and repeat purchasing behavior.

---

# Delivery Analysis Page

The Delivery Analysis page evaluates logistics and delivery performance.

### Average Delivery Time by Year

A line chart shows how average delivery days have changed over time.

### Orders and Late Delivery Percentage by Review Score

A combined column-line chart displays:

* Order Count
* Late Delivery %

grouped by review score.

### Special Late Delivery Measure

The standard Late Delivery % measure could not be used in this visual because the filter context originates from the Reviews table.

The following custom measure was created:

```DAX
Late Delivery (Reviews) % =

CALCULATE(
    DIVIDE(
        COUNTROWS(
            FILTER(
                Orders,
                Orders[late_delivery] = TRUE()
            )
        ),
        COUNTROWS(Orders)
    ),
    CROSSFILTER(
        Orders[order_id],
        Reviews[order_id],
        BOTH
    )
)
```

### Measure Explanation

Normally, filters flow from the Orders table to the Reviews table.

When a user selects a review score, Power BI filters the Reviews table, but that filter does not automatically flow back to the Orders table.

The `CROSSFILTER()` function temporarily changes the relationship direction between Orders and Reviews to **Both** directions.

This allows the selected review score to filter the Orders table as well.

The measure then:

1. Counts all late-delivery orders.
2. Counts total orders within the selected review-score context.
3. Divides the two values to calculate the late delivery percentage.
4. Uses `CROSSFILTER()` to ensure review score selections influence the Orders table.

Without this measure, the Late Delivery % visual would not respond correctly when analyzing delivery performance by review score.

---

# Seller Analysis Page

The Seller Analysis page focuses on seller performance and quality.

### Seller Count by Review Score

A column chart displays the number of sellers across different review score levels.

### Seller Performance Table

A table visual includes:

* Seller ID
* Average Review Score
* Order Count
* Revenue

The table is sorted by average review score.

To focus on meaningful seller performance, a filter was applied to display only sellers with:

```text
Order Count >= 100
```

This removes low-volume sellers and improves comparison quality.

### Top Sellers by Revenue

A bar chart highlights the highest revenue-generating sellers.

### Total Sellers

A card visual displays the total number of sellers.

---

# Dashboard Design

The dashboard was designed using a clean and minimal layout to maximize readability and business usability.

Design principles include:

* Consistent page structure
* KPI-focused reporting
* Minimal visual clutter
* Business-oriented visual selection
* Limited but meaningful use of colors
* Highlighted KPI cards for quick executive review
* Global date and state slicers for consistent filtering across pages

Several interactive features were evaluated during development, including drill-through navigation. After testing, synchronized slicers and visual cross-filtering were selected as the primary interaction methods because they provided the most consistent experience across the entire report.

The final dashboard enables users to analyze sales performance, customer behavior, delivery efficiency, product trends, and seller performance through an interactive, business-friendly reporting solution.
