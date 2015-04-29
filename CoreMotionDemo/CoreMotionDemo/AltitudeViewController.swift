//
//  AltitudeViewController.swift
//  CoreMotionDemo
//
//  Created by 洪亞偉 on 15/4/24.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit
import CoreMotion
import CoreGraphics
import QuartzCore


class AltitudeViewController: UIViewController {

    var altimeter = CMAltimeter()
    var isStart = false
    
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var altitudeMax: UILabel!
    @IBOutlet weak var pressure: UILabel!



    var aMax:Float = 0
    
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
            sender.setTitle("Stop", forState: .Normal)
            isStart = true
            altimeter.startRelativeAltitudeUpdatesToQueue(NSOperationQueue.currentQueue()) {
                altiData, error in
                
                self.updateA(altiData.relativeAltitude)
                self.updateP(altiData.pressure)

            }
        } else {
            sender.setTitle("Start", forState: .Normal)
            isStart = false
            altimeter.stopRelativeAltitudeUpdates()
        }
        
    }
    
    func updateA(alti:NSNumber) {
        altitude.text = String(format: "%.2f m", alti.floatValue)
        if fabs(alti.floatValue) > aMax {
            aMax = fabs(alti.floatValue)
            altitudeMax.text = String(format: "%.2f m", aMax)
        }
        
    }
    
    func updateP(pres:NSNumber) {
        
        pressure.text = String(format: "%.2f KPa", pres.floatValue)
    }
    
    @IBAction func reset(sender: AnyObject) {
        

        aMax = 0
        
        altitude.text = "0"
        altitudeMax.text = "0"
        pressure.text = "0"
        
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
