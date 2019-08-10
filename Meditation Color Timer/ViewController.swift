//
//  ViewController.swift
//  Meditation Color Timer
//
//  Created by Joe Martin on 24/11/2018.
//  Copyright © 2018 Joe Martin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{

	var audioPlayer: AVAudioPlayer?

	let fileURL = Bundle.main.path(forResource: "Bell Ting", ofType: "wav")

	


	override var prefersHomeIndicatorAutoHidden: Bool {
		return true
	}

	let save = UserDefaults.standard

	// Set timer variables
	var stopWatchTimer = Timer()
	var currentTime = 300
	var y = 300


	// Connect the outlets
	@IBOutlet weak var minutesLabel: UILabel!
	@IBOutlet weak var secondsLabel: UILabel!
	@IBOutlet weak var startButton: UIButton!
	@IBOutlet weak var pauseButton: UIButton!
	@IBOutlet weak var stopButton: UIButton!
	@IBOutlet weak var screenButton: UIButton!
	@IBOutlet weak var hideTimeLeft: UIButton!
	@IBOutlet weak var tenMinutes: UIButton!
	@IBOutlet weak var fifteenMinutes: UIButton!
	@IBOutlet weak var twentyMinutes: UIButton!
	@IBOutlet weak var thirtyMinutes: UIButton!
	@IBOutlet weak var fortyFiveMinutes: UIButton!
	@IBOutlet weak var sixtyMinutes: UIButton!
	@IBOutlet weak var ninetyMinutes: UIButton!
	@IBOutlet weak var hundredTwentyMinutes: UIButton!
	@IBOutlet weak var resetButton: UIButton!
	@IBOutlet weak var resumeButton: UIButton!
	@IBOutlet weak var homeButton: UIButton!
	@IBOutlet weak var warningLabel: UILabel!


	@IBAction func homeButtonTapped(_ sender: Any) {

		self.dismiss(animated: true, completion: nil)

	}

	@IBOutlet weak var makePurchaseLabel: UILabel!
	

	// Connect the time selected buttons



	@IBAction func tenMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
		//resetButton.isHidden = false
		currentTime = 600
		minutesLabel.text = "10"
		secondsLabel.text = "00"
		y = 600

	}

	@IBAction func fifteenMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
        //resetButton.isHidden = false
		currentTime = 900
		minutesLabel.text = "15"
		secondsLabel.text = "00"
		y = 900
	}

	@IBAction func twentyMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
        //resetButton.isHidden = false
		currentTime = 1200
		minutesLabel.text = "20"
		secondsLabel.text = "00"
		y = 1200
	}



	@IBAction func thirtyMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
        //resetButton.isHidden = false
		currentTime = 1800
		minutesLabel.text = "30"
		secondsLabel.text = "00"
		y = 1800
	}

	@IBAction func fortyFiveMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
        //resetButton.isHidden = false
		currentTime = 2700
		minutesLabel.text = "45"
		secondsLabel.text = "00"
		y = 2700
	}

	@IBAction func sixtyMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
        //resetButton.isHidden = false
		currentTime = 3600
		minutesLabel.text = "60"
		secondsLabel.text = "00"
		y = 300
	}

	@IBAction func ninetyMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
        //resetButton.isHidden = false
		currentTime = 5400
		minutesLabel.text = "90"
		secondsLabel.text = "00"
		y = 5400
	}

	@IBAction func hundredTwentyMinutes(_ sender: Any) {

		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
        resetButton.isHidden = true
        //resetButton.isHidden = false
		currentTime = 7200
		minutesLabel.text = "120"
		secondsLabel.text = "00"
		y = 7200
	}

	// Connect and code the reset button
	@IBAction func resetButtonTapped(_ sender: Any) {

		homeButton.isHidden = false
		homeButton.isEnabled = true
		homeButton.alpha = 1


		let save = UserDefaults.standard
		if save.value(forKey: "Purchase") == nil {

			makePurchaseLabel.isHidden = false
		}else{
			makePurchaseLabel.isHidden = true
		}


		warningLabel.isHidden = false
		warningLabel.alpha = 0.71


		UIView.animate(withDuration: 1,
					   delay:0.0,
					   options:[.curveEaseInOut, .autoreverse, .repeat],
					   animations: { self.warningLabel.alpha = 1 },
					   completion: nil)



		tenMinutes.isHidden = false
		fifteenMinutes.isHidden = false
		twentyMinutes.isHidden = false
		thirtyMinutes.isHidden = false
		fortyFiveMinutes.isHidden = false
		sixtyMinutes.isHidden = false
		ninetyMinutes.isHidden = false
		hundredTwentyMinutes.isHidden = false

		resetButton.isHidden = true
		startButton.isHidden = false

		stopWatchTimer = Timer()
		currentTime = 300
		y = 300
		minutesLabel.text = "05"
		secondsLabel.text = "00"



	}

	// Connect and code the full screen view button action
	@IBAction func screenButtonTapped(_ sender: Any) {

		screenButton.isHidden = true
		hideTimeLeft.isHidden = false
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

		hideTimeLeft.isHidden = true
		screenButton.isHidden = false
		pauseButton.isHidden = true
		pauseButton.isEnabled = false
		stopButton.isHidden = true
		stopButton.isEnabled = false

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.pauseButton.alpha = 0
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.stopButton.alpha = 0
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.minutesLabel.alpha = 0.0
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.secondsLabel.alpha = 0.0
		}, completion: nil)
	}

	// Connect and code the start button action
	@IBAction func startTapped(_ sender: Any) {

		audioPlayer?.numberOfLoops = 0
		audioPlayer?.play()


		screenButton.isHidden = false
		resetButton.isHidden = true
		startButton.isHidden = true
		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true
		homeButton.isHidden = true

		warningLabel.isHidden = true
		warningLabel.alpha = 0

		makePurchaseLabel.isHidden = true

		UIView.animate(withDuration: 1.5, delay: 3.0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.minutesLabel.alpha = 0.0
		}, completion: nil)

		UIView.animate(withDuration: 1.5, delay: 3.0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
			self.secondsLabel.alpha = 0.0
		}, completion: nil)

		UIApplication.shared.isIdleTimerDisabled = true

		// Timer code
		stopWatchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
	}

	// Connect and code the pause button action
	@IBAction func pauseTapped(_ sender: Any) {

		pauseButton.isHidden = true
		pauseButton.alpha = 0
		resumeButton.isHidden = false
		resumeButton.isEnabled = true
		resumeButton.alpha = 1
		hideTimeLeft.isHidden = true
		stopWatchTimer.invalidate()

	}

	// Connect and code the resume button action
	@IBAction func resumeTapped(_ sender: Any) {

		screenButton.isHidden = false
		resumeButton.isHidden = true
		resumeButton.alpha = 0
		stopButton.isHidden = true
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

		let save = UserDefaults.standard
		if save.value(forKey: "Purchase") == nil {

			makePurchaseLabel.isHidden = false
		}else{
			makePurchaseLabel.isHidden = true
		}

		stopWatchTimer.invalidate()

		pauseButton.isHidden = true
		pauseButton.alpha = 0
		stopButton.isHidden = true
		stopButton.alpha = 0
		resumeButton.isHidden = true
		resumeButton.alpha = 0
		//homeButton.isHidden = false
        homeButton.isHidden = true
		screenButton.isHidden = true
		hideTimeLeft.isHidden = true
		startButton.isHidden = false
		tenMinutes.isHidden = true
		fifteenMinutes.isHidden = true
		twentyMinutes.isHidden = true
		thirtyMinutes.isHidden = true
		fortyFiveMinutes.isHidden = true
		sixtyMinutes.isHidden = true
		ninetyMinutes.isHidden = true
		hundredTwentyMinutes.isHidden = true


		currentTime = 300
		y = 300

		minutesLabel.text = "05"
		secondsLabel.text = "00"

		UIApplication.shared.isIdleTimerDisabled = false

		view.backgroundColor = #colorLiteral(red: 0.7656575441, green: 0.001094937325, blue: 0.08541815728, alpha: 1)

		warningLabel.isHidden = false
		warningLabel.alpha = 0.7

		UIView.animate(withDuration: 1,
					   delay:0.0,
					   options:[.curveEaseInOut, .autoreverse, .repeat],
					   animations: { self.warningLabel.alpha = 1 },
					   completion: nil)

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

			audioPlayer?.numberOfLoops = 0
			audioPlayer?.play()

			screenButton.isHidden = true
			hideTimeLeft.isHidden = true
			homeButton.isHidden = true
			homeButton.alpha = 0
			tenMinutes.isHidden = false
			fifteenMinutes.isHidden = false
			twentyMinutes.isHidden = false
			thirtyMinutes.isHidden = false
			fortyFiveMinutes.isHidden = false
			sixtyMinutes.isHidden = false
			ninetyMinutes.isHidden = false
			hundredTwentyMinutes.isHidden = false
			minutesLabel.alpha = 1
			secondsLabel.alpha = 1

			if y == 600 {

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

			audioPlayer?.numberOfLoops = 0
			audioPlayer?.play()

			minutesLabel.text = "00"
			secondsLabel.text = "00"

			screenButton.isHidden = true
			hideTimeLeft.isHidden = true
			homeButton.isHidden = true
			homeButton.alpha = 0
			pauseButton.isEnabled = false
			stopButton.isEnabled = false
			resetButton.isHidden = false
			startButton.isHidden = true
			pauseButton.alpha = 0
			stopButton.alpha = 0
			tenMinutes.isHidden = true
			fifteenMinutes.isHidden = true
			twentyMinutes.isHidden = true
			thirtyMinutes.isHidden = true
			fortyFiveMinutes.isHidden = true
			sixtyMinutes.isHidden = true
			ninetyMinutes.isHidden = true
			hundredTwentyMinutes.isHidden = true

			UIApplication.shared.isIdleTimerDisabled = false

			view.backgroundColor = #colorLiteral(red: 0.7656575441, green: 0.001094937325, blue: 0.08541815728, alpha: 1)
			stopWatchTimer.invalidate()
		}



		if currentTime == y - x {

			//audioPlayer?.numberOfLoops = 1
			audioPlayer?.play()

			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 2) {

			//audioPlayer?.numberOfLoops = 2
			audioPlayer?.play()

			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 3) {
			//audioPlayer?.numberOfLoops = 3
			audioPlayer?.play()

			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.2639999986, green: 0.8349999785, blue: 0.3160000145, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 4) {
			//audioPlayer?.numberOfLoops = 4
			audioPlayer?.play()

			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.300999999, green: 0.7369999886, blue: 0.9750000238, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 5) {
			//audioPlayer?.numberOfLoops = 5
			audioPlayer?.play()

			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.01700000092, green: 0.1979999989, blue: 1, alpha: 1)
			}, completion: nil)
		}

		if currentTime == y - (x * 6) {
			//audioPlayer?.numberOfLoops = 6
			audioPlayer?.play()

			UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
				self.view.backgroundColor = #colorLiteral(red: 0.5789999962, green: 0.1280000061, blue: 0.5730000138, alpha: 1)
			}, completion: nil)
		}
	}


	override func viewDidLoad() {
		super.viewDidLoad()

		do {
			if let fileURL = Bundle.main.path(forResource: "Bell Ting", ofType: "wav") {
				audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
			} else {
				print("No file with specified name exists")
			}
		} catch let error {
			print("Can't play the audio file failed with an error \(error.localizedDescription)")
		}
		// Do any additional setup after loading the view, typically from a nib.

		minutesLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 100, weight: UIFont.Weight.ultraLight)
		secondsLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 100, weight: UIFont.Weight.ultraLight)

	}

	override func viewWillAppear(_ animated: Bool) {

		/*let save = UserDefaults.standard
		if save.value(forKey: "Purchase") == nil {

			tenMinutes.alpha = 0.5
			fifteenMinutes.alpha = 0.5
			twentyMinutes.alpha = 0.5
			thirtyMinutes.alpha = 0.5
			fortyFiveMinutes.alpha = 0.5
			sixtyMinutes.alpha = 0.5
			ninetyMinutes.alpha = 0.5
			hundredTwentyMinutes.alpha = 0.5

			tenMinutes.isEnabled = false
			fifteenMinutes.isEnabled = false
			twentyMinutes.isEnabled = false
			thirtyMinutes.isEnabled = false
			fortyFiveMinutes.isEnabled = false
			sixtyMinutes.isEnabled = false
			ninetyMinutes.isEnabled = false
			hundredTwentyMinutes.isEnabled = false

			makePurchaseLabel.isHidden = false



		} else {

			tenMinutes.alpha = 1
			fifteenMinutes.alpha = 1
			twentyMinutes.alpha = 1
			thirtyMinutes.alpha = 1
			fortyFiveMinutes.alpha = 1
			sixtyMinutes.alpha = 1
			ninetyMinutes.alpha = 1
			hundredTwentyMinutes.alpha = 1

			tenMinutes.isHidden = true
			fifteenMinutes.isHidden = true
			twentyMinutes.isHidden = true
			thirtyMinutes.isHidden = true
			fortyFiveMinutes.isHidden = true
			sixtyMinutes.isHidden = true
			ninetyMinutes.isHidden = true
			hundredTwentyMinutes.isHidden = true

			makePurchaseLabel.isHidden = true



		}*/

		UIView.animate(withDuration: 1,
					   delay:0.0,
					   options:[.curveEaseInOut, .autoreverse, .repeat],
					   animations: { self.warningLabel.alpha = 1 },
					   completion: nil)
	}



	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}


}

