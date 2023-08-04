-------------------
Query
-------------------
WITH toppings AS
(
SELECT 
  	A.topping_name||', '||B.topping_name||', '||C.topping_name AS Pizza
    ,(A.ingredient_cost+B.ingredient_cost+C.ingredient_cost) as total
FROM	
  pizzas A
CROSS JOIN 
	pizzas B
CROSS JOIN 
	pizzas C 
WHERE 
	A.topping_name < B.topping_name and
  	B.topping_name < C.topping_name
ORDER BY
	total DESC, A.topping_name,B.topping_name,C.topping_name
)

SELECT 
	pizza,
	total
FROM toppings 
LIMIT 5


----------------------
Output
----------------------
|                      pizza                    | total |
|----------------------------------------------|-------|
| Artichokes, Feta Cheese, Ricotta Cheese       |  2.85 |
| Cheddar Cheese, Feta Cheese, Ricotta Cheese   |  2.8  |
| Artichokes, Cheddar Cheese, Ricotta Cheese    |  2.75 |
| Bacon, Feta Cheese, Ricotta Cheese            |  2.75 |
| Artichokes, Bacon, Ricotta Cheese             |  2.7  |
