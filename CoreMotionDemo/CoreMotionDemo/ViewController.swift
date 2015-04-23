//
//  ViewController.swift
//  CoreMotionDemo
//
//  Created by 洪亞偉 on 15/4/22.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var updateRate: UILabel!

    @IBOutlet weak var aLabelX: UILabel!
    @IBOutlet weak var aLabelY: UILabel!
    @IBOutlet weak var aLabelZ: UILabel!
    
    @IBOutlet weak var aMaxX: UILabel!
    @IBOutlet weak var aMaxY: UILabel!
    @IBOutlet weak var aMaxZ: UILabel!
    var AMX:Double!
    var AMY:Double!
    var AMZ:Double!
    
    @IBOutlet weak var rLabelX: UILabel!
    @IBOutlet weak var rLabelY: UILabel!
    @IBOutlet weak var rLabelZ: UILabel!

    @IBOutlet weak var rMaxX: UILabel!
    @IBOutlet weak var rMaxY: UILabel!
    @IBOutlet weak var rMaxZ: UILabel!
    var RMX:Double!
    var RMY:Double!
    var RMZ:Double!
    
    var motionManager = CMMotionManager()
    var isStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AMX = 0
        AMY = 0
        AMZ = 0
        RMX = 0
        RMY = 0
        RMZ = 0
        
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.accelerometerUpdateInterval = 0.5
        motionManager.gyroUpdateInterval = 0.5
    

        
    }
    
    func outputA(data:CMAcceleration) {

        aLabelX.text = String(format: "%.2f", data.x)
        if fabs(data.x) > AMX {
            AMX = fabs(data.x)
            aMaxX.text = String(format: "%.2f", AMX)
        }
        
        aLabelY.text = String(format: "%.2f", data.y)
        if fabs(data.y) > AMY {
            AMY = fabs(data.y)
            aMaxY.text = String(format: "%.2f", AMY)
        }
        
        aLabelZ.text = String(format: "%.2f", data.z)
        if fabs(data.z) > AMZ {
            AMZ = fabs(data.z)
            aMaxZ.text = String(format: "%.2f", AMZ)
        }
    }
    
    func outputR(data:CMRotationRate) {
        
        rLabelX.text = String(format: "%.2f", data.x)
        if fabs(data.x) > RMX {
            RMX = fabs(data.x)
            rMaxX.text = String(format: "%.2f", RMX)
        }
        
        rLabelY.text = String(format: "%.2f", data.y)
        if fabs(data.y) > RMY {
            RMY = fabs(data.y)
            rMaxY.text = String(format: "%.2f", RMY)
        }
        
        rLabelZ.text = String(format: "%.2f", data.z)
        if fabs(data.z) > RMZ {
            RMZ = fabs(data.z)
            rMaxZ.text = String(format: "%.2f", RMZ)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateRate(sender: UISlider) {
        updateRate.text = String(format: "%.2f", sender.value)
        motionManager.accelerometerUpdateInterval = Double(sender.value)
        motionManager.gyroUpdateInterval = Double(sender.value)
    }

    

    @IBAction func onSwitch(sender: UIButton) {
        if !isStart {
            isStart = true
            sender.setTitle("Stop", forState: UIControlState.Normal)
            
            if isStart {
                motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()) {
                    acceData, error in
                    
                    if (error != nil) {
                        println("Error: \(error)")
                    }
                    self.outputA(acceData.acceleration)
                }
                
                motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()) {
                    gyroData, error in
                    
                    if (error != nil) {
                        println("Error: \(error)")
                    }
                    self.outputR(gyroData.rotationRate)
                }
            }
            
        } else {
            isStart = false
            sender.setTitle("Start", forState: UIControlState.Normal)
            motionManager.stopAccelerometerUpdates()
            motionManager.stopGyroUpdates()
        }
    }

    
    @IBAction func reset(sender: AnyObject) {
        
        AMX = 0
        AMY = 0
        AMZ = 0
        RMX = 0
        RMY = 0
        RMZ = 0
        
        aMaxX.text = "0"
        aMaxY.text = "0"
        aMaxZ.text = "0"
        rMaxX.text = "0"
        rMaxY.text = "0"
        rMaxZ.text = "0"
        
        rLabelX.text = "0"
        rLabelY.text = "0"
        rLabelZ.text = "0"
        aLabelX.text = "0"
        aLabelY.text = "0"
        aLabelZ.text = "0"
        
        

        
    }
}

