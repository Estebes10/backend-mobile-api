solicitud = Request.find_by(code: 'SA')
reporte = Request.find_by(code: 'REP')
incidencia = Request.find_by(code: 'INC')

# Crea los 3 tipos de incidencias
Event.create(
  code:        'EV',
  name:        'Evento Vial',
  status:      true,
  description: 'Evento referente a accidentes de Tránsito, vehículos ' \
               'abandonados, conductores con conducta incorrecta, trayectos ' \
               'peligrosos o Zonas conflictivas.',
  request_id: incidencia.id
)

Event.create(
  code:        'ESP',
  name:        'Evento de Seguridad Pública',
  status:      true,
  description: 'Evento relacionado a Robos, Asaltos, Vandalismo, Personas y/o' \
               ' actividades sospechosas, aún cuandos estos sean considerados' \
               ' como insignificantes o de bajo impacto.',
  request_id: incidencia.id
)

Event.create(
  code:        'EPC',
  name:        'Evento de Protección Civil',
  status:      true,
  description: 'Evento relacionado con inundaciones, fugas de sustancias ' \
               'tóxicas y/o explosivas, animales peligrosos o abandonados, ' \
               'árboles riesgosos, incendios, construcciones deterioradas.',
  request_id: incidencia.id
)

# Crea los 3 tipos de reportes
Event.create(
  code:        'MIM',
  name:        'Mantenimiento en la infraestructura del Municipio',
  status:      true,
  description: 'Mantenimiento que aborda situaciones de luminarias, baches, ' \
               'semáforos, parques, jardines, accesos para discapacitados o ' \
               'señalización',
  request_id: reporte.id
)

Event.create(
  code:        'DPS',
  name:        'Deficiencia en la Prestación de Servicios',
  status:      true,
  description: 'Referente a la recolección de basura, suministro de agua, ' \
               'energía eléctrica, limpieza de calles y avenidas, transporte ' \
               'urbano o alcantarillado.',
  request_id: reporte.id
)

Event.create(
  code:        'ASP',
  name:        'Actuación de Servidores Públicos',
  status:      true,
  description: 'Reporte en relación a prepotencia, corrupción, negligencia, ' \
               'mala actitud, deficiencias en capacidades, agradecimientos y ' \
               'reconocimiento al buen desempeño.',
  request_id: reporte.id
)

# Crea los 3 tipos de solicitud de auxilio por default
Event.create(
  code:        'BP',
  name:        'Botón de Pánico',
  status:      true,
  description: 'Genera de manera automática una acción de auxilio al punto de' \
               ' origen de la solicitud, a la par de recabar información ' \
               'adicional sobre la situación.',
  request_id: solicitud.id
)

Event.create(
  code:        'AV',
  name:        'Apoyo Vial',
  status:      true,
  description: 'Requerimiento de ayuda por cuestiones relacionadas al vehículo'\
               ' del Ciudadano, como puede ser la falta de gasolina, ' \
               'ponchadura de neumático, necesidad de grua, seguridad en ' \
               'traslado.',
  request_id: solicitud.id
)

Event.create(
  code:        'ORG',
  name:        'Organismos',
  status:      true,
  description: 'Solicitud de intervención en situaciones de violencia ' \
               'intrafamiliar, indigentes, explotación laboral o maltrato ' \
               'animal.',
  request_id: solicitud.id
)
