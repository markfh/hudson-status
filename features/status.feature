# language: de
Funktionalität: Status
Per kommandozeile soll mir der status meines Projekts gesagt werden.

Szenariogrundriss: Status abfragen
Wenn das Projekt <Status> ist
Dann sollte die Ausagabe <Ausgabe> sein

Beispiele:
| Status | Ausgabe |
| "red" | My Project: Failed |
| "blue" | My Project: Success |
| "blue_anime" | My Project: Pending |
| "red_anime" | My Project: Pending |
| "foo" | "My Project: Unknown foo" |

Szenario: Fehler abfangen
  Wenn das Projekt offline ist
  Dann sollte die Ausagabe Invalid XML enthalten