//
//  RotateViewController.swift
//  BasicAnimation
//
//  Created by 魏星 on 2016/12/25.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class RotateViewController: UIViewController {

    
    
    
    @IBOutlet weak var trump1: UIImageView!
    @IBOutlet weak var trump8: UIImageView!
    @IBOutlet weak var trump7: UIImageView!
    @IBOutlet weak var trump6: UIImageView!
    @IBOutlet weak var trump5: UIImageView!
    @IBOutlet weak var trump4: UIImageView!
    @IBOutlet weak var trump3: UIImageView!
    @IBOutlet weak var trump2: UIImageView!
    
    @IBOutlet weak var emojiLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rotate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func rotate(){
        UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear], animations: {
            
            self.partRotate()
            
        }, completion: {
            finished in
                self.rotate()
        })

    }
    
    private func partRotate(){
        
        self.trump1.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI))
        self.trump2.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI))
        self.trump3.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI))
        self.trump4.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI))
        self.trump5.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI))
        self.trump6.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI))
        self.trump7.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI))
        self.trump8.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI_4))
        self.emojiLabel.transform  = self.trump1.transform.rotated(by: CGFloat(M_PI_2))
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
