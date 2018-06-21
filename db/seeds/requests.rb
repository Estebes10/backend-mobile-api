Request.create(
  code:        'SA',
  name:        'Solicitud de Auxilio',
  status:      true,
  description: 'Permitir al ciudadano enviar de manera sencilla e inmediata ' \
               'una petición desde el lugar de origen, evitando pérdida de ' \
               'tiempo en cuestionamientos o información complementaria.'
)

Request.create(
  code:        'REP',
  name:        'Reporte',
  status:      true,
  description: 'El Ciudadano puede emitir de manera directa y en línea ' \
               'cualquier circunstancia relacionada con mantenimientos de ' \
               'infraestructura, deficiencias en la prestación de servicios, ' \
               'o sobre la Actuación de servidores públicos.'
)

Request.create(
  code:        'INC',
  name:        'Incidencia',
  status:      true,
  description: 'Permite al Ciudadano comunicar de manera directa en el ' \
               'momento y desde el lugar de origen, cualquier evento en el ' \
               'que esté involucrado, sea testigo o lo identifique y que ' \
               'sea relacionado con: Eventos viales, Eventos de seguridad ' \
               'pública y Eventos de protección civil.'
)
