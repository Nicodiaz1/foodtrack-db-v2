# FoodTrack — Base de datos

Modelo de base de datos relacional para gestionar una operación de food trucks:
ubicaciones, productos, pedidos y detalle de pedidos.

## Contenido
- `sql/EjercicioM2T1.sql` — creación del esquema y consultas.
- `sql/cambios.sql` — modificaciones / migraciones del modelo.
- `csvs/` — datos de carga: foodtrucks, locations, products, orders, order_items.
- `si-2.png` — diagrama del modelo entidad-relación.
- `test.ipynb` — pruebas de consultas.

## Tecnologías
SQL · Python (pandas) · Jupyter

## Cómo usar
1. Ejecutar `sql/EjercicioM2T1.sql` para crear el esquema.
2. Importar los CSV de `csvs/` a las tablas correspondientes.
3. Correr las consultas de análisis incluidas.
