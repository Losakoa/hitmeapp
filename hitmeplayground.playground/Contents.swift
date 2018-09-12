import UIKit

var str = "Hello, playground"

var randomNumberGuess : Int = 0

func randomNumberToGuess() {
    randomNumberGuess = Int(arc4random_uniform(100))
}

randomNumberToGuess()


let ranNum1 : Int = 24

