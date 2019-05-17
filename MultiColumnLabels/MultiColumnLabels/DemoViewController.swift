//
//  DemoViewController.swift
//  MultiColumnLabels
//
//  Created by Don Mag on 5/17/19.
//  Copyright © 2019 Don Mag. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {
	
	@IBOutlet var variationLabel: UILabel!
	@IBOutlet var theVerticalStackView: UIStackView!
	
	var variationTitle: String = "Default"
	
	var myHeadingData: [String] = ["", "", "", "", "",]
	var myInfoData: [String] = ["", "", "", "", "",]

	// we'll need to force multiple auto-layout passes
	// so this will count them and let us act accordingly
	var layoutCounter = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		variationLabel.text = variationTitle
		
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		// increment our counter
		layoutCounter += 1

		// if this is the First pass, set the Info labels
		// and tell auto-layout we need it to run again
		if layoutCounter == 1 {
			fillInfoLabels()
			view.setNeedsLayout()
			view.layoutIfNeeded()
		}

		// if this is the Second pass, set the Heading labels
		// and tell auto-layout we need it to run again
		if layoutCounter == 2 {
			fillHeadingLabels()
			view.setNeedsLayout()
			view.layoutIfNeeded()
		}

		// done forcing auto-layout updates, so reset layoutCounter
		// to do it again if the layout changes (such as with device rotation)
		if layoutCounter > 2 {
			layoutCounter = 0
		}

	}
	
	func fillInfoLabels() -> Void {
		
		// get an array of the "rows" of horizontal stack views
		let theStacks = theVerticalStackView.arrangedSubviews
		
		// fill in the Info labels
		for row in 0..<5 {
			if let thisRow = theStacks[row] as? UIStackView {
				if let thisInfoLabel = thisRow.arrangedSubviews[2] as? UILabel {
					thisInfoLabel.text = myInfoData[row]
					thisInfoLabel.invalidateIntrinsicContentSize()
				}
			}
		}
		
	}
	
	func fillHeadingLabels() -> Void {
		
		// get an array of the "rows" of horizontal stack views
		let theStacks = theVerticalStackView.arrangedSubviews
		
		// fill in the Heading labels
		for row in 0..<5 {
			if let thisRow = theStacks[row] as? UIStackView {
				if let thisHeadingLabel = thisRow.arrangedSubviews[0] as? UILabel {
					thisHeadingLabel.text = myHeadingData[row]
					thisHeadingLabel.invalidateIntrinsicContentSize()
				}
			}
		}
		
	}
	
}
