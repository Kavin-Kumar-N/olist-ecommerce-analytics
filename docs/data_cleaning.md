## Data Cleaning and Feature Engineering

In this step, data cleaning and feature engineering were performed using Jupyter Notebook.

### Setup

* MySQL was connected with Python.
* All SQL tables were loaded into Python variables for processing and analysis.

### Orders Table Cleaning

The cleaning process started with the `orders` table.

* Date columns were converted from string/object type to `datetime`.
* Missing values were checked in the delivery date columns.

Initially, the missing dates were planned to be filled with dummy values like:

```python
'1900-01-01'
```

But after checking those records, it was found that they belong to orders where delivery was not completed.
So, the missing values were kept as they are instead of inserting fake data.

### Feature Engineering

New columns were created from the existing order data for better analysis:

* `delivery_days`
* `late_delivery`
* `order_year`
* `order_month`

### Product Data Enrichment

In the `products` table, English product category names were added by merging the product translation table.
This was done for better readability and analysis.

### Creating Full Analysis Table

For analysis purposes, multiple tables were merged into a new table called `full_data`.

The merge was mainly built around the `order_items` table because it has the lowest granularity and works well as a fact table for the analysis model.

### Handling Missing Values

Missing values were handled in important columns such as:

* `review_score`
* `payment_type`

inside the `full_data` table.

### Exporting Cleaned Data to SQL

The cleaned tables:

* `orders`
* `order_items`
* `full_data`

were exported back to MySQL.

While exporting `full_data`, some issues occurred due to:

* Very large text fields
* `NaT` values in datetime columns
* Problematic Unicode/special characters
* Transaction size and memory issues during insert

These issues were resolved before the final export.

### Datetime Error Handling

Some datetime columns contained invalid values.
To handle this safely, a loop was used to convert all datetime columns using:

```python
errors='coerce'
```

This converts invalid datetime values into `NaT`, which later becomes `NULL` when exporting to SQL.

### Final Validation and Backup

After exporting:

* SQL tables were checked again for validation.
* A CSV backup of the `full_data` table was also created for safety and future use.
