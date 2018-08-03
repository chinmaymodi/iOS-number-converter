//
//  LaunchController.swift
//  numberconverter
//
//  Created by  on 3/4/17.
//  Copyright © 2017 vergil. All rights reserved.
//

import UIKit
class ViewController2: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageBase.image = UIImage(named: "Number systems.jpg")
        // Image courtesy of steppingcloud.com
        imageBase.clipsToBounds = true
        imageBase.alpha = 0.5
        imageBase.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var imageBase: UIImageView!
}

