import UIKit


let numberOfDoors = 3
let numberOfGames = 1000
var doors = Array(repeating: "🐐", count: numberOfDoors)
let randomDoor = Int.random(in: 0..<doors.count)
doors[randomDoor] = "🚗"

var switchWins = 0
var stayWins = 0

for _ in 0 ..< numberOfGames {
  let randomChoice = Int.random(in: 0..<doors.count)
  let prize = doors[randomChoice]
  if prize == "🚗" {
    stayWins += 1
  } else {
    switchWins += 1
  }
}

print("Stay:", stayWins)
print("Switch:", switchWins)

