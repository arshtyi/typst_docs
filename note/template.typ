#import "@preview/ori:0.2.5": *

#let fonts = (
    main: "IBM Plex Serif",
    mono: "IBM Plex Mono",
    cjk: "Source Han Serif SC",
    emph-cjk: "Source Han Serif SC",
    math: "New Computer Modern Math",
    math-cjk: "Source Han Serif SC",
)

#set outline.entry(fill: repeat(gap: 0.15em)[#move(dy: -0.25em)[.]])
#counter(page).update(0)
#set page(footer: context if counter(page).get().at(0) != 0 { align(center, counter(page).display("I")) })
#show: ori.with(
    title: "Mathematics",
    author: "arshtyi",
    subject: "数学",
    semester: "2026 Spring",
    date: datetime.today(),
    maketitle: true,
    first-line-indent: auto,
    font: fonts,
    makeoutline: true,
    outline-depth: 3,
    size: 11pt,
    // theme: "dark",
    media: "print",
    lang: "zh",
    region: "cn",
)
#{
    set page(numbering: none, footer: none)
    align(center, heading(level: 1, numbering: none, outlined: false)[前言])
    [
        本笔记基于模板#link("https://typst.app/universe/package/ori", "ori"),使用 #link("https://github.com/adobe-fonts/source-han-serif", "Source Han Serif") 和 #link("https://github.com/IBM/plex", "IBM Plex") 字体,感谢所有贡献者!
    ]
    // v(1cm)
    align(right)[
        arshtyi\
        #link("mailto:arshtyi@foxmail.com")\
        #datetime.today().display("[year].[month].[day]")
    ]
    pagebreak()
    align(center, heading(level: 1, numbering: none, outlined: false)[符号说明])
    [#figure(three-line-table[ | 符号 | 意义 | | - | - |])<table:notation>]
}
#counter(page).update(1)
#set heading(numbering: numbly("Chapter {1:1}. ", "{2:1}. ", "{2}.{3:1}. ", ""))
#set page(footer: [
    *Mathematics*
    #h(1fr)
    #context counter(page).display("1", both: false)
])
#set enum(numbering: "1)")

= 线性代数基础
== 线性空间与内积空间
=== 线性空间
#definition(title: "数域")[
    设$FF$是一个包含$0$和$1$的数集,如果$FF$中任意两个数的和,差,积,商(除数不为$0$)仍在$FF$中,则称$FF$为一个数域(Field).
] <def:field>

#important-block[仅考虑实数域$RR$和复数域$CC$.]
