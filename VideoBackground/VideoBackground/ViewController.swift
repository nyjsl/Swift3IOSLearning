//
//  ViewController.swift
//  VideoBackground
//
//  Created by 魏星 on 2016/11/10.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: VideoBackgroundBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginBtn.layer.cornerRadius = 4
        signUpBtn.layer.cornerRadius = 4
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        setVideoParams(url: url)
        
        self.frame = self.view.frame
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet var loginBtn: UIView!

    @IBOutlet var signUpBtn: UIView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

