//
//  ViewController.swift
//  Clock App
//
//  Created by Alen Yakovlev on 1/31/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    var displayTime = 0.0
    
    var timerStarted = false
    
    var timeLeft: Timer!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    @IBOutlet weak var timer: UIDatePicker!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] (_) in
            
            let date = Date()
            let calendar = Calendar.current
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss"
            
            let currentTime = dateFormatter.string(from: date)
            let ampmhour = calendar.component(.hour, from: date)
            
            self.dateTimeLabel.text = currentTime
            
            if #available(iOS 13.0, *), ampmhour >= 12 && ampmhour < 24 {
                overrideUserInterfaceStyle = .dark
                timer.backgroundColor = .black
            } else {
                overrideUserInterfaceStyle = .light
                timer.backgroundColor = .white
            }
        }
    }
    
    func startCountDown() {
        displayTime = timer.countDownDuration
        btn.isHidden = true
        timeLeft = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        countdownLabel.text = "\(timeFormat(Int(displayTime)))"
        if displayTime != 0{
            displayTime -= 1
        }
        else {
            playAlarm()
            endCountdown()
        }
    
        
    }
    
    func endCountdown() {
        timeLeft.invalidate()
        
    }
    
    func playAlarm() {
        btn.isHidden = false
        btn.setTitle("Stop Music", for: .normal)
        let path = Bundle.main.path(forResource: "mixkit-rooster-crowing-in-the-morning-2462.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()
        } catch {
            print("couldn't load the file")
        }
    }
    
    func stopAlarm() {
        btn.setTitle("Start Timer", for: .normal)
        player?.stop()
    }
    
    
    func timeFormat(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds%60
        let minutes: Int = (totalSeconds/60)%60
        let hours: Int = (totalSeconds/3600)%60
        return String(format: "Time Remaining: %02d:%02d:%02d", hours, minutes,seconds)
    }
    
    @IBAction func startStopBTN(_ sender: Any) {
        if btn.titleLabel?.text == "Start Timer" {
            startCountDown()
        }
        else if btn.titleLabel?.text == "Stop Music" {
            stopAlarm()
        }
//        if timerStarted {
//            (sender as AnyObject).setTitle("Start Timer", for: .normal)
//            timerStarted = false
//        }
//        else {
//            (sender as AnyObject).setTitle("Stop Music", for: .normal)
//            startCountDown()
//
//
//        }
        
    }


}

