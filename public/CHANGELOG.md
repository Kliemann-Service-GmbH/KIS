# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### geändert
- Seitennummerierung im Prüfprotokoll PDF wurde nicht richtig berechnet
- 

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
