-----------------
Query
-----------------

SELECT month_name,saleproduct,SUM(salequantity*price) as total_sales
FROM 
(
SELECT 
  	DISTINCT to_char(saledate,'Month') as Month_name
  	,A.saleproduct
  	,A.salequantity
  	,FIRST_VALUE(unitprice) OVER(PARTITION BY A.saleproduct, A.salequantity  ORDER BY B.pricedate DESC) as price
FROM 
  	productsales A 
INNER JOIN 
  productprices B 
  ON 
  	A.saleproduct = B.product 
  AND EXTRACT('month' FROM A.saledate) = EXTRACT('month' FROM B.pricedate)
WHERE 
  A.saledate >= B.pricedate
) A 
GROUP BY 1,2
ORDER BY EXTRACT('month' FROM TO_DATE(month_name,'Month'))

------------------
Output
------------------

| month_name |  saleproduct  | total_sales |
|------------|---------------|------------|
| October    |   product1    |   88808    |
| October    |   product2    |   43372    |
| October    |   product3    |   73990    |
| October    |   product4    |   93600    |
| November   |   product3    |   88000    |
| November   |   product4    |   2000     |
| November   |   product1    |   4620     |
