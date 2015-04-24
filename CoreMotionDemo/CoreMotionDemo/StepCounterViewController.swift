//
//  StepCounterViewController.swift
//  CoreMotionDemo
//
//  Created by 洪亞偉 on 15/4/23.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit
import CoreMotion

class StepCounterViewController: UIViewController {

    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var cnt: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var floorsA: UILabel!
    @IBOutlet weak var floorsD: UILabel!
    
    var pedometer = CMPedometer()
    var startD: String!
    var endD: String!
    var isStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSwitch(sender: UIButton) {
        
        if !isStart {
            isStart = true
            sender.setTitle("Stop", forState: UIControlState.Normal)
            var currentDate = NSDate()
            var formatter = NSDateFormatter()
            formatter.dateFormat = "Y-M-d h:m:s"
            startD = formatter.stringFromDate(currentDate)
            startDate.text = startD
            endDate.text = "----->"
            pedometer.startPedometerUpdatesFromDate(currentDate){
                pedometerHandler in
                
                self.updateP(pedometerHandler.0)
            }
        } else {
            isStart = false
            sender.setTitle("Start", forState: UIControlState.Normal)
            
            pedometer.stopPedometerUpdates()
            if endDate.text != "0" {
                var currentDate = NSDate()
                var formatter = NSDateFormatter()
                formatter.dateFormat = "Y-M-d h:m:s"
                endD = formatter.stringFromDate(currentDate)
                endDate.text = endD
            }
        }
        
    }
    
    func updateP(pedo:CMPedometerData) {
        
        println(pedo.numberOfSteps)
        cnt.text = "\(pedo.numberOfSteps)"
        
        println(String(format: "%.2f m", Float(pedo.distance)))
        distance.text = String(format: "%.2f m", Float(pedo.distance))
        
        floorsA.text = "\(pedo.floorsAscended)"
        floorsD.text = "\(pedo.floorsDescended)"
        
    }

    @IBAction func reset(sender: UIButton) {
        startDate.text = "0"
        endDate.text = "0"
        cnt.text = "0"
        distance.text = "0"
        floorsA.text = "0"
        floorsD.text = "0"
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
