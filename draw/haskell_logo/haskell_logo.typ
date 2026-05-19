#import "@preview/cetz:0.5.2"
#import cetz.draw: *

#set page(width: auto, height: auto)

#let display-outline = false
#let display-grids = false

#let grid-radius = 1
#let grid-color = rgb("666")

#let rangle-color = rgb(70, 58, 98)
#let lambda-color = rgb(95, 80, 135)
#let equals-color = rgb(150, 75, 144)

#let parallel(p1, p2, width, fill: none) = {
    let (x1, y1) = p1
    let (x2, y2) = p2

    let fill = if display-outline { none } else { fill }

    merge-path(fill: fill, if display-outline or fill == none {
        line(p1, p2)
        line(p1, (x1 + width, y1))
        line((x1 + width, y1), (x2 + width, y2))
        line(p2, (x2 + width, y2))
    } else {
        set-style(stroke: fill)
        line(p1, p2)
        line((x1 + width, y1), (x2 + width, y2))
        line(p1, (x1 + width, y1))
        line(p2, (x2 + width, y2))
    })
}

#let right-trapezoid(p1, p2, width, fill: none) = {
    let (x1, y1) = p1
    let (x2, y2) = p2

    let fill = if display-outline { none } else { fill }

    merge-path(fill: fill, if display-outline or fill == none {
        line(p1, p2)
        line(p1, (x1 + width, y1))
        line((x1 + width, y1), (x1 + width, y2))
        line(p2, (x1 + width, y2))
    } else {
        set-style(stroke: fill)
        line(p1, p2)
        line((x1 + width, y1), (x1 + width, y2))
        line(p1, (x1 + width, y1))
        line(p2, (x1 + width, y2))
    })
}

#let degree = 57deg

#let c = calc.cos(degree)
#let s = calc.sin(degree)

#let x(b) = b * c / 2
#let y(b) = b * s / 2

#let haskell-logo = cetz.canvas({
    set-style(stroke: 0.25pt + lambda-color)

    if display-grids {
        grid(
            (grid-radius, grid-radius),
            (-grid-radius, -grid-radius),
            stroke: grid-color,
        )

        for x in range(-grid-radius, grid-radius + 1) {
            for y in range(-grid-radius, grid-radius + 1) {
                content((x, y), text(size: 0.5em, fill: grid-color)[$(#x, #y)$])
            }
        }
    }

    let b = 5
    // "\"
    parallel((-x(b), y(b)), (x(b), -y(b)), 1, fill: lambda-color)
    // "/"
    parallel((0, 0), (-x(b), -y(b)), 1, fill: lambda-color)

    let offset = 1.5
    // "\"
    parallel((-x(b) - offset, y(b)), (0 - offset, 0), 1, fill: rangle-color)
    // "/"
    parallel((0 - offset, 0), (-x(b) - offset, -y(b)), 1, fill: rangle-color)

    let b = 1
    let ox = -0.435 + 1.5
    let oy = 0.42 + 0.25

    right-trapezoid((-x(b) + ox, y(b) + oy), (x(b) + ox, -y(b) + oy), 2.4, fill: equals-color)

    let ox = 0.435 + 1.5
    let oy = -0.42 - 0.25

    right-trapezoid((-x(b) + ox, y(b) + oy), (x(b) + ox, -y(b) + oy), 1.55, fill: equals-color)
})

#haskell-logo
