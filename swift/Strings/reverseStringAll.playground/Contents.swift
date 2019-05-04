import UIKit
import XCTest

func reverseArrayReverse(_ str: String = "") -> String
{
    return String(str.reversed())
}

func reverseLoop(_ str: String? = nil) -> String?
{
    guard str != nil else {return nil}
    var result = ""
    for char in str!.reversed() {
        result += String(char)
    }
    return result
}
func reverseLoop2(_ str: String) -> String
{
    var result = ""
    for char in str {
        result = String(char) + result
    }
    return result
}

func reverseReduce(_ str: String) -> String
{
    return str.reduce("") { "\($1)" + $0 }
}
