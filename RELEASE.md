Dokumentation für den Release Prozess des KIS Systems.

*Bitte beachte das du ein Git Remote Branch mit dem Namen `origin` einrichten musst. Der Branch muss auf das Github Repo des KIS verweisen!*

- [] Stelle sicher das lokal *alle* Tests fehlerfrei durchlaufen werden
  - Übersprungene Tests werden im Moment noch akzeptiert
  - [] `rails test:system test` Rails Integrationstests gefolgt von den Minitest Unit Tests aufrufen. Sind diese fehlerfrei?
  - [] `rspec` Rspec Tests fehlerfrei?
- [] `git checkout release` wechsele in den Release Branch
- [] `git merge --no-ff development` merge den lokalen `development` Branch
- [] `git tag vN.N.N` Tagge die Version
- [] `rake release:bump_version && git commit -a -m "Update Version"` aktualisiere die Version im KIS
- [] `git push`
- [] Deploy in die `staging` Umgebung
  - [] `cap staging deploy` erfolgreich?
- [] wechsel in den Master Branch
- [] `git merge --no-ff release` merge den lokalen `release` Branch
- [] `git push`
  - [] `cap production deploy` erfolgreich?
