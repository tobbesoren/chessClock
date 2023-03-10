//
//  ViewController.swift
//  chessClock
//
//  Created by Tobias Sörensson on 2023-03-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeEdit: UITextField!
    
    @IBOutlet weak var countdown: UILabel!
    
    //var isRunning = false
    //var timer : Timer?
    var secondsLeft : Int = 15
    //var timeSpent : Int = 0
    
    var startTime : Date?
    var stopTime : Date?
    var clockOne : Clock?
    
    
    
    //let formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //formatter.timeStyle = .medium
        clockOne = Clock(secondsLeft: secondsLeft, countdown: countdown, timeEdit: timeEdit)
        
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let clockOne {
            if clockOne.isRunning {
                clockOne.stopTimer()
            } else {
                //if let timeEditInt = Int(timeEdit.text ?? "120") {timeLeft = timeEditInt}
                //startTime = Date()
                //isRunning = true
                //startTimer()
                
                clockOne.startTimer()
            }
        }
    }
}

