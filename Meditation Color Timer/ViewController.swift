//
//  ViewController.swift
//  Meditation Color Timer
//
//  Created by Joe Martin on 11/08/2019.
//  Copyright © 2019 Joe Martin. All rights reserved.
//
        
import UIKit
import AVFoundation
//import CoreHaptics
//import AudioToolbox

class ViewController: UIViewController {
    
  

    
    

	var audioPlayer: AVAudioPlayer?

	//let fileURL = Bundle.main.path(forResource: "Bell Ting", ofType: "wav")
    let getStarted = Bundle.main.path(forResource: "lets get thus started", ofType: "m4a")
    
	
	override var prefersHomeIndicatorAutoHidden: Bool {
		return true
	}

	//let save = UserDefaults.standard

	// Set timer variables
	var stopWatchTimer = Timer()
	var currentTime = 60
	var y = 60


	// Connect the outlets
	@IBOutlet weak var minutesLabel: UILabel!
	@IBOutlet weak var secondsLabel: UILabel!
	@IBOutlet weak var startButton: UIButton!
	@IBOutlet weak var pauseButton: UIButton!
	@IBOutlet weak var stopButton: UIButton!
	@IBOutlet weak var screenButton: UIButton!
	@IBOutlet weak var hideTimeLeft: UIButton!
	@IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var cloudsView: UIImageView!
    @IBOutlet weak var take1MinuteLabel: UILabel!
    

