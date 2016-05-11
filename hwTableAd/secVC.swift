//  secVC.swift
//  hwTableAd
//  Created by satoshiii on 2016/05/11.
//  Copyright © 2016年 satoshiii. All rights reserved.

import UIKit
import GoogleMobileAds

class secVC: UIViewController, GADBannerViewDelegate {
	
	// AdMob ID を入れてください（定数に各項目を代入）
	let AdMobID = "ca-app-pub-3530000000000000/0123456789"
	let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
	let AdMobTest:Bool = true
	let SimulatorTest:Bool = true
	
	var wordsList: [String] = []

	@IBOutlet weak var myLabel: UILabel!
	@IBOutlet weak var myTextView: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
	
		var admobView: GADBannerView = GADBannerView()
		admobView = GADBannerView(adSize:kGADAdSizeBanner)
		
		admobView.frame.origin = CGPointMake(0, self.view.frame.size.height - admobView.frame.height)
		admobView.frame.size = CGSizeMake(self.view.frame.width, admobView.frame.height)
		
		admobView.adUnitID = AdMobID
		admobView.delegate = self
		admobView.rootViewController = self
		
		let admobRequest:GADRequest = GADRequest()
		
		if AdMobTest {
			if SimulatorTest {
				admobRequest.testDevices = [kGADSimulatorID]
			} else {
				admobRequest.testDevices = [TEST_DEVICE_ID]
			}
		}
		
		admobView.loadRequest(admobRequest)
		self.view.addSubview(admobView)
		
	}
	
	var selectedIndex = -1
	
	override func viewWillAppear(animated: Bool) {
		// print(selectedIndex)
		let r = (selectedIndex)
		var path = NSBundle.mainBundle().pathForResource("json", ofType: "txt")
		var jsondata = NSData(contentsOfFile: path!)
		let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as!
		NSArray
		
		myLabel.text = wordsList[r]
		myTextView.text = jsonArray[r] as! String
		
	}

	
	
	
//	override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
	


}
