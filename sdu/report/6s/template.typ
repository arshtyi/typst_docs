#import "@preview/numbly:0.1.0": numbly
#import "@preview/pointless-size:0.1.2": zh, zihao

#let fonts = ("Source Han Serif SC", "Noto Serif CJK SC")
#let title = "6S实践"
#let author = "arshtyi"
#let id = "821600046"
#let contact = link("mailto:arshtyi@foxmail.com")
#let email = link("mailto:arshtyi@foxmail.com")
#let date = datetime.today()

#set document(title: title, author: author, date: date)
#set text(font: fonts, size: zh(5), lang: "zh", region: "cn")
#set page(paper: "a4", margin: (x: 35pt, y: 35pt))
#{
    set page(header: context if counter(page).get().first() == 1 {
        text(size: zh(-5), stack(
            spacing: 0.2em,
            grid(
                columns: (1fr, 1fr),
                align(left)[资产与实验室管理处], align(right)[（实验室 6S 课程报告）],
            ),
            v(0.3em),
            line(length: 100%, stroke: 1pt + black),
        ))
    })
    align(center, {
        let underln(width, body) = box(
            width: width,
            stroke: (bottom: 0.5pt),
            outset: (bottom: 2pt),
            align(center, body),
        )
        v(20%)
        text(size: zh(2), weight: "bold")[实验室 6S 精益管理与实践(劳育)课程报告]
        v(20%)
        set text(size: zh(4))
        text("报告题目:" + underln(15em, title))
        v(1em)
        text("学生姓名:" + underln(15em, author))
        v(1em)
        text("学生学号:" + underln(15em, id))
        v(1em)
        text("联系方式:" + underln(15em, contact))
    })
    align(center + bottom, text(size: zh(4), date.display("[year] 年 [month] 月")))
    pagebreak()
}
#counter(page).update(1)
#set page(numbering: "1")
#{
    set text(size: zh(4))
    table(
        inset: 0.5em,
        align: left + horizon,
        columns: (auto, 1fr, auto, auto, 1fr),
        table.cell(rowspan: 2)[报告题目],
        table.cell(rowspan: 2, title),
        table.cell(rowspan: 2)[报告撰写人],
        [姓名], author,
        [E-mail], email,
    )
}
#set heading(numbering: numbly("{1:一}、", "{2:1}.", "({3:1})"))
#show heading.where(level: 1): it => {
    show h.where(amount: .3em): none
    it
}
#set par(justify: true, first-line-indent: (amount: 2em, all: true))
#let in-block(body) = {
    let is-level-1-heading(it) = (
        it.func() == heading
            and (
                it.at("level", default: none) == 1
                    or (it.at("offset", default: none) + it.at("depth", default: none) == 1)
            )
    )

    let text-block(it) = {
        v(0em, weak: true)
        block(
            width: 100%,
            inset: 1em,
            stroke: 1pt,
            breakable: true,
            it,
        )
    }

    let children = body.at("children", default: (body,))
    let content = ()
    let buf = ()

    for child in children {
        if is-level-1-heading(child) {
            if buf.len() > 0 {
                content.push(text-block(buf.join()))
                buf = ()
            }
            buf.push(child)
        } else if buf.len() > 0 {
            buf.push(child)
        } else {
            content.push(child)
        }
    }
    if buf.len() > 0 {
        content.push(text-block(buf.join()))
    }
    content.join()
}
#show: in-block

= 报告撰写主题与背景

= 6S 实验室管理体系核心内涵解析

= 实验室 6S 管理现场分析报告

= 现存不足的改进建议

= 6S 管理在宿舍、教室、家庭等场景的迁移应用构想

= 数智化背景下，数字化管理系统与 6S 结合的创新设想
