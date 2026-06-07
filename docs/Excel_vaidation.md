### Excel Validation & Business Summary Layer

#### Goal of this Step

The purpose of this stage is to:

* Validate the results generated from SQL queries.
* Verify key business KPIs before building the Power BI dashboard.
* Create business-friendly summaries for stakeholders.
* Build Excel reports similar to what business users commonly work with in real-world organizations.

#### Why Excel?

Many portfolio projects move directly from SQL to dashboards, but in most business environments, Excel remains an important part of the reporting process.

A typical workflow is:

**SQL → Excel → Dashboard**

Business users and managers often request data in Excel format for review, validation, and ad-hoc analysis. Therefore, creating an Excel validation layer makes the project more realistic and aligned with industry practices.

#### Exporting Data to Excel

The cleaned `full_data` table was exported from MySQL into Excel.

This Excel file serves as:

* A validation layer between SQL and Power BI.
* A business reporting layer.
* A backup analytical dataset for quick exploration.

#### Analysis Using Pivot Tables

Several Pivot Tables were created to analyze the data and generate business insights.

The analysis covered:

##### Sales Analysis

* Total Sales
* Monthly Sales Trends
* Average Order Value
* Orders by Year and Month

##### Customer Analysis

* Total Customers
* Customers by State
* Customer Purchase Distribution
* Top Customer Locations

##### Delivery Analysis

* Average Delivery Days
* Late Delivery Count
* Delivery Performance by Month
* Order Status Distribution

##### Product Analysis

* Sales by Product Category
* Top Selling Categories
* Revenue Contribution by Category
* Product Performance Trends

##### Seller Analysis

* Seller Revenue
* Seller Order Volume
* Top Performing Sellers
* Seller Distribution Analysis

#### SQL Validation

After creating the Pivot Tables, the results were compared against SQL query outputs to ensure data accuracy.

Validation checks included:

* Total Sales
* Total Orders
* Total Customers
* Average Delivery Time
* Category-wise Revenue
* Seller Performance Metrics

The values generated from Excel Pivot Tables matched the SQL results, confirming that:

* The data cleaning process was successful.
* The feature engineering calculations were correct.
* The exported dataset was accurate.
* The data model was ready for Power BI development.

#### Outcome

This step provided an additional quality-check layer before dashboard creation. By validating Excel summaries against SQL results, confidence in the dataset was established, reducing the risk of reporting errors in the final Power BI dashboard.
