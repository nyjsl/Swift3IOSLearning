//
//  PositionViewController.swift
//  BasicAnimation
//
//  Created by 魏星 on 2016/12/25.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {

   
    
    @IBOutlet weak var yellowView: UIView!
    
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let yellowAnimationClosure: () -> Void  = {
            () -> Void in
            self.yellowView.center.x = self.yellowView.bounds.width - self.yellowView.center.x
            self.yellowView.center.y =  self.yellowView.center.y + 30
        }
        
        
        
        UIView.animate(withDuration: 2, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: [.curveEaseOut,.autoreverse,.repeat], animations:yellowAnimationClosure
            , completion: { finished in
                if finished {
                    //Do Nothing
                }
        })
        
        let greenAnimationClosure = {
            self.greenView.center.x = self.greenView.bounds.width + self.greenView.center.x
            self.greenView.center.y =  self.greenView.center.y + 30
        }
        //usingSpringWithDamping的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显
        //initialSpringVelocity则表示初始的速度，数值越大一开始移动越快
        UIView.animate(withDuration: 2, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.1, options: [.curveEaseOut,.autoreverse,.repeat], animations:greenAnimationClosure
            , completion: nil)

        
        let buleAnimationClousure  = {
            var frame = self.blueView.frame
            frame.size.height = frame.size.height * 2
            self.blueView.frame = frame
        }
    
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat,.autoreverse,.curveLinear], animations: buleAnimationClousure, completion: nil)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
