import UIKit

extension Double {
  struct Number {
    static var formatter = NumberFormatter()
  }
  var longWithoutGroupingStyle: String {
    Number.formatter.numberStyle = .decimal
    Number.formatter.usesGroupingSeparator = false
    let number = NSNumber(value: self)
    return Number.formatter.string(from :number) ?? description
  }
}

for i in 1 ... 13
{
  let arrayOfOnes = Array(repeating: "1", count: i)
  let combinedOnes = NSArray(array: arrayOfOnes).componentsJoined(by: "")
  if let doubleNumber = Double(combinedOnes)
  {
    let result:Double = doubleNumber*doubleNumber
    print("\(i): \(combinedOnes)x\(combinedOnes) = ", result.longWithoutGroupingStyle)
  }
}
