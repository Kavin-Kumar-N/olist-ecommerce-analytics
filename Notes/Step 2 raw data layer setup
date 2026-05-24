## Data Setup and Import Process

The raw CSV files are kept as the original backup files and are never modified directly.
All data is first imported into MySQL, and all cleaning, transformation, and analysis steps are performed using the SQL tables instead of the CSV files.

A database and tables were created in MySQL based on the dataset structure. Appropriate data types were assigned to each column according to the values in the CSV files.

Since the project contains a large amount of data, the `LOAD DATA LOCAL INFILE` method was used for importing data because it is faster and more efficient for large datasets compared to the Import Wizard.

To enable this feature:

* `local infile` mode was enabled in MySQL.
* The MySQL connection settings were edited.
* In the Advanced connection settings, the following line was added:

```sql id="b2xq3j"
OPT_LOCAL_INFILE=1
```

After setup, the data was imported into all tables successfully.

Once the import was completed, row counts were checked for validation. All tables matched correctly except the `order_reviews` table.

To verify the issue:

1. The table was truncated.
2. The data was imported again using Python.
3. The same row count result appeared.

After checking the CSV file, it was found that some review comments contain multiline text with line breaks and empty lines inside a single field. Because of this, some rows appear across multiple lines in the CSV file view.

For example, around line `104677` in `order_reviews.csv`, a review spans across several visible lines.

So, the issue was not caused by the import process. The dataset structure itself contains multiline review text, and the data import was working correctly.
