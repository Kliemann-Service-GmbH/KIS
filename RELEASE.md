Dokumentation für den Release Prozess des KIS Systems.

*Bitte beachte das du ein Git Remote Branch mit dem Namen `origin` einrichten musst. Der Branch muss auf das Github Repo des KIS verweisen!*

- [] `git checkout development` in den 'development' Branch wechseln
- [] evtl. alle lokalen Branches in development Zweig mergen
- [] stelle sicher das lokal *alle* Tests fehlerfrei durchlaufen werden
    übersprungene Tests werden im Moment noch akzeptiert
  - [] `rails test:system test` Rails Integrationstests gefolgt von den Minitest Unit Tests aufrufen. Sind diese fehlerfrei?
  - [] `rspec` Rspec Tests fehlerfrei?
- draw.io *Optional*
  - [] draw.io Zeichnung Versionsnummer erhöhen
  - draw.io Zeichnung speichern
    - [] PDF
    - [] draw.io Format
  - [] `git commit -a -m "Update Version in Flowchart draw.io"`
- [] Changelog aktuell? Wurde die Datei 'CHANGELOG.md' mit allen wichtigen Änderungen am System gefüllt?
- [] Update der nächsten Version Nummer im 'CHANGELOG.md' https://keepachangelog.com/en/1.0.0/
  - [] aktuelles Tagesdatum neben der Version im 'CHANGELOG.md' stehen
  - [] `git commit -a -m "Update Changelog"`
- [] `git push` Branch ins remote Repo pushen
- [] `git checkout release` wechsele in den Release Branch
- [] `git merge --no-ff development` merge den lokalen 'development' Branch
- [] `git tag vN.N.N` Tagge die Version
- [] `rake release:bump_version && git commit -a -m "Update Version"` aktualisiere die Versionsnummer im KIS (Rails intern, liest die Git Tag Version aus)
- [] `git push`
- [] Deploy in die **staging** Umgebung
  - [] `cap staging deploy` erfolgreich?
- [] `git checkout master` wechsel in den Master Branch
- [] `git merge --no-ff release` merge den lokalen 'release' Branch
- [] `git push` Branch ins remote Repo pushen
- [] Deploy in die **production** Umgebung
  - [] `cap production deploy` erfolgreich?
