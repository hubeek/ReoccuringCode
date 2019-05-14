import {indexFrom, xyFrom } from './IndexAndCoordinates'

test('get xy from index in 3 by 4 grid', () => {
    expect(indexFrom(0,0,3)).toBeDefined()
})

test('get index from x,y 0,0 from 3 by 4 grid', () => {
    expect(xyFrom(0,3,4)).toBeDefined()
})

test('get indices from xy in 3 by 4 grid', () => {
    expect(indexFrom(0,0,3)).toEqual(0) // origin
    expect(indexFrom(2,0,3)).toEqual(2) // last of first row
    expect(indexFrom(0,1,3)).toEqual(3) // first of second row
    expect(indexFrom(2,3,3)).toEqual(11) // last cell
})

test('get xy from indices from 3 by 4 grid', () => {
    expect(xyFrom(0,3,4)).toEqual({x: 0, y: 0})
    expect(xyFrom(2,3,4)).toEqual({x: 2, y: 0})
    expect(xyFrom(3,3,4)).toEqual({x: 0, y: 1})
    expect(xyFrom(11,3,4)).toEqual({x: 2, y: 3})
})
