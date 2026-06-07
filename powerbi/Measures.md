Total Revenue =
SUM(Order_items[price])

Total Orders =
DISTINCTCOUNT(Orders[order_id])

Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders]
)

Average Review Score =
AVERAGE(Reviews[review_score])

Average Delivery Days =
AVERAGE(Orders[delivery_days])

Late Delivery % =
DIVIDE(
    COUNTROWS(
        FILTER(
            Orders,
            Orders[late_delivery] = TRUE()
        )
    ),
    COUNTROWS(Orders)
)

Late Delivery(reviews) % =

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
    ))
