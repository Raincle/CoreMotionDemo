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
    
    @IBOutlet weak var rLabelX: UILabel!
    @IBOutlet weak var rLabelY: UILabel!
    @IBOutlet weak var rLabelZ: UILabel!

    @IBOutlet weak var rMaxX: UILabel!
    @IBOutlet weak var rMaxY: UILabel!
    @IBOutlet weak var rMaxZ: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

