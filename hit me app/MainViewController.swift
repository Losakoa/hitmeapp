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
    var targetValue = 0
    var currentValue = 0
    var difference = 0
    var round = 0
    var score = 0
    
    // outlets
    @IBOutlet weak var randomNumberGuess: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var currentRoundLabel: UILabel!
    @IBOutlet weak var scoreView: UILabel!
    
    
    
    
    
    // ViewDid Load shit goes here
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // set the
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
    }
    
    
    
    
    
    

    // This is the hit me button
    @IBAction func alertUser(_ sender: UIButton) {
        
        alertPopup()
        
    }
    
    // this is the alert popup for the hit me button
    func alertPopup () {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        let title : String
        if difference == 0 {
            title = "perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            points += 50
        } else if difference < 10 {
            title = "Pretty good."
        } else {
            title = "Way off!"
        }
        
        setSliderColors()
        
        let message = "Slider Value: \(currentValue)" +
        "\nThe actual value is: \(targetValue)" +
        "\nA difference of: \(difference)" +
        "\nPoints: \(points)"
        
        // setting alert up for the alertUser button
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // sets up the button associated with alert
        let alertButtonAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
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
    
    
    
    
    
    // function to initialize the slider
    func initSlider () {
        
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
    }
    
    // generate a random num func
    func randomNumberToGuess() {

        targetValue = Int.random(in: 1...100)

    }
    
    
    

    
    // if the slider is less than the target value
    // then the difference is target value minus slider value
    // if the slider is greater than the target value
    // then the difference is slider value minus target value
    
    
    func restartTheGame () {
        
        round = 0
        score = 0
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }
    
    
    func setSliderColors () {
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .normal)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightimage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightimage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    
    // increase round function
    func startNewRound () {
        
        round += 1
        randomNumberToGuess()
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels () {

        randomNumberGuess.text = String(targetValue)
        scoreView.text = String(score)
        currentRoundLabel.text = String(round)
        
    }
    
}
    


