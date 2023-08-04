-------------------
Query
-------------------
WITH toppings AS
(
SELECT 
	A.topping_name||', '||B.topping_name||', '||C.topping_name AS Pizza
	,(A.ingredient_cost+B.ingredient_cost+C.ingredient_cost) as total
	,ROW_NUMBER() OVER(PARTITION BY (A.ingredient_cost+B.ingredient_cost+C.ingredient_cost) ORDER BY A.ingredient_cost+B.ingredient_cost+C.ingredient_cost  DESC, A.topping_name,B.topping_name,C.topping_name) as row_no
FROM 
	pizzas A
CROSS JOIN 
	pizzas B
INNER JOIN 
	pizzas C 
    ON A.topping_name <> C.topping_name AND B.topping_name <> C.topping_name
WHERE 
	A.topping_name <> B.topping_name
ORDER BY 
	total DESC, A.topping_name,B.topping_name,C.topping_name
)

SELECT 
	pizza
	,total
FROM 
	toppings 
WHERE 
	row_no = 1
LIMIT 5


----------------------
Output
----------------------
|                      pizza                    | total |
|----------------------------------------------|-------|
| Artichokes, Feta Cheese, Ricotta Cheese       |  2.85 |
| Cheddar Cheese, Feta Cheese, Ricotta Cheese   |  2.8  |
| Artichokes, Cheddar Cheese, Ricotta Cheese    |  2.75 |
| Artichokes, Bacon, Ricotta Cheese             |  2.7  |
| Artichokes, Bacon, Feta Cheese                |  2.65 |
