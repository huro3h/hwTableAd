//  ViewController.swift
//  hwTableAd
//  Created by satoshiii on 2016/05/11.
//  Copyright © 2016年 satoshiii. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

	@IBOutlet weak var tableWords: UITableView!
	
	var selectedIndex = -1
	var wordsList = ["C++","PHP","JavaScript","Swift","MySQL"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return wordsList.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		let cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
		cell.textLabel!.text = "\(wordsList[indexPath.row])"
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		selectedIndex = indexPath.row
		performSegueWithIdentifier("mySegue", sender: nil)
	}
		
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		var detailVC = segue.destinationViewController as! secVC
		secVC.selectedIndex = selectedIndex
		secVC.wordsList = self.wordsList
	}
	
	


	
	

//	override func didReceiveMemoryWarning() {
//		super.didReceiveMemoryWarning()
//	}
}

