#import "@preview/pointless-size:0.1.2": zh, zihao
#import "@preview/numbly:0.1.0": *

#let record(title, name, id, class, object, object-author, body) = {
    set page(paper: "a4")
    {
        set align(center)
        v(1fr)
        text(size: zh(3), font: "Noto Sans CJK SC", weight: "bold", title)
        v(1.5fr)
        set text(size: zh(-4), font: "Noto Serif CJK SC")
        table(
            align: (x, y) => if x == 0 { right } else if x == 1 { left },
            columns: (2cm, 6cm),
            stroke: none,
            [姓名], name,
            [学号], id,
            [班级], class,
        )
        v(1fr)
        pagebreak()
    }
    counter(page).update(1)
    set page(footer: context align(center, counter(page).display("1")))
    show heading.where(level: 1): set block(below: 12pt)
    set text(size: zh(-4), font: "Noto Serif CJK SC", top-edge: 0.8em, bottom-edge: -0.2em)
    align(center, text(size: zh(3), font: "Noto Sans CJK SC", weight: "bold")[寻访记录])
    set par(justify: true, first-line-indent: (amount: 2em, all: true), leading: .5em, spacing: 12pt)
    [
        寻访作品名称：#object

        寻访作品作者：#object-author

        寻访记录：
    ]
    linebreak()
    body
}

#let report(title, body) = {
    set page(paper: "a4")
    counter(page).update(1)
    set page(footer: context align(center, counter(page).display("1")))
    set text(font: "Noto Serif CJK SC")
    align(center, text(size: zh(3), weight: "bold", title))
    show heading: it => {
        show h.where(amount: .3em): none
        block(below: 12pt, text(font: "Noto Sans CJK SC", it))
    }
    set heading(numbering: numbly(
        "{1:一}、",
        "（{2:一}）",
        "{3:1}、",
    ))
    set text(size: zh(-4), top-edge: 0.8em, bottom-edge: -0.2em)
    set par(justify: true, first-line-indent: (amount: 2em, all: true), leading: .5em, spacing: 12pt)
    body
}
