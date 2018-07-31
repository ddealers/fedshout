# Fedshout
## Setup
1. `$ bundle install`
2. `$ rake db:create`
3. `$ rake db:migrate`
4. `$ rails s`

## Cómo usarlo?
### Listar todos los diputados
`/members`

### Detalle del diputado por su ID
`/members/:id`

### Listar todos los partidos
`/groups`

### Diputados que pertenecen a un partido
`/groups/:group_id/members`

### Listar o filtrar todos los distritos por *cabecera* y *número*
#### Params
* @cabecera    nombre de la cabecera(p.e. Toluca, Ecatepec, Mérida)
* @distrito    número de distrito

`/districts`

### Detalle del Distrito, Número y Cabecera
`/districts/:id`

### Diputado que corresponde a un distrito
`/districts/:district_id/member`

### Listar todos los estados
`/entities`

### Diputados que corresponden a un estado
`/entities/:entity_id/members`