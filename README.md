# Start
## Datenbank

```bash
docker-compose up
rake db:create
rake db:migrate
# This application uses the 'seedbank' gem
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
Das PostgreSQL Plugin https://github.com/capistrano-plugins/capistrano-postgresql
installiert hier auf den Zielsystemen die Datenbank Konfiguration.

```
bundle exec cap stage setup
```


----


# Tools
## Version Number aktualisieren

```bash
rake release:bump_version
```

## Live reload

Wärend der Entwicklung kann mit folgendem Befehl ein Live Reload im Browser aktiviert werden.

```bash
guard
```

## Datenbank Import/ Export

```bash
rake db:pull[production,kis]
```

```bash
rake db:restore[production,development]
```

Danach ist es wichtig die Datenbank wieder in den development Modus zu versetzen

```bash
bin/rails db:environment:set RAILS_ENV=development
```

Außerdem kann es sein das nicht alle Migrationen in der soeben importierten Datenbank integriert wurden

```bash
rake db:migrate
```


# Lizenz


KIS - Kliemann-Service Info System
Copyright (c) 2019 Stefan Müller <s.mueller@zzeroo.com>

GNU GENERAL PUBLIC LICENSE
   Version 2, June 1991

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
