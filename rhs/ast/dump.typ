#import "ast.typ": dump

#set page(
    paper: "a4",
    margin: 8mm,
    numbering: "1",
)
#set text(font: "DejaVu Sans Mono", size: 10pt, lang: "en")
#show: dump
#set page(
    paper: "a5",
    margin: (x: 14mm, y: 12mm),
    fill: rgb("#fffaf0"),
    numbering: "1",
)
#set text(font: "Libertinus Serif", size: 10pt, lang: "en")
#set heading(numbering: "1.1")
#set par(justify: true, leading: 0.62em)
#set list(marker: ([--], [+], [>]))
#show raw: set text(font: "DejaVu Sans Mono", fill: rgb("#334155"), size: 8pt)
#show link: set text(fill: rgb("#1d4ed8"))

#let swatch(color, name) = box(
    width: 100%,
    inset: 5pt,
    fill: color,
    stroke: 0.5pt + luma(45%),
    radius: 2pt,
)[#text(size: 8pt, weight: "bold", name)]

#let callout(title, body) = block(
    width: 100%,
    above: 0.6em,
    below: 0.8em,
    inset: 7pt,
    fill: rgb("#f8fafc"),
    stroke: (left: 2pt + rgb("#0f766e"), rest: 0.5pt + rgb("#cbd5e1")),
    radius: 2pt,
)[
    #text(weight: "bold", fill: rgb("#0f766e"))[#title]
    #v(4pt)
    #body
]

= Comprehensive Typst Element Demo <intro>

This file is intentionally broad: it includes text styling, nested blocks,
references, figures, tables, math, raw code, metadata, layout helpers, and
visual elements. It is compiled once as a normal document and once through the
recursive AST dumper.

The opening paragraph mixes _emphasis_, *strong text*, `raw code`,
#smallcaps[small caps], #underline[underlines], #overline[overlines],
#strike[deleted text], a #link("https://typst.app")[link], smart quotes like
"Typst", a footnote#footnote[Footnotes are content too. This one contains
    inline math $alpha + beta$.], and a reference back to @intro.

#callout("Captured style context")[
    The dump version should expose this callout as nested `block`, `text`,
    `space`, and `sequence` elements, while page and text settings appear as
    surrounding styled content.
]

== Lists And Terms

- A bullet item with #highlight(fill: rgb("#fef08a"))[highlighted text].
- A nested list:
    - inline math $a^2 + b^2 = c^2$
    - a hard line break \
        followed by more content
    - a hidden element: #hide[not visible, still content]
- A final bullet containing a custom #box(
        fill: white,
        stroke: 0.4pt + rgb("#94a3b8"),
        inset: 3pt,
        radius: 2pt,
    )[inline box].

+ Numbered item one.
+ Numbered item two with nested content.
+ Numbered item three referencing @intro.

/ Term list:
    A description entry created with Typst markup syntax.
/ Another term:
    The description contains #link("https://typst.app/docs/")[documentation].

== Math Coverage

Inline math: $ sum_(i=1)^n i = n(n+1) / 2 $.

$ integral_0^1 x^2 dif x = 1 / 3 $

$ mat(1, 2, 3; 4, 5, 6; 7, 8, 9) dot vec(a, b, c) $

$
    cases(
        x^2 & "if " x >= 0,
        -x & "otherwise",
    )
$

== Tables And Grids

#table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.35pt + rgb("#94a3b8"),
    inset: 5pt,
    align: (left, left, left),
    table.header([Element], [Construct], [Why it is useful]),
    [Text], [_emph_ + [ / ] + *strong*], [inline wrappers and sequences],
    [Math], [$ root(3, x) + frac(1, y) $], [equation body fields],
    [Box], [#box(fill: rgb("#e0f2fe"), inset: 3pt)[boxed]], [layout fields],
    [Raw], [`#let x = 1`], [raw text element],
)

#grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 5pt,
    swatch(rgb("#fee2e2"), "red"),
    swatch(rgb("#dcfce7"), "green"),
    swatch(rgb("#dbeafe"), "blue"),
    swatch(rgb("#fef3c7"), "amber"),
)

#columns(2, gutter: 8pt)[
    Column one has a paragraph, a quote, and spacing.

    #quote(block: true, attribution: [Ada])[
        A block quote is useful for checking nested optional fields.
    ]

    #v(0.5em)

    Column two includes aligned content:

    #align(center)[#box(
        fill: rgb("#ede9fe"),
        inset: 5pt,
        radius: 2pt,
    )[centered]]
]

== Figures And Visuals

#figure(
    grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 6pt,
        rect(width: 100%, height: 22pt, fill: gradient.linear(rgb("#fef3c7"), rgb("#bfdbfe"))),
        circle(radius: 11pt, fill: rgb("#bbf7d0"), stroke: 0.6pt + rgb("#166534")),
        ellipse(width: 100%, height: 22pt, fill: rgb("#fecaca"), stroke: 0.6pt + rgb("#991b1b")),
    ),
    caption: [A generated shape gallery with a gradient rectangle.],
)<fig:shapes>

See @fig:shapes for a figure reference.

#place(top + right, float: true)[
    #box(fill: rgb("#111827"), inset: 4pt, radius: 2pt)[
        #text(fill: white, size: 7pt)[floating]
    ]
]

== Raw, Metadata, And Data

```typst
#let fib(n) = if n <= 1 { n } else { fib(n - 1) + fib(n - 2) }
#fib(6)
```

#let sample-data = (
    project: "typst-ast",
    tags: ("content", "fields", "yaml"),
    flags: (visible: true, depth: 4),
)

#metadata(sample-data) <demo-meta>

The metadata at <demo-meta> stores a dictionary value. The dump output should
show that dictionary recursively rather than as a single opaque string.
