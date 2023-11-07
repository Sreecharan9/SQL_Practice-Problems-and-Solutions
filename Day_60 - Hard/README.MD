# Write a SQL query to find out the monthly sales of each product but the problem is that not for every sale date we have corresponding price date from Product Prices table so then we have to take the price from last known date before sale date. 

** Input Table **
# Product Sales

saledate	saleproduct	salequantity
10/1/2023	product1	150
10/1/2023	product2	224
10/3/2023	product1	91
10/5/2023	product3	317
10/5/2023	product4	1200
10/6/2023	product1	11
10/9/2023	product1	25
10/9/2023	product2	190
10/13/2023	product1	601
10/15/2023	product2	400
10/15/2023	product3	35
11/2/2023	product1	290
11/2/2023	product2	36
11/3/2023	product3	410
11/4/2023	product1	42
11/4/2023	product3	30
11/4/2023	product4	25

# Product Prices

pricedate	product	unitprice
10/1/2023	product1	104
10/1/2023	product2	53
10/1/2023	product3	210
10/1/2023	product4	78
10/9/2023	product1	100
10/9/2023	product2	50
10/9/2023	product3	211
10/9/2023	product4	75
10/15/2023	product2	55
10/15/2023	product3	212
11/1/2023	product3	200
11/3/2023	product1	110
11/3/2023	product2	60
11/3/2023	product4	80


** Output Table **

month_name	saleproduct	total_sales
October  	product1	88808
October  	product2	43372
October  	product3	73990
October  	product4	93600
November 	product3	88000
November 	product4	2000
November 	product1	4620




