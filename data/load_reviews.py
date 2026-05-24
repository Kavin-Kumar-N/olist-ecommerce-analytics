import pandas as pd
from sqlalchemy import create_engine

# Read csv
df = pd.read_csv(
    r"D:\Projects\olist-ecommerce-project\data\raw\olist_order_reviews_dataset.csv",
    engine="python",
    on_bad_lines="skip"
)

print(df.shape)


# mysql connection
engine= create_engine(
     "mysql+pymysql://root:root@localhost:3306/olist_project"
)

# load into mysql
df.to_sql(
    "order_reviews",
    con=engine,
    if_exists="append",
    index=False,
    chunksize=1000
)

print("Import completed")