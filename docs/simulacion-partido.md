# Simulación de referencia — Gigantes vs Rieleros

![Reporte del partido simulado](reporte-simulacion.png)

Formatos impresos de ejemplo: [Ejemplo_Gafetes_y_Comanda.pdf](Ejemplo_Gafetes_y_Comanda.pdf)

Partido de ejemplo para probar el **Control de Cubeteros** y como referencia de cómo se ven los cálculos.

- **Cargarlo en la app:** Configuración → **🧪 Cargar partido de ejemplo** (funciona en Claude y en Easypanel).
- **Datos crudos:** [`simulacion-partido.json`](simulacion-partido.json) (eventos, cubeteros y movimientos).
- Cada cubetero dejó un pago parcial de **$500** a media jornada; todos tienen depósito de $200.

## Resultado por cubetero

| # | Cubetero | Entregado | Devuelto | Vendido | Venta | Comisión | Debe pagar | Pagó | Resultado |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Juan Pérez | 90 | 6 | 84 | $5,250 | $609 | $4,641 | $4,641 efectivo | Liquidado |
| 2 | Luis Gómez | 66 | 8 | 58 | $2,960 | $360 | $2,600 | $2,400 efectivo + $200 tarjeta | Liquidado |
| 3 | Ana Ruiz | 102 | 5 | 97 | $3,910 | $446 | $3,464 | $3,464 efectivo | Liquidado |
| 4 | Pedro Martínez | 30 | 5 | 25 | $2,190 | $244 | $1,946 | $1,896 efectivo | **Faltan $50** |
| 5 | Carlos Díaz | 144 | 6 | 138 | $5,430 | $658 | $4,772 | $4,572 efectivo + $200 tarjeta | Liquidado |
| 6 | Miguel Torres | 120 | — | — | — | — | — | $500 parcial | **Sin corte** (sigue vendiendo) |

**Cortes cerrados (1–5):** venta $19,740 · comisiones $2,317 · a recibir $17,423 · recibido $17,373 · diferencia −$50.

## Fórmulas

- Vendido = entregado − devuelto
- Venta = vendido × precio
- Debe pagar = venta − comisión (vendido × comisión por pieza)
- Saldo = debe pagar − pagos (parciales + corte)

## Ejemplo de comanda (Pedro, #4)

| Producto | Lleva (X) | Regresa (◯) | Vendido |
|---|---|---|---|
| Cerveza clara $70 | 12 + 6 = 18 | 4 | 14 → $980 |
| Michelada $110 | 6 + 6 = 12 | 1 | 11 → $1,210 |

Venta $2,190 − comisión (14×$8 + 11×$12 = $244) = **$1,946**. Pagó $500 + $1,396 = $1,896 → **faltan $50**.

## Juego 2 (20 nov) — evento cerrado

| # | Cubetero | Entregado | Vendido | Venta | Comisión | Pagó |
|---|---|---|---|---|---|---|
| 1 | Juan Pérez | 132 | 130 | $10,500 | $1,180 | $9,320 (incluye $300 tarjeta) |
| 2 | Luis Gómez | 108 | 100 | $4,875 | $569 | $4,306 |
| 3 | Ana Ruiz | 114 | 107 | $4,745 | $532 | $4,213 |
| 4 | Pedro Martínez | 60 | 55 | $4,165 | $482 | $3,683 (incluye $300 tarjeta) |
| 5 | Carlos Díaz | 84 | 73 | $2,565 | $313 | $2,252 |
| 6 | Miguel Torres | 144 | 142 | $10,825 | $1,254 | $9,571 |

Total: venta $37,675 · comisiones $4,330 · neto recibido $33,345 · todos liquidados.

## Requisiciones simuladas

| Folio | Área | Concepto | Importe est. | Estado |
|---|---|---|---|---|
| REQ-0001 | Bebidas / Almacén | Resurtido de cerveza para serie vs Rieleros | $23,100.00 | Autorizada |
| REQ-0002 | Bebidas / Almacén | Hielo para los 3 juegos de la serie (URGENTE) | $4,200.00 | Autorizada |
| REQ-0003 | Mantenimiento | Reparación de luminarias en tribuna norte (URGENTE) | $13,000.00 | Por autorizar |
| REQ-0004 | Limpieza | Insumos de limpieza del mes | $11,490.00 | Por autorizar |
| REQ-0005 | Equipo deportivo | Pelotas y bates para práctica | $25,700.00 | Autorizada |
| REQ-0006 | Mercadotecnia | Playeras para lanzamiento en tribuna | $19,500.00 | Rechazada |
| REQ-0007 | Bebidas / Almacén | Vasos para micheladas | $5,450.00 | Por autorizar |
| REQ-0008 | Taquilla | Rollos para impresora de boletos | $1,100.00 | Borrador |
| REQ-0009 | Mantenimiento | Pintura de dugouts | $4,600.00 | Cancelada |

Si en el navegador ya existía una requisición con el mismo folio, las de ejemplo se recorren al siguiente número.
