//
//  ProximtyViewController.swift
//  CoreMotionDemo
//
//  Created by 洪亞偉 on 15/4/23.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit

class ProximtyViewController: UIViewController {

    var isStart = false
    @IBOutlet weak var bCnt: UILabel!
    var blinkCnt = 0
    var device = UIDevice.currentDevice()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "proximityDidChange:", name: UIDeviceProximityStateDidChangeNotification, object: nil)
        // Do any additional setup after loading the view.
        println(device.batteryLevel)
        println(device.batteryState)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func proximityDidChange(notification:NSNotificationCenter) {
        if device.proximityState {
            println("Close")
            blinkCnt += 1
        } else {
            println("Far")
            bCnt.text = "\(blinkCnt)"
        }
    }

    @IBAction func onSwitch(sender: UIButton) {
        
        if !isStart {
            sender.setTitle("Stop", forState: .Normal)
            isStart = true
            device.proximityMonitoringEnabled = true
        } else {
            sender.setTitle("Start", forState: .Normal)
            isStart = false
            device.proximityMonitoringEnabled = false
        }
        
        
        var state = device.proximityState
        println(state)
    }

    @IBAction func reset(sender: AnyObject) {
        blinkCnt = 0
        bCnt.text = "0"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
