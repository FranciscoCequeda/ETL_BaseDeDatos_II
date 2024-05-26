
-- Borrar las llaves foraneas de la tabla de hechos (fact_pedido)
ALTER TABLE fact_pedido DROP CONSTRAINT FK_fact_pedido_dim_tiempo;
ALTER TABLE fact_pedido DROP CONSTRAINT FK_fact_pedido_dim_empleado;
ALTER TABLE fact_pedido DROP CONSTRAINT FK_fact_pedido_dim_oficina;
ALTER TABLE fact_pedido DROP CONSTRAINT FK_fact_pedido_dim_cliente;
ALTER TABLE fact_pedido DROP CONSTRAINT FK_fact_pedido_dim_producto;

-- Borrar los registros de las tablas del data mart
TRUNCATE TABLE fact_pedido;
TRUNCATE TABLE dim_empleado;
TRUNCATE TABLE dim_oficina;
TRUNCATE TABLE dim_cliente;
TRUNCATE TABLE dim_producto;
TRUNCATE TABLE dim_tiempo;

-- Crear las llaves foraneas anteriormente eliminadas
ALTER TABLE fact_pedido ADD CONSTRAINT FK_fact_pedido_dim_tiempo FOREIGN KEY(fecha_pedido) REFERENCES dim_tiempo (id);
ALTER TABLE fact_pedido ADD CONSTRAINT FK_fact_pedido_dim_empleado FOREIGN KEY(id_empleado) REFERENCES dim_empleado (id_empleado);
ALTER TABLE fact_pedido ADD CONSTRAINT FK_fact_pedido_dim_oficina FOREIGN KEY(id_oficina) REFERENCES dim_oficina (id_oficina);
ALTER TABLE fact_pedido ADD CONSTRAINT FK_fact_pedido_dim_cliente FOREIGN KEY(id_cliente) REFERENCES dim_cliente (id_cliente);
ALTER TABLE fact_pedido ADD CONSTRAINT FK_fact_pedido_dim_producto FOREIGN KEY(id_producto) REFERENCES dim_producto (id_producto);