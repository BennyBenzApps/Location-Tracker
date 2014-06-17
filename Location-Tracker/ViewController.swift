//
//  ViewController.swift
//  LocationTracker
//
//  Created by Benjamin Lavin on 2014-06-09.
//  Copyright (c) 2014 Benjamin Lavin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet var location : UIPickerView
    @IBOutlet var label1 : UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let locationsArray = [
        "AWAY",
        "SICK",
        "VACATION",
        "ADMIN",
        "ARTS",
        "EXT"
    ]
    
    let locations = [
        "AWAY": "LUNCH/OFF CAMPUS",
        "SICK" : "SICK",
        "VACATION" : "VACATION",
        "ADMIN" : "Administration Building",
        "ARTS" : "Arts Building",
        "EXT" : "University Terrace"
    ]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return locationsArray.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String {
        label1.text = "You have chosen: \(locationsArray[row])"
        return locations["\(locationsArray[row])"]!
    }
    
    
    
    func updateMap(){
        var urlPath = "http://alpha.srv.ualberta.ca/rpi/submit/welcome.php?user=ben&location=lunch"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
}

