#import "lib/intro.typ": data, tickbox, project_number, toc
#import "lib/todo.typ": todo, outline-todos
#import "@preview/wordometer:0.1.1": word-count, total-words
#import "@preview/sourcerer:0.2.1": code
#import "@preview/acrostiche:0.3.1": *

#let project_title = "DEIN TITEL HIER"
#let project_author = "Vinzenz Geisler"

// -------------------------------------------
// -------- General document settings --------
// -------------------------------------------
#set page(
  paper: "a4",
  margin: (left: 3cm, right: 2cm, top: 2.5cm, bottom: 2.5cm),
)

#set document(title: project_title, author: project_author)
#set heading(numbering: "1.1")
#set text(font: "Arial", size: 11pt, lang: "de")
#set par(justify: true, leading: 14pt)
#show heading: head => {
  set block(below: 16pt)
  head
}

#show par: p => {
  p
  set block(below: 24pt)
}
#set list(indent: 1cm)

#align(center, heading(
  project_title,
  outlined: false,
  numbering: none,
))

#h(2em)

#stack(
  // Adjust your project number here (1-4)
  project_number(1),
  data("vorgelegt am", "29.04.2024"),
  data("von", project_author),
  data("Martikelnr.", "G230XXXPI"),
  data("DHGE Campus", "Gera"),
  data("Studienbereich", "Technik"),
  data("Studiengang", "Praktische Informatik"),
  data("Kurs", "PIB23"),
  data("Ausbildungsstätte", "DB Systel GmbH"),
  data("Betreuer", "Martin Hack"),
  data("", "/")
)

#pagebreak()

//Seitenzahl Counter
#set page(
  numbering: "I",
  number-align: end
)
#counter(page).update(1)
#numbering("I")

// -----------------------------------
// ------- Inhaltsverzeichnis --------
// -----------------------------------
#toc()


// Format primary headings in bold.
#show outline.entry.where(
  level: 1
): it => {
  text(weight: "regular", it)
}
#pagebreak()


// -------------------------------------
// ------ Abbildungsverzeichnis --------
// -------------------------------------
#hide(
  heading("Abbildungsverzeichnis", numbering: none)
)
#outline(
  title: "Abbildungsverzeichnis",
  target: figure.where(kind: image)
  .or(figure.where(kind: raw))
)
#pagebreak()

// ----------------------------------
// ----- Tabellenverzeichnis --------
// ----------------------------------
#hide(
  heading("Tabellenverzeichnis", numbering: none)
)
#outline(
  title: "Tabellenverzeichnis",
  target: figure.where(kind: table)
)

#pagebreak()

// -------------------------------------
// ------ Abkürzungsverzeichnis --------
// ---------------------------------------


//sollte eigentlich weg
#heading(
  numbering: none,
  "Abkürzungsverzeichnis"
)
#init-acronyms((
  "ERP": ("Enterprise Resource Planning"),
  "B1": ("Business One"),
))
#print-index(
  title: "",
  sorted: "up",
  outlined: false,
  delimiter: ""
)



// Reset page counter and change format to numeric.
#set page(numbering: "1")
#counter(page).update(1)


s
// -----------------------
// ------- Inhalt --------
// -----------------------

//------- I --------
#include "/Abschnitte/Thema 1.typ"

//------- II --------


// To prevent headline to be on the last line of a page.

= Analyse
== Ist-Zustand
=== Mobile Anwendung
=== Web Services
=== Interaktion
== Soll-Zustand
== Handlungsbedarf
Nach voriger Auswertung ergeben sich grob folgende Anforderungen die bearbeitet werden müssen:
- Ananas
- Apfel
- Birne

= Technische Struktur
#figure(
  table(
    columns: (auto, 1fr, 1fr),
    inset: 9pt,
    align: left,
    [*Art*], [*Vorteile*], [*Nachteile*],

    "Art 1",
    list(indent: 0cm,
      [*Lorem!* \
      Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy.],
      [*Stet clita kasd* \
      At vero eos et accusam et justo duo dolores et ea rebum.]),
    list(indent: 0cm,
      [Gibt's nicht])
  ),
  caption: [Übersicht der Vor- und Nachteile],
) <kinds>

== Lorem ipsum
== Dolor sit

= Planung

= Umsetzung

= Finalisierung
== Unit-Tests
== Deployment

//
// -- Bibliography --
//

#set page(numbering: "A")
#counter(page).update(1)

#bibliography(
  "sources.bib",
  title: "Literaturverzeichnis",
  style: "csl/duale-hochschule-gera-eisenach-fussnote.csl"
)

#pagebreak()

//
// -- Declaration of honour --
//

#set page(numbering: none)
#pad(
  bottom: 1em,
  align(center, heading("Ehrenwörtliche Erklärung", numbering: none, outlined: false))
)

Ich erkläre hiermit ehrenwörtlich,

#enum(
  tight: false,
  spacing: 1em,

  [dass ich meine Projektarbeit/Studienarbeit/Bachelorarbeit mit dem Thema: \
  *#project_title* \
  ohne fremde Hilfe angefertigt habe,],

  [dass ich die Übernahme  wörtlicher Zitate aus der Literatur sowie die Verwendung der Ge-danken anderer Autoren an den entsprechenden Stellen innerhalb der Arbeit gekennzeichnet habe und],
  [dass ich meine Projektarbeit/Studienarbeit/Bachelorarbeit bei keiner anderen Prüfung vorgelegt habe.]
)
\
Ich bin mir bewusst, dass eine falsche Erklärung rechtliche Folgen haben wird.

#pad(
  top: 1.5cm,

  grid(
    columns: (1fr, 1fr),
    rows: (auto),
    gutter: 3pt,
    stack(
      spacing: 0.5em,
      line(length: 80%),
      "Ort, Datum"
    ),
    stack(
      spacing: 0.5em,
      line(length: 80%),
      "Unterschrift"
    ),
  )
)
