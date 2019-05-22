spring:
  profiles:
    active: @profileActive@

server:
  port: 8080
  servlet:
    context-path: /${tempMap.artifactId}

#mapper
mapper:
  not-empty: false
  style: camelhumpandlowercase
  safe-delete: true
  safe-update: true

