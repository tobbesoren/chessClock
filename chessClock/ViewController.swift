//
//  ViewController.swift
//  chessClock
//
//  Created by Tobias Sörensson on 2023-03-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeEdit: UITextField!
    @IBOutlet weak var countdown1: UILabel!
    @IBOutlet weak var countdown2: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var secondsLeftOne : Int = 15
    var secondsLeftTwo : Int = 15
   
    var clockOne : Clock?
    var startTimeOne : Date?
    var stopTimeOne : Date?
    
    var clockTwo : Clock?
    var startTimeTwo : Date?
    var stopTimeTwo : Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        clockOne = Clock(secondsLeft: secondsLeftOne, countdown: countdown1, timeEdit: timeEdit)
        
        clockTwo = Clock(secondsLeft: secondsLeftTwo, countdown: countdown2, timeEdit: timeEdit)
        
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let clockOne,
           let clockTwo,
           //let timeEditText = timeEdit.text,
           let button {
            if !clockOne.isRunning && !clockTwo.isRunning {
                //secondsLeftOne = Int(timeEditText) ?? secondsLeftOne
                //clockOne.secondsLeft = secondsLeftOne
                clockOne.startTimer()
                button.setTitle("Stop", for: .normal)
                
            } else {
                clockOne.stopTimer()
                clockTwo.stopTimer()
                button.setTitle("Start", for: .normal)
            }
        }
    }
}