	// Connect and code the full screen view button action
	@IBAction func screenButtonTapped(_ sender: Any) {

		screenButton.alpha = 0
        screenButton.isEnabled = false
		hideTimeLeft.alpha = 1
        hideTimeLeft.isEnabled = true
		pauseButton.isHidden = false
		pauseButton.isEnabled = true
		stopButton.isHidden = false
		stopButton.isEnabled = true

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.pauseButton.alpha = 1
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.stopButton.alpha = 1
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.minutesLabel.alpha = 1
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.secondsLabel.alpha = 1
		}, completion: nil)
	}

	// Connect and code the full screen hide button action
	@IBAction func hideTapped(_ sender: Any) {

		hideTimeLeft.alpha = 0
        hideTimeLeft.isEnabled = false
		screenButton.alpha = 1
        screenButton.isEnabled = true
		pauseButton.isEnabled = false
		stopButton.isEnabled = false

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.pauseButton.alpha = 0
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.stopButton.alpha = 0
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.minutesLabel.alpha = 0
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.secondsLabel.alpha = 0
		}, completion: nil)
	}

	// Connect and code the start button action
	
    @IBAction func startTapped(_ sender: Any) {

        audioPlayer?.play()
           /// AudioServicesPlayAlertSound(SystemSoundID(1008))
          //  AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve,
            animations: {
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            }, completion: nil)
        

		screenButton.alpha = 1
        screenButton.isEnabled = true
		startButton.isEnabled = false
        startButton.alpha = 0
        
        UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                   self.take1MinuteLabel.alpha = 0.3
            }, completion: nil)

        UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            self.cloudsView.alpha = 0.3
            }, completion: nil)
        

		UIApplication.shared.isIdleTimerDisabled = true

		// Timer code
		stopWatchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
	}

	// Connect and code the pause button action
	@IBAction func pauseTapped(_ sender: Any) {

		pauseButton.isHidden = true
        pauseButton.isEnabled = false
		pauseButton.alpha = 0
		resumeButton.isHidden = false
		resumeButton.isEnabled = true
		resumeButton.alpha = 1
		hideTimeLeft.alpha = 0
        hideTimeLeft.isEnabled = false
		stopWatchTimer.invalidate()

	}

	// Connect and code the resume button action
	@IBAction func resumeTapped(_ sender: Any) {

		screenButton.alpha = 1
        screenButton.isEnabled = true
        hideTimeLeft.alpha = 0
        hideTimeLeft.isEnabled = false
		resumeButton.isHidden = true
        resumeButton.isEnabled = false
		resumeButton.alpha = 0
		stopButton.isHidden = true
        stopButton.isEnabled = false
		stopButton.alpha = 0

		UIView.animate(withDuration: 2, delay: 1, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.minutesLabel.alpha = 0
		}, completion: nil)

		UIView.animate(withDuration: 2, delay: 1, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.secondsLabel.alpha = 0
		}, completion: nil)

		UIApplication.shared.isIdleTimerDisabled = true

		stopWatchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
	}

	// Connect and code the stop button action
	@IBAction func stopTapped(_ sender: Any) {

		stopWatchTimer.invalidate()
        
        minutesLabel.alpha = 0
        secondsLabel.alpha = 0
        
        take1MinuteLabel.alpha = 1

		pauseButton.isHidden = true
        pauseButton.isEnabled = false
		pauseButton.alpha = 0
		stopButton.isHidden = true
        stopButton.isEnabled = false
		stopButton.alpha = 0
		resumeButton.isHidden = true
        resumeButton.isEnabled = false
		resumeButton.alpha = 0
		screenButton.alpha = 0
        screenButton.isEnabled = false
		hideTimeLeft.alpha = 0
        hideTimeLeft.isEnabled = false
		//startButton.isHidden = false
        startButton.isEnabled = true
        startButton.alpha = 1
        cloudsView.alpha = 1
        


		currentTime = 60
		y = 60

		minutesLabel.text = "01"
        //minutesLabel.alpha = 0
		secondsLabel.text = "00"
       // secondsLabel.alpha = 0

		UIApplication.shared.isIdleTimerDisabled = false

	}

	// Object C code for timer and code for actions within duration of active timer
	@objc func updateTime() {
        
        currentTime -= 1
        
        let s: Int = Int(currentTime) % 60
		let m: Int = Int(currentTime) / 60

		minutesLabel.text = String(format: "%02d", m)
		secondsLabel.text = String(format: "%02d", s)

		let x = y / 7

		if currentTime == 00 {
                
            
            
                AudioServicesPlayAlertSound(SystemSoundID(1008))
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))


            screenButton.isEnabled = false
            screenButton.alpha = 0
            hideTimeLeft.isEnabled = false
            hideTimeLeft.alpha = 0

            if y == 60 {
                
                currentTime = 60
                minutesLabel.text = "01"
                secondsLabel.text = "00"
                
            } else if y == 600 {

				currentTime = 600
				minutesLabel.text = "10"
				secondsLabel.text = "00"

			} else if y == 900 {

				currentTime = 900
				minutesLabel.text = "15"
				secondsLabel.text = "00"

			} else if y == 1200 {

				currentTime = 1800
				minutesLabel.text = "30"
				secondsLabel.text = "00"

			} else if y == 1800 {

				currentTime = 1800
				minutesLabel.text = "30"
				secondsLabel.text = "00"

			} else if y == 2700 {

				currentTime = 2700
				minutesLabel.text = "45"
				secondsLabel.text = "00"

			} else if y == 3600 {

				currentTime = 3600
				minutesLabel.text = "60"
				secondsLabel.text = "00"


			} else if y == 5400 {
				currentTime = 5400
				minutesLabel.text = "90"
				secondsLabel.text = "00"

			} else if y == 7200 {
				currentTime = 7200
				minutesLabel.text = "120"
				secondsLabel.text = "00"

			} else {
				currentTime = 300
				minutesLabel.text = "05"
				secondsLabel.text = "00"
				y = 1800
			}

			currentTime = 0

			minutesLabel.text = "00"
			secondsLabel.text = "00"
            
            AudioServicesPlayAlertSound(SystemSoundID(1008))
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            
            UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                self.cloudsView.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                self.take1MinuteLabel.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                           self.startButton.alpha = 1
                       }, completion: nil)
            
            
            screenButton.isEnabled = false
            screenButton.alpha = 0
            hideTimeLeft.isEnabled = false
            hideTimeLeft.alpha = 0
		
			pauseButton.isEnabled = false
            pauseButton.isHidden = true
            pauseButton.alpha = 0

			stopButton.isEnabled = false
            stopButton.isHidden = true
            stopButton.alpha = 0
            
			//startButton.isHidden = false
            startButton.isEnabled = true
			

			UIApplication.shared.isIdleTimerDisabled = false

			
            cloudsView.isHidden = false
            cloudsView.alpha = 1
			stopWatchTimer.invalidate()
		}
        
        if currentTime == y - x {

		
                AudioServicesPlayAlertSound(SystemSoundID(1008))
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            
			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 2) {

                AudioServicesPlayAlertSound(SystemSoundID(1008))
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))


			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 3) {
                AudioServicesPlayAlertSound(SystemSoundID(1008))
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))


			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 4) {
                AudioServicesPlayAlertSound(SystemSoundID(1008))
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            

			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 5) {
                AudioServicesPlayAlertSound(SystemSoundID(1008))
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))


			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 6) {
                AudioServicesPlayAlertSound(SystemSoundID(1008))
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))

            
            UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
                self.view.backgroundColor = #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)
			}, completion: nil)
		}
    }
    
    override func viewDidLoad() {
		super.viewDidLoad()

		do {
            
            if let fileURL = Bundle.main.path(forResource: "lets get thus started", ofType: "m4a") {

            
            
		//	if let fileURL = Bundle.main.path(forResource: "Bell Ting", ofType: "wav") {
				audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
			} else {
				print("No file with specified name exists")
			}
		} catch let error {
			print("Can't play the audio file failed with an error \(error.localizedDescription)")
		}

		minutesLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 100, weight: UIFont.Weight.ultraLight)
		secondsLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 100, weight: UIFont.Weight.ultraLight)

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}


