# obtiene los eventos creados previamente
evento_vial = Event.find_by(code: 'EV')
seguridad_publica = Event.find_by(code: 'ESP')
proteccion_civil = Event.find_by(code: 'EPC')

mantenimiento_infraestructura = Event.find_by(code: 'MIM')
deficiencia_servicios = Event.find_by(code: 'DPS')
actuacion_servidores_publicos = Event.find_by(code: 'ASP')

apoyo_vial = Event.find_by(code: 'AV')
boton_panico = Event.find_by(code: 'BP')
organismos = Event.find_by(code: 'ORG')

# Crea las situaciones dependiendo del subgénero (eventos)

#============================= Evento Vial ====================================#
Situation.create(
  code:          'ACT',
  name:          'Accidente de tránsito',
  status:        true,
  instantaneous: true,
  event_id:      evento_vial.id
)

Situation.create(
  code:          'VEA',
  name:          'Vehículos Abandonados',
  status:        true,
  instantaneous: false,
  event_id:      evento_vial.id
)

Situation.create(
  code:          'CCI',
  name:          'Conductores con Conducta Incorrecta',
  status:        true,
  instantaneous: true,
  event_id:      evento_vial.id
)

Situation.create(
  code:          'TPE',
  name:          'Trayectos peligrosos',
  status:        true,
  instantaneous: false,
  event_id:      evento_vial.id
)

Situation.create(
  code:          'ZOC',
  name:          'Zonas Conflictivas',
  status:        true,
  instantaneous: false,
  event_id:      evento_vial.id
)

#======================== Eventos de Seguridad Pública ========================#
Situation.create(
  code:          'ROB',
  name:          'Robos',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'ASA',
  name:          'Asaltos',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'VAN',
  name:          'Vandalismo',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'PAS',
  name:          'Personas y/o Actividades Sospechosas',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'ASE',
  name:          'Asesinato',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'SEC',
  name:          'Secuestro',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'RIN',
  name:          'Riñas',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'BLQ',
  name:          'Bloqueos',
  status:        true,
  instantaneous: true,
  event_id:      seguridad_publica.id
)

Situation.create(
  code:          'PSP',
  name:          'Perturbación de Seguridad Pública',
  status:        true,
  instantaneous: false,
  event_id:      seguridad_publica.id
)

#====================== Eventos de Protección Civil ===========================#
Situation.create(
  code:          'INU',
  name:          'Inundaciones',
  status:        true,
  instantaneous: false,
  event_id:      proteccion_civil.id
)

Situation.create(
  code:          'FST',
  name:          'Fugas de Sustancias Tóxicas y/o Explosivas',
  status:        true,
  instantaneous: true,
  event_id:      proteccion_civil.id
)

Situation.create(
  code:          'APA',
  name:          'Animales Peligrosos o Abandonados',
  status:        true,
  instantaneous: false,
  event_id:      proteccion_civil.id
)

Situation.create(
  code:          'ARI',
  name:          'Árboles Riesgosos',
  status:        true,
  instantaneous: false,
  event_id:      proteccion_civil.id
)

Situation.create(
  code:          'INC',
  name:          'Incendios',
  status:        true,
  instantaneous: true,
  event_id:      proteccion_civil.id
)

Situation.create(
  code:          'COD',
  name:          'Construcciones Deterioradas',
  status:        true,
  instantaneous: false,
  event_id:      proteccion_civil.id
)

Situation.create(
  code:          'AMB',
  name:          'Ambulancia',
  status:        true,
  instantaneous: true,
  event_id:      proteccion_civil.id
)

Situation.create(
  code:          'TIN',
  name:          'Tala Indebida',
  status:        true,
  instantaneous: false,
  event_id:      proteccion_civil.id
)

#=========== Mantenimiento de la Infraestructura del Municipio ================#
Situation.create(
  code:          'LUM',
  name:          'Luminarias',
  status:        true,
  instantaneous: false,
  event_id:      mantenimiento_infraestructura.id
)

Situation.create(
  code:          'BAC',
  name:          'Baches',
  status:        true,
  instantaneous: false,
  event_id:      mantenimiento_infraestructura.id
)

Situation.create(
  code:          'SEM',
  name:          'Semáforos',
  status:        true,
  instantaneous: false,
  event_id:      mantenimiento_infraestructura.id
)

Situation.create(
  code:          'PYJ',
  name:          'Parques y Jardines',
  status:        true,
  instantaneous: false,
  event_id:      mantenimiento_infraestructura.id
)

