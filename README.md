fedshout
========
### Listar todos los diputados
`http://fedshout.digitaldealers.mx/members`

### Detalle del diputado por su ID
`http://fedshout.digitaldealers.mx/members/:id`

### Listar todos los partidos
`http://fedshout.digitaldealers.mx/groups`

### Diputados que pertenecen a un partido
`http://fedshout.digitaldealers.mx/groups/:group_id/members`

### Listar o filtrar todos los distritos por *cabecera* y *número*
#### Params
* @cabecera    nombre de la cabecera(p.e. Toluca, Ecatepec, Mérida)
* @distrito    número de distrito

`http://fedshout.digitaldealers.mx/districts`

### Detalle del Distrito, Número y Cabecera
`http://fedshout.digitaldealers.mx/districts/:id`

### Diputado que corresponde a un distrito
`http://fedshout.digitaldealers.mx/districts/:district_id/member`

### Listar todos los estados
`http://fedshout.digitaldealers.mx/entities`

### Diputados que corresponden a un estado
`http://fedshout.digitaldealers.mx/entities/:entity_id/members`