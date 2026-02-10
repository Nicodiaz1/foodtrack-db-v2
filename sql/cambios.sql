use foodtruck;

ALTER TABLE orders ADD comentarios NVARCHAR(100) NULL;

select*from orders;

UPDATE orders
SET comentarios = 'esto es una prueba'
WHERE foodtruck_id = 1;

UPDATE orders
SET comentarios = 'Sigo probando'
WHERE foodtruck_id = 2;