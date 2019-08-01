

# Start
## Datenbank

```bash
docker-compose up
rake db:create
rake db:migrate
rake db:seed
```

## Anhängigkeiten
## Ruby Anhängigkeiten (vor erstem Start)

```bash
bundle
```

## Javascript und CSS Anhängigkeiten (vor erstem Start)

```bash
yarn
```

# Deployment

Einmalig muss, auf jedem Capistano Ziel (staging, production), das `setup` target aufgerufen werden.
Zumindest wegen dem postgres Plugin https://github.com/capistrano-plugins/capistrano-postgresql

```
bundle exec cap stage setup
```


----


# Tools
## Version Number aktualisieren

```bash
rake zzeroo:create_version
```

## Live reload

Wärend der Entwicklung kann mit folgendem Befehl ein Live Reload im Browser aktiviert werden.

```bash
guard
```
