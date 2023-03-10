//
//  Clock.swift
//  chessClock
//
//  Created by Tobias Sörensson on 2023-03-10.
//

import Foundation
import UIKit


class Clock {
    var secondsLeft : Int = 0
    var startTime : Date?
    var timer : Timer?
    //let formatter : DateFormatter?
    var timeSpent : Int
    var isRunning : Bool
    var countdown : UILabel!
    var timeEdit: UITextField!
    var button: UIButton!
    
    init(secondsLeft: Int, countdown: UILabel!, timeEdit: UITextField!, button: UIButton!) {
        self.secondsLeft = secondsLeft
        self.timer = Timer()
        //self.formatter = formatter
        self.isRunning = false
        self.countdown = countdown
        self.timeEdit = timeEdit
        self.button = button
        self.timeSpent = 0
    }
    
    
    func startTimer() {
        setStartTime()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: runTimer(timer:))
        isRunning = true
        }
    
    
    func setStartTime() {
        startTime = Date()
    }
    
    
    func runTimer(timer : Timer) {
        
        if let startTime {
            timeSpent = (Int(Date().timeIntervalSince1970) - Int(startTime.timeIntervalSince1970))
        } else {return}
        
        if secondsLeft - timeSpent  > 0 {
            countdown.text = String(secondsLeft - timeSpent)
        } else {
            timer.invalidate()
            isRunning = false
            countdown.text = "TIME'S\nUP"
            button.setTitle("Start", for: .normal)
        }
    }
    
    
    func stopTimer() {
        
        secondsLeft -= timeSpent
        print(secondsLeft)
        //timeEdit.text = String(secondsLeft)
        isRunning = false
        timer?.invalidate()
    }
}
