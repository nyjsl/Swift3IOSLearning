//
//  ViewController.swift
//  AnimatedSplash
//
//  Created by 魏星 on 2016/11/17.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate{

    @IBOutlet weak var screenImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.screenImageView.layer.mask = mask
        self.view.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        animateMask()
    }
    
    override var prefersStatusBarHidden: Bool{
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func animateMask() {
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        let initalBounds = NSValue(cgRect: mask.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        self.mask.add(keyFrameAnimation, forKey: "bounds")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.screenImageView!.layer.mask = nil
        self.view.backgroundColor = UIColor.white

    }
    
    fileprivate lazy var mask: CALayer = {
        let mask: CALayer = CALayer()
        mask.contents = #imageLiteral(resourceName: "twitter").cgImage
        mask.contentsGravity = kCAGravityResizeAspect
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        print(self.view.frame.size.width/2)
        mask.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        return mask
    }()

}

