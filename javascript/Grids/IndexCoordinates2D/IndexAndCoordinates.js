export function indexFrom(x, y, columns) {
    return (y * columns) + x
}

export function xyFrom(index, columns, rows) {
    const x = parseInt(index % columns)
    const y = parseInt(((index - x) / columns))
    return {x: x, y: y}
}





