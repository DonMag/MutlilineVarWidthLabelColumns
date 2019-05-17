//
//  ViewController.swift
//  MultiColumnLabels
//
//  Created by Don Mag on 5/17/19.
//  Copyright © 2019 Don Mag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var headingData: [String] = ["", "", "", "", "",]
	var infoData: [String] = ["", "", "", "", "",]

	override func viewDidLoad() {
		super.viewDidLoad()

		// create a Stack View to hold the buttons
		let sv = UIStackView()
		sv.translatesAutoresizingMaskIntoConstraints = false
		sv.axis = .vertical
		sv.spacing = 12
		
		// add and constrain it to the view
		view.addSubview(sv)
		
		NSLayoutConstraint.activate([
			sv.widthAnchor.constraint(equalToConstant: 240.0),
			sv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			sv.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			])
		
		// create and add 10 buttons to the Stack View
		for i in 0..<10 {
			
			let b = UIButton()
			b.backgroundColor = .blue
			b.setTitleColor(.white, for: .normal)
			b.tag = i

			// top button title should be "Default"
			// other button titles will be "Variation 1" thru "Variation 8"
			b.setTitle(i == 0 ? "Default" : "Variation \(i)", for: .normal)
			
			b.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
			
			sv.addArrangedSubview(b)
			
		}
		
	}
	
	@objc func btnTapped(_ sender: Any?) -> Void {
		
		if let b = sender as? UIButton {
			
			if let vc = storyboard?.instantiateViewController(withIdentifier: "DemoVC") as? DemoViewController {
				
				// setup the Heading and Info arrays
				self.setLabelData(b.tag)
				
				// pass them into DemoVC
				vc.myHeadingData = headingData
				vc.myInfoData = infoData
				
				// set the "Variation Title Label" in DemoVC
				vc.variationTitle = b.tag == 0 ? "Default" : "Variation \(b.tag)"
				
				// push the DemoVC onto the Nav Controller
				self.navigationController?.pushViewController(vc, animated: true)
			}
			
		}
		
	}
	
	func setLabelData(_ i: Int) -> Void {
		
		headingData = [
			"Heading 1",
			"Heading 2",
			"Heading 3",
			"Heading 4",
			"Heading 5",
		]
		
		infoData = [
			"Info 1",
			"Info 2",
			"Info 3",
			"Info 4",
			"Info 5",
		]

		switch i {

		case 1:
			infoData[0] = "Short"
			infoData[1] = "Labels"
			infoData[2] = "min"
			infoData[3] = "width"
			infoData[4] = "20%"

		case 2:
			infoData[0] = "a bit wider than 20%"
			infoData[1] = "not long enough"
			infoData[2] = "to wrap,"
			infoData[3] = "but all"
			infoData[4] = "same width"

			
		case 3:
			infoData[1] = "This Info label is long enough to wrap"
			infoData[2] = "This Info label is longer and will wrap to multiple (probably 3) lines"
			infoData[3] = "Max width is 60%"
			infoData[4] = "again, all same width"

		case 4:
			headingData[1] = "Longer Heading labels"
			headingData[2] = "but not long"
			headingData[3] = "enough to wrap"
			
		case 5:
			infoData[0] = "A"
			infoData[1] = "B"
			infoData[2] = "C"
			infoData[3] = "D"
			infoData[4] = "E"
			headingData[1] = "Longer Heading labels"
			headingData[2] = "Longer Heading label which will wrap"
			headingData[3] = "This Heading label is longer and will wrap to multiple (probably 3 or more) lines"
			headingData[4] = "But the Info labels are still at min 20% width"

		case 6:
			infoData[1] = "Longer Info labels"
			infoData[2] = "but not long"
			infoData[3] = "enough to wrap"
			headingData[1] = "Longer Heading label"
			headingData[2] = "Longer Heading label which will wrap"
			headingData[3] = "This Heading label is longer and will wrap to multiple (probably 3 or more) lines"
			headingData[4] = "Wrapping is different due to the longer Info labels"

		case 7:
			infoData[0] = "Here is a bunch of text for the top Info label, just to show that we can use a lot of text but it wraps properly"
			infoData[1] = "This Info label is long enough to wrap"
			infoData[2] = "This Info label has embedded line-feeds.\n\nSo it will wrap\n\nAnd allow for paragraphs if desired."
			infoData[3] = "Not long enough to wrap"
			infoData[4] = "This is probably a more typical case, with short Headings and long Info labels"
			
		case 8:
			infoData[0] = "Info 1 - Now we have alternating long labels."
			infoData[2] = "Info 3 - Now we have alternating long labels."
			infoData[4] = "Info 5 - Now we have alternating long labels."
			headingData[1] = "Info 2 - Now we have alternating long labels."
			headingData[3] = "Info 4 - Now we have alternating long labels."
			
		case 9:
			infoData[0] = "Here is a bunch of text for the top Info label. This will be a bunch of nonsense... really, I'm just typing away so this label will have more text than any other label we've seen so far (well, in this demo app, anyway)."
			infoData[1] = "This Info label is long enough to wrap"
			infoData[2] = "This Info label has embedded line-feeds.\n\nSo it will wrap\n\nAnd allow for paragraphs if desired."
			infoData[3] = "Using embedded line-feeds can also be used for a:\n\n- list\n- of\n- specific\n- items\n\nOf course, that's just for demo purposes."
			infoData[4] = "As you can see, we now have plenty of wrapping on both sides, and on most devices this variation has enough text to show why this is all embedded in a scroll view."
			headingData[0] = "Heading label"
			headingData[1] = "Longer Heading label"
			headingData[2] = "Longer Heading label which will wrap"
			headingData[3] = "This Heading label is longer and will wrap to multiple (probably 3 or more) lines"
			headingData[4] = "This is the last example Heading"

		default:
			break
			
		}

	}
	
}
