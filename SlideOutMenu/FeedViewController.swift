//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by 魏星 on 2016/12/23.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit
import Foundation
class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