Situation.create(
  code:          'APD',
  name:          'Accesos para Discapacitados',
  status:        true,
  instantaneous: false,
  event_id:      mantenimiento_infraestructura.id
)

Situation.create(
  code:          'SEN',
  name:          'Señalización',
  status:        true,
  instantaneous: false,
  event_id:      mantenimiento_infraestructura.id
)

#================= Deficiencias en la Prestación de Servicios =================#
Situation.create(
  code:          'RDB',
  name:          'Recolección de Basura',
  status:        true,
  instantaneous: false,
  event_id:      deficiencia_servicios.id
)

Situation.create(
  code:          'SDA',
  name:          'Suministro de Agua',
  status:        true,
  instantaneous: false,
  event_id:      deficiencia_servicios.id
)

Situation.create(
  code:          'EEC',
  name:          'Energía Eléctrica',
  status:        true,
  instantaneous: false,
  event_id:      deficiencia_servicios.id
)

Situation.create(
  code:          'LDC',
  name:          'Limpieza de Calles',
  status:        true,
  instantaneous: false,
  event_id:      deficiencia_servicios.id
)

Situation.create(
  code:          'TUR',
  name:          'Transporte Urbano',
  status:        true,
  instantaneous: false,
  event_id:      deficiencia_servicios.id
)

Situation.create(
  code:          'ALC',
  name:          'Alcantarillado',
  status:        true,
  instantaneous: false,
  event_id:      deficiencia_servicios.id
)

#===================== Actuación de Servidores Públicos =======================#
Situation.create(
  code:          'PRE',
  name:          'Prepotencia',
  status:        true,
  instantaneous: false,
  event_id:      actuacion_servidores_publicos.id
)

Situation.create(
  code:          'COR',
  name:          'Corrupción',
  status:        true,
  instantaneous: false,
  event_id:      actuacion_servidores_publicos.id
)

Situation.create(
  code:          'NEG',
  name:          'Negligencia',
  status:        true,
  instantaneous: false,
  event_id:      actuacion_servidores_publicos.id
)

Situation.create(
  code:          'MAC',
  name:          'Mala Actitud',
  status:        true,
  instantaneous: false,
  event_id:      actuacion_servidores_publicos.id
)

Situation.create(
  code:          'DEC',
  name:          'Deficiencia en Capacidades',
  status:        true,
  instantaneous: false,
  event_id:      actuacion_servidores_publicos.id
)

Situation.create(
  code:          'ARB',
  name:          'Agradecimientos y Reconocimiento por buenos desempeños',
  status:        true,
  instantaneous: false,
  event_id:      actuacion_servidores_publicos.id
)

#================================== Apoyo Vial ================================#
Situation.create(
  code:          'FDG',
  name:          'Falta de Gasolina',
  status:        true,
  instantaneous: true,
  event_id:      apoyo_vial.id
)

Situation.create(
  code:          'PDN',
  name:          'Pinchadura de Neumáticos',
  status:        true,
  instantaneous: true,
  event_id:      apoyo_vial.id
)

Situation.create(
  code:          'NDG',
  name:          'Necesidad de Grúa',
  status:        true,
  instantaneous: true,
  event_id:      apoyo_vial.id
)

Situation.create(
  code:          'SET',
  name:          'Seguridad en Traslado',
  status:        true,
  instantaneous: true,
  event_id:      apoyo_vial.id
)

Situation.create(
  code:          'DDB',
  name:          'Descarga de Batería',
  status:        true,
  instantaneous: true,
  event_id:      apoyo_vial.id
)

#================================== Organismos ================================#
Situation.create(
  code:          'IVI',
  name:          'Intervención en Violencia Intrafamiliar',
  status:        true,
  instantaneous: false,
  event_id:      organismos.id
)

Situation.create(
  code:          'IND',
  name:          'Indigentes',
  status:        true,
  instantaneous: false,
  event_id:      organismos.id
)

Situation.create(
  code:          'EXL',
  name:          'Explotación Laboral',
  status:        true,
  instantaneous: false,
  event_id:      organismos.id
)

Situation.create(
  code:          'MAA',
  name:          'Maltrato Animal',
  status:        true,
  instantaneous: false,
  event_id:      organismos.id
)

#================================== Boton Pánico ==============================#
Situation.create(
  code:          'SBP',
  name:          'Botón de Pánico',
  status:        true,
  instantaneous: true,
  event_id:      boton_panico.id
)
