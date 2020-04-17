# Changelog
Alle erwähnenswert Änderungen am Projekt werden in dieser Datei dokumentiert.
All notable changes to this project will be documented in this file.

Das Format der Datei basiert auf [Führe ein CHANGELOG](https://keepachangelog.com/de/1.0.0/),
außerdem befolgt dieses Projekt die [Semantische Versionierung](https://semver.org/lang/de/spec/v2.0.0.html)
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.8.8] 2020-04-17
### Sicherheitsupdate FIX
- Update 'ffi' Gem auf Version 1.12.2 (was 1.11.1)
- Update 'puma' Gem auf Version 3.12.4 (was 3.12.2)
## [0.8.7] 2020-02-26
### Sicherheitsupdate FIX
- Update 'nokogiri' Gem auf Version 1.10.8
### neu hinzugefügt
- Anlagen deaktivierbar
- Angebot erstellt Haken
## [0.8.6]
### Sicherheitsupdate FIX
- Update 'loofah' Gem auf Version 2.4.0
## [0.8.5] 2020-02-05
### Sicherheitsupdate FIX
- Update 'rack' Gem auf Version 2.1.2
- Update 'puma' Gem auf Version 3.12.2
## [0.8.4] 2020-02-05
### neu hinzugefügt
- Reparaturen, Liste der Anlagen mit 'Mängeln' oder 'nicht funktionstüchtig'
## [0.8.3] - 2019-12-19
### geändert
- Sensor Formular überarbeitet
  - Sortierung der Sensoren einheitlich
  - Breite der Sensor Nummer wurde erweitert
- Anlagen #show Ansicht überarbeitet
  - die HTML Ansicht sieht nun wieder wie das PDF Fomular aus
### neu hinzugefügt
- Anlagen können nun mit Status markiert werden
- Hintergrund und Titel der #show Ansicht
  - farbiger Hintergrund bei Anlage mit Mängeln oder Defekt
  - Button neben dem Titel (Name der Anlage) bei Mängeln oder Defekt

## [0.8.2] - 2019-11-28
### geändert
- automatische Tests mit Travis aktiviert (nur RSpec Tests)

## [0.8.1] - 2019-11-07
### geändert
- Leere Felder für Adresse und Kunde im Formular 'Neues Objekt'
- Zeilenumbruch im Prüfprotokoll Formular behoben
    Wurden mehr als 4 Alarmausgänge konfiguriert wurde der Umbruch wieder falsch
    berechnet.
## [0.8.0] - 2019-11-06
### geändert
- Prüfprotokoll PDF komplett neu aufgebaut
    Nachdem nun viele Änderungen in das Prüfprotokoll eingeflossen sind,
    ohne vorher einen genauen Plan zu haben, waren verschiedene Fehler
    aufgetreten. Der Seitenumbruch wurde an mehreren Stellen falsch berechnet.
    Außerdem wurde eine Versionsnummer an den Rand des Protokolls
    eingetragen. Zusammen mit der schon bestehenden Angaben wann das
    Protokoll erstellt wurde, kann nun genauer nachvollzogen werden wann ein
    Fehler im Protokoll das erste Mal auftritt.
- leere Felder in Gasarten
    Es sind jetzt leere Felder für Namen oder chemische Formel erlaubt
    Man kann nun zum Beispiel das Gas mit dem Namen R134a und einer leeren
    chmischen Formel erfassen.
    Vor dieser Änderung wurde beim nächsten Erfassen eines Gases, wieder mit
    einer leeren chemischen Formel, ein Fehler ausgegeben der sagte:
    "chemische Formel schon vergeben"  (2x leer wurde als gleich angesehen)
## [0.7.2] - 2019-10-24
### neu hinzugefügt
- Logik 'nächster Wechsel' im Sensor
    Der nächste Wechsel wird nun in einer Update Funktion behandelt.
    Ziel ist es das kürzere Wecheldatum zu behalten, wenn dieses manuell
    eingetragen wurde. Dabei aber auch die Automatik zu beachten, nach der
    der nächste Wechel automatisch ausgefüllt wird, wenn ein Einbaudatum
    erfasst und der Sensor Typ eine Standard Lebensdauer besitzt.
### geändert
- Sensoren Datenbankspalte umbenannt
    Die Sensoren Datenbank Spalte 'livetime'
    wurde in 'next_change_date' (Datum nächster Wechsel) umbenannt.
## [0.7.2] - 2019-10-22
### neu hinzugefügt
- diverse statische Webseiten
  - letzte Änderungenen http://kis.gaswarnanlagen.lan/changelog
  - Infos über das System http://kis.gaswarnanlagen.lan/about
  - Lizenzinformationen http://kis.gaswarnanlagen.lan/license
### geändert
- Seitennummerierung im Prüfprotokoll PDF wurde nicht richtig berechnet
- Fehlerhafter Seitenumbruch auf der ersten Seite
  - die Objekt- und Kundenadressen hatten eine fixe Höhe,
    bei langen Adressen wie zum Beispiel Max Plank (#1466) wurde ein
    fehlerhafter Seitenumbruch eingefügt. Die beiden Adresspalten werden nun
    nicht mehr beschränkt, die Felder nehmen sich dynamisch soviel Platz
    sie brauchen
- Änderungen im CHANGELOG werden nun in primär, in deutsch geführt
- Fehler im Adress Update behoben

## [0.7.1] - 2019-10-17
### Changed
- Prüfprotokoll PDF
  - Tabellen Layout verschoben für maximale Platzausnutzung
  - Legende unter dem Unterschriftenfeld erweitert
    die kurzen Tabellenköpfe werden nun ebenfalls erklärt
  - Sensoren Messbereich
    - hier war ein Darstellungsfehler wenn die Sensoren Werte Min und Max nicht
      in der Datenbank eingetragen waren. Es erschien einfach ein Minus Zeichen '-'
- englische Übersetzung verbessert
- alle automatischen Tests funktionieren nun wieder
### Removed
- Prüfprotokoll PDF
  - Spalte NP (Nullpunktabgleich) entfernt
  - Spalte GW (gewechselt) wird nicht mehr mit den Daten aus der Datenbank
    gefüllt. Diese Spalte bleibt somit immer leer auf dem PDF Ausdruck

## [0.7.0] - 2019-10-16
### Added
- Felder SensorTypen angepasst
    - SensorTypen haben nun Felder für die Lebensdauer eines Sensortypes sowie
      ein weiteres Feld für Beschreibungen (URLS ins Wiki oder ins Web)
- Autom. Update nächster Wechsel (livetime) Sensoren
    - Im Sensor Model wurde ein Callback implementiert der das Datum für den
      nächsten Wechsel automatisch ausfüllt. Es wird der Wert der Lebensdauer des
      SensorTypes (in Jahren) addiert und in das Feld 'nächster Wechsel'
      geschrieben
### Changed
- Ansichten "SI Einheiten", "Gasarten" und "SensorTypen" wurden verbessert
    - Die Erscheinung der Ansichten wurden vereinheitlicht.
      D.h. die Index, Show und Edit Views sehen nun alle ähnlich aus
- PDF Layout verbessert
    - Die Legenede (Zustand und Gehäusetyp) hat teilweise die Seitennummern
      überschrieben. Das wurde durch eine weiteren 'neue Seite' Logik behoben
- Sicherheitsupdate
    - einige verwendete Gems wurden im audit mit Sicherheitsproblemen gemeldet
- Fehlerbehebung
    - der Datenbankabgleich erzeugte Fehler beim Aufruf der Unit Tests
    - Datenbankabgleich in der Testumgebung deaktiviert
        - der Datenbankabgleich mit den Daten der EasyWinArt Datenbank wurde
          auch in der Testumgebung ausgeführt

## [0.6.1]
### Added
- Prüfprotokoll PDF angepasst
  - die Spalte "Gehäusetyp" wird mit den Daten der Datenbank gefüllt,
    das wurde in der letzten Version einfach vergessen
  - die Spalte "gewechselt" GW wird nun nicht mehr mit den Daten aus der
    Datenbank gefüllt
  - die Legende "Gehäusetyp" und "Zustand" (des Sensors) wurden unter die
    Unterschriftenfelder verschoben
  - die Legende "Zustand" (des Sensors) wurden die Buchstaben "O", "V" und
    "D" in Zahlen geändert um Verwechselungen
    mit "V" und einem Häckchen ✓ zu vermeiden

## [0.6.0]
### Added
- Gehäusetypen können nun für Sensoren erfasst werden
- Formularfelder für die Gehäusetypen der Sensoren sind nun im PDF Formular
- Im Prüfprotokoll PDF gibt es nun eine Legende für die Geäusetypen,
    sie sind unter den Sensoren zu finden
- Wartungsverträge können nun in einer eigenen Ansicht angezeigt werden.
- Dateiname PDF Prüfprotokoll
    Das Prüfprotokoll PDF besitzt nun ein default Dateinamen, sichtbar wenn man
    versucht das PDF Dokument zu speichern.
- Datenbankabgleich mittels eines Button
    Es ist nun möglich dem Datenabgleich von der Weboberfläche aus zu starten
- Deutsche Endpunkte zur leichten Erreichbarkeit der einzelnen Daten
    http://kis.gaswarnanlagen.lan/adressen
    http://kis.gaswarnanlagen.lan/gasarten
    http://kis.gaswarnanlagen.lan/geräte
    http://kis.gaswarnanlagen.lan/kunden
    http://kis.gaswarnanlagen.lan/objekte
    http://kis.gaswarnanlagen.lan/sensorarten
    http://kis.gaswarnanlagen.lan/si_einheiten
    http://kis.gaswarnanlagen.lan/wartungsverträge

## [0.5.9]
### Added
- Leuchtscheiben können nun den Anlagen zugewiesen werden.
- Rails interne Verschlüsselung für Passworte wird nun konsequent genutzt
    Das ist unteranderem für die Datenbanksyncronisierung wichtig
- beim manuellen Datenbank Update werden nun Adressen auch aktualisiert
    D.h. bestehende Adressen werden mit den Daten aus EasyWinArt überschrieben
    Die verbundenen Daten bleiben erhalten
- Alarmausgänge können in Anlagen erfasst werden
- Akkus können den Anlagen zugwiesen werden
- Akkus können nun auch den einzelnen Leuchtscheiben zugewiesen werden.

## [0.5.8]
### Added
- History von Notizen/ Bemerkungen können nun in den Anlagen gespeichert werden

### Changed
- Alle Datentypen können nun untereinander via Hyperlinks erreicht werden

### Removed
- Prüfprotokolle werden nun nicht mehr in einem seperaten Model/ in der
Datenbank gespeichert
