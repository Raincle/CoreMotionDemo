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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AMX = 0
        AMY = 0
        AMZ = 0
        RMX = 0
        RMY = 0
        RMZ = 0
        
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval = 0.2
    
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
    
    func outputA(data:CMAcceleration) {

        aLabelX.text = "\(data.x)"
        if fabs(data.x) > AMX {
            AMX = fabs(data.x)
            aMaxX.text = "\(AMX)"
        }
        
        aLabelY.text = "\(data.y)"
        if fabs(data.y) > AMY {
            AMY = fabs(data.y)
            aMaxY.text = "\(AMY)"
        }
        
        aLabelZ.text = "\(data.z)"
        if fabs(data.z) > AMZ {
            AMZ = fabs(data.z)
            aMaxZ.text = "\(AMZ)"
        }
    }
    
    func outputR(data:CMRotationRate) {
        
        rLabelX.text = "\(data.x)"
        if fabs(data.x) > RMX {
            RMX = fabs(data.x)
            rMaxX.text = "\(RMX)"
        }
        
        rLabelY.text = "\(data.y)"
        if fabs(data.y) > RMY {
            RMY = fabs(data.y)
            rMaxY.text = "\(RMY)"
        }
        
        rLabelZ.text = "\(data.z)"
        if fabs(data.z) > RMZ {
            RMZ = fabs(data.z)
            rMaxZ.text = "\(RMZ)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateRate(sender: UISlider) {
    }

    
    @IBAction func onSwitch(sender: AnyObject) {
    }

    
    @IBAction func reset(sender: AnyObject) {
    }
}

