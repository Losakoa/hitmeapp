//
//  ViewController.swift
//  hit me app
//
//  Created by Carlos Feliciano on 9/10/18.
//  Copyright © 2018 Carlos Feliciano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // vars
    var targetValue : Int = 0
    var sliderValue : Int = 50
    var difference : Int = 0
    var round : Int = 0
    var score : Int = 0
    var absDiff : Int = 0
    var scoreRightNow : Int = 0
    
    // outlets
    @IBOutlet weak var randomNumberGuess: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var currentRoundLabel: UILabel!
    @IBOutlet weak var scoreView: UILabel!
    
    
    
    
    
    // ViewDid Load shit goes here
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumberToGuess()
        
        // initialize an initial slider value when the screen loads
        initSlider()
        
        // currentRoundLabel.text = "\(round)"
        increaseRounds()
        
        getTheDiff()

        scoring()
        
    }
    
    
    
    
    
    

    // This is the hit me button
    @IBAction func alertUser(_ sender: UIButton) {
        
        alertPopup()
        increaseRounds()
        getTheDiff()
        scoring()
        
    }
    
    // this is the alert popup for the hit me button
    func alertPopup () {
        
        let message = "Slider Value: \(sliderValue)" +
        "\nThe actual value is: \(targetValue)" +
        "\nA difference of: \(difference)" +
        "\nPoints: \(scoreRightNow)"
        
        // setting alert up for the alertUser button
        let alert = UIAlertController(title: "Your guess", message: message, preferredStyle: .alert)
        
        // sets up the button associated with alert
        let alertButtonAction = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(alertButtonAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    // slider when slid - 0 to 100 and rounded
    @IBAction func sliderMoved(_ slider: UISlider) {
        initSlider()
    }
    
    
    @IBAction func restartGamePressed(_ sender: UIButton) {
        restartTheGame()
    }
    
    
    
    
    
    // generate a random num func
    func randomNumberToGuess() {
        // generate random number
        targetValue = Int.random(in: 1...100)
        
        // update the UI Label with random number
        randomNumberGuess.text = String(targetValue)
    }
    
    // function to initialize the slider
    func initSlider () {
        let roundedValue = slider.value.rounded()
        sliderValue = Int(roundedValue)
    }
    
    // increase round function
    func increaseRounds () {
        
        randomNumberToGuess()
        sliderValue = 50
        slider.value = Float(sliderValue)
        round += 1
        currentRoundLabel.text = "\(round)"
        
    }
    
    // if the slider is less than the target value
    // then the difference is target value minus slider value
    // if the slider is greater than the target value
    // then the difference is slider value minus target value
    
    func getTheDiff () {
        
        difference = targetValue - sliderValue
        if difference < 0 {
            difference = abs(difference)
        }
        
    }
    
    func restartTheGame () {
        
        round = 0
        score = 0
        increaseRounds()
        
    }
    
    func scoring () {
        
        scoreView.text = "\(score)"
        
        switch difference {
        
        case 0 ..< 10:
            score += 200
            scoreRightNow = 200
        case 10 ..< 20:
            score += 180
            scoreRightNow = 180
        case 30 ..< 40:
            score += 160
            scoreRightNow = 160
        case 40 ..< 50:
            score += 140
            scoreRightNow = 140
        case 50 ..< 60:
            score += 120
            scoreRightNow = 120
        case 60 ..< 70:
            score += 100
            scoreRightNow = 100
        case 70 ..< 80:
            score += 80
            scoreRightNow = 80
        case 80 ..< 90:
            score += 60
            scoreRightNow = 60
        case 90 ... 100:
            score += 40
            scoreRightNow = 40
        default:
            score += 20
            scoreRightNow = 20
            
        }
        
    }
    
}
    


