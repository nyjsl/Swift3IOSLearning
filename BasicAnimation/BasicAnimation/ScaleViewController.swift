//
//  ScaleViewController.swift
//  BasicAnimation
//
//  Created by 魏星 on 2016/12/25.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

   
    @IBOutlet weak var emojiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiImageView.alpha = 0.0
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [.curveEaseOut,.repeat,.autoreverse], animations: {
            self.emojiImageView.alpha = 1.0
            
            let cgaffineTransform = CGAffineTransform(scaleX: 2, y: 2)
            self.emojiImageView.transform = cgaffineTransform
            
        }, completion: nil)

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
