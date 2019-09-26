# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
