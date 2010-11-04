# language: de
Funktionalität: Status
Per kommandozeile soll mir der status meines Projekts gesagt werden.

  Szenariogrundriss: Status abfragen
    Wenn das Projekt ist <Status>
    Dann sollte der status <Ausgabe> sein

  Beispiele:
    | Status | Ausgabe |
    | red | Foo: Failed |
    | green | Foo: Success |
    | pending | Foo: Pending |