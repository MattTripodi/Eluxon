//
//  ViewController.swift
//  Eluxon
//
//  Created by Matt Tripodi on 9/7/17.
//  Copyright © 2017 Matthew Tripodi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	// Outlets
	@IBOutlet weak var onOffLbl: UILabel!
	@IBOutlet weak var toggleBtn: UIButton!
	
	var switchStatus: SwitchStatus = .off
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func toggleBtnWasPressed(_ sender: Any) {
		switchStatus.toggle()
		if switchStatus == .off {
			toggleBtn.setImage(UIImage(named: "offBtn"), for: .normal)
			view.backgroundColor = #colorLiteral(red: 0.4078193307, green: 0.4078193307, blue: 0.4078193307, alpha: 1)
			onOffLbl.text = "🌚 OFF 🌚"
			onOffLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			toggleTorch(on: false)
		} else {
			toggleBtn.setImage(UIImage(named: "onBtn"), for: .normal)
			view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
			onOffLbl.text = "🌝 ON 🌝"
			onOffLbl.textColor = #colorLiteral(red: 0.4078193307, green: 0.4078193307, blue: 0.4078193307, alpha: 1)
			toggleTorch(on: true)
		}
	}
	
	// Function to toggle the flashlight on a iPhone
	func toggleTorch(on: Bool) {
		guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
		
		if device.hasTorch {
			do {
				try device.lockForConfiguration()
				
				if on == true {
					device.torchMode = .on
				} else {
					device.torchMode = .off
				}
				
				device.unlockForConfiguration()
			} catch {
				print("Torch could not be used")
			}
		} else {
			print("Torch is not available")
		}
	}
	
}

