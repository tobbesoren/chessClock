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
    
    var secondsSet : Int = 15
    
   
    var clockOne : Clock?
    var startTimeOne : Date?
    var stopTimeOne : Date?
    
    var clockTwo : Clock?
    var startTimeTwo : Date?
    var stopTimeTwo : Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        clockOne = Clock(secondsLeft: secondsSet, countdown: countdown1, timeEdit: timeEdit, button: button)
        
        clockTwo = Clock(secondsLeft: secondsSet, countdown: countdown2, timeEdit: timeEdit, button: button)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunctionOne))
        
        countdown1.isUserInteractionEnabled = true
        countdown1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunctionTwo))
        
        countdown2.isUserInteractionEnabled = true
        countdown2.addGestureRecognizer(tap2)
    }
    
    @objc
    func tapFunctionOne(sender:UITapGestureRecognizer) {
        if let clockOne,
           let clockTwo {
            if clockOne.isRunning {
                clockOne.stopTimer()
                clockTwo.startTimer()
            }
        }
    }
    
    
    @objc
    func tapFunctionTwo(sender:UITapGestureRecognizer) {
        if let clockOne,
           let clockTwo {
            if clockTwo.isRunning {
                clockTwo.stopTimer()
                clockOne.startTimer()
            }
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let clockOne,
           let clockTwo,
           let timeEditText = timeEdit.text,
           let button {
            if !clockOne.isRunning && !clockTwo.isRunning {
                secondsSet = Int(timeEditText) ?? secondsSet
                clockOne.secondsLeft = secondsSet
                clockTwo.secondsLeft = secondsSet
                clockOne.startTimer()
                button.setTitle("Stop", for: .normal)
                countdown2.text = ""
                
            } else {
                clockOne.stopTimer()
                clockTwo.stopTimer()
                button.setTitle("Start", for: .normal)
            }
        }
    }
}

