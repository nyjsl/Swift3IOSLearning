//
//  ViewController.swift
//  SnapChat
//
//  Created by 魏星 on 2016/11/6.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lefController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let cameraController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightController = RightViewController(nibName: "RightViewController", bundle: nil)
        
        self.addChildViewController(lefController)
        lefController.didMove(toParentViewController: self)
        self.scrollView.addSubview(lefController.view)
        
        self.addChildViewController(cameraController)
        cameraController.didMove(toParentViewController: self)
        
        var centerFrame = cameraController.view.frame
        centerFrame.origin.x = self.view.frame.width
        cameraController.view.frame = centerFrame
        self.scrollView.addSubview(cameraController.view)
        
        self.addChildViewController(rightController)
        rightController.didMove(toParentViewController: self)
        
        var rightFrame = cameraController.view.frame
        rightFrame.origin.x = self.view.frame.width * 2
        rightController.view.frame = rightFrame
        
        self.scrollView.addSubview(rightController.view)
                self.scrollView.contentSize = CGSize(width: self.view.frame.width*3, height: self.view.frame.size.height)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

