//
//  main.swift
//  testMAgicSquares
//
//  Created by hjhubeek on 28/05/2019.
//  Copyright © 2019 nl.app-all.audiobus.testMidi. All rights reserved.
//


import Foundation

struct Point: CustomStringConvertible {
    var x: Int
    var y: Int
    
    init(_ _x: Int,
         _ _y: Int) {
        self.x = _x
        self.y = _y
    }
    
    var description: String {
        return "(\(x), \(y))\n"
    }
}
extension Point: Equatable,Comparable {
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    static func < (lhs: Point, rhs: Point) -> Bool {
        return lhs.y != rhs.y ? lhs.y < rhs.y : lhs.x < rhs.x
    }
}

class MagicSquare: CustomStringConvertible {
    var grid:[Int:Point] = [:]
    var number: Int!
    init(n:Int) {
        grid = [:]
        number = n
    }
    
    func createOdd() -> MagicSquare {
        //print("n \(number)")
        var x = 0
        var y = 0
        let middle = Int(number/2)
        x = middle
        grid[1] = Point(x,y)
        for i in 2 ... number*number {
            let oldXY = Point(x,y)
            x += 1
            y -= 1
            
            if x >= number {
                x = x - number
            }
            
            if y < 0 {
                y = y + number
            }
            var tempCoord = Point(x,y)
            
            if let _ = grid.firstIndex(where: { (k,v) -> Bool in
                v == tempCoord
            }) {
                x = oldXY.x
                y = oldXY.y + 1
                if y >= number {
                    y = y - number
                }
                tempCoord = Point(x,y)
            }
            grid[i] = tempCoord
            
        }
        return self
    }
    
    
    var description: String {
        var result = ""
        let sorted = sortedGrid()
        var i = 0
        for c in sorted {
            result += " \(c.key)"
            if c.key < 10 { result += " "}
            if c.key < 100 { result += " "}
            if c.key < 1000 { result += " "}
            if i%number==(number-1) { result += "\n"}
            i += 1
        }
        return result
    }
}

extension MagicSquare {
    func sortedGrid()->[(key:Int,value:Point)] {
        return grid.sorted(by: {$0.1 < $1.1})
    }
    
    func checkRows() -> (Bool, Int?)
    {
        var result = Set<Int>()
        var index = 0
        var rowtotal = 0
        for (cell, _) in sortedGrid()
        {
            rowtotal += cell
            if index%number==(number-1)
            {
                result.insert(rowtotal)
                rowtotal = 0
            }
            index += 1
        }
        return (result.count == 1, result.first ?? nil)
    }
    
    func checkColumns() -> (Bool, Int?)
    {
        var result = Set<Int>()
        var sorted = sortedGrid()
        for i in 0 ..< number {
            var rowtotal = 0
            for cell in stride(from: i, to: sorted.count, by: number) {
                rowtotal += sorted[cell].key
            }
            result.insert(rowtotal)
        }
        return (result.count == 1, result.first)
    }
    func checkDiagonals() -> (Bool, Int?)
    {
        var result = Set<Int>()
        var sorted = sortedGrid()
        
        var rowtotal = 0
        for cell in stride(from: 0, to: sorted.count, by: number+1) {
            rowtotal += sorted[cell].key
        }
        result.insert(rowtotal)
        rowtotal = 0
        for cell in stride(from: number-1, to: sorted.count-(number-1), by: number-1) {
            rowtotal += sorted[cell].key
        }
        result.insert(rowtotal)
        
        return (result.count == 1, result.first)
    }
}

func doMagicSquareFor(_ i:Int) {
    print("\ni \(i)\n")
    print(MagicSquare(n: i).createOdd())
    print("checked rows \(MagicSquare(n: i).createOdd().checkRows())")
    print("checked cols \(MagicSquare(n: i).createOdd().checkColumns())")
    print("checked diags \(MagicSquare(n: i).createOdd().checkDiagonals())")
}

//for i in stride(from: 3, to: 34, by: 2) {
//    doMagicSquareFor(i)
//}
doMagicSquareFor(3)


