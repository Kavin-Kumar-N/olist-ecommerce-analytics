import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(
    "mysql+mysqlconnector://root:root@localhost/olist_project"
)

df = pd.read_sql(
    "SELECT * FROM vw_sales_data",
    engine
)

df.to_excel(
    "excel/olist_validation.xlsx",
    sheet_name="Raw_Data",
    index=False
)