//
//  MagnetoViewController.swift
//  CoreMotionDemo
//
//  Created by 洪亞偉 on 15/4/23.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit
import CoreMotion

class MagnetoViewController: UIViewController {

    @IBOutlet weak var updateRate: UILabel!
    
    @IBOutlet weak var mLabelX: UILabel!
    @IBOutlet weak var mLabelY: UILabel!
    @IBOutlet weak var mLabelZ: UILabel!
    
    @IBOutlet weak var mMaxX: UILabel!
    @IBOutlet weak var mMaxY: UILabel!
    @IBOutlet weak var mMaxZ: UILabel!
    var MMX:Double!
    var MMY:Double!
    var MMZ:Double!
    
    @IBOutlet weak var dLabelX: UILabel!
    @IBOutlet weak var dLabelY: UILabel!
    @IBOutlet weak var dLabelZ: UILabel!
    
    @IBOutlet weak var dMaxX: UILabel!
    @IBOutlet weak var dMaxY: UILabel!
    @IBOutlet weak var dMaxZ: UILabel!
    var DMX:Double!
    var DMY:Double!
    var DMZ:Double!
    
    var motionManager = CMMotionManager()
    var isStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MMX = 0
        MMY = 0
        MMZ = 0
        DMX = 0
        DMY = 0
        DMZ = 0

        // Do any additional setup after loading the view.
        
        motionManager.magnetometerUpdateInterval = 0.5
        motionManager.deviceMotionUpdateInterval = 0.5
    }
    
    func outputM(data:CMMagneticField) {
        
        mLabelX.text = String(format: "%.2f", data.x)
        if fabs(data.x) > MMX {
            MMX = fabs(data.x)
            mMaxX.text = String(format: "%.2f", MMX)
        }
        
        mLabelY.text = String(format: "%.2f", data.y)
        if fabs(data.y) > MMY {
            MMY = fabs(data.y)
            mMaxY.text = String(format: "%.2f", MMY)
        }
        
        mLabelZ.text = String(format: "%.2f", data.z)
        if fabs(data.z) > MMZ {
            MMZ = fabs(data.z)
            mMaxZ.text = String(format: "%.2f", MMZ)
        }
    }
    
    func outputD(data:CMAttitude) {
        
        dLabelX.text = String(format: "%.2f°", data.pitch*180/M_PI)
        if fabs(data.pitch*180/M_PI) > DMX {
            DMX = fabs(data.pitch*180/M_PI)
            dMaxX.text = String(format: "%.2f°", DMX)
        }
        
        dLabelY.text = String(format: "%.2f°", data.roll*180/M_PI)
        if fabs(data.roll*180/M_PI) > DMY {
            DMY = fabs(data.roll*180/M_PI)
            dMaxY.text = String(format: "%.2f°", DMY)
        }
        
        dLabelZ.text = String(format: "%.2f°", data.yaw*180/M_PI)
        if fabs(data.yaw*180/M_PI) > DMZ {
            DMZ = fabs(data.yaw*180/M_PI)
            dMaxZ.text = String(format: "%.2f°", DMZ)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateRate(sender: UISlider) {
        updateRate.text = String(format: "%.2f", sender.value)
        motionManager.magnetometerUpdateInterval = Double(sender.value)
        motionManager.deviceMotionUpdateInterval = Double(sender.value)
    }
    
    
    
    @IBAction func onSwitch(sender: UIButton) {
        if !isStart {
            isStart = true
            sender.setTitle("Stop", forState: UIControlState.Normal)
            
            if isStart {
                motionManager.startMagnetometerUpdatesToQueue(NSOperationQueue.currentQueue()){
                    magnetoData, error in
                    if (error != nil) {
                        println("Error: \(error)")
                    }
                    self.outputM(magnetoData.magneticField)
                }
                
                motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()) {
                    deviceData, error in
                    
                    if (error != nil) {
                        println("Error: \(error)")
                    }
                    self.outputD(deviceData.attitude)
                    
                    
                }
            }
            
        } else {
            isStart = false
            sender.setTitle("Start", forState: UIControlState.Normal)
            motionManager.stopMagnetometerUpdates()
            motionManager.stopDeviceMotionUpdates()
        }
    }
    
    
    @IBAction func reset(sender: AnyObject) {
        
        MMX = 0
        MMY = 0
        MMZ = 0
        DMX = 0
        DMY = 0
        DMZ = 0
        
        mMaxX.text = "0"
        mMaxY.text = "0"
        mMaxZ.text = "0"
        dMaxX.text = "0°"
        dMaxY.text = "0°"
        dMaxZ.text = "0°"
        
        dLabelX.text = "0°"
        dLabelY.text = "0°"
        dLabelZ.text = "0°"
        mLabelX.text = "0"
        mLabelY.text = "0"
        mLabelZ.text = "0"
        
        
        
        
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
