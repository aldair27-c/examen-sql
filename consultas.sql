/* consulta productos y categoria*/

select p.nombre as producto, p.precio, c.nombre as categoria
from producto p join categoria c on p.categoria_fk=c.id;

/* consulta 2*/

select v.id, v.fecha, concat(c.nombre, ' ',c.apellido) as cliente,
concat(e.nombre, ' ',e.apellido) as empleado from venta v
join cliente c on v.cliente_fk=c.id
join empleado e on v.empleado_fk=e.id;

/*consulta 3*/
select c.nombre as categoria, count(p.id) as cantidad_producto
from categoria c join producto p on c.id=p.categoria_fk
group by c.nombre
order by cantidad_producto
desc;

/*consulta 4*/
select concat(e.nombre,' ',e.apellido) as empleado, count(v.id) as cantidad_ventas,
sum(v.total) as total_vendido from empleado e join venta v on e.id=v.empleado_fk
group by e.nombre, e.apellido,e.id
having sum(v.total) > 2000000;

/* consulta 5*/
select concat(c.nombre,' ',c.apellido) as cliente, count(v.id) as cantidad_ventas,
sum(v.total) as total_gastado from cliente c join venta v on c.id=v.cliente_fk
group by c.id, c.nombre,c.apellido
order by total_gastado desc;