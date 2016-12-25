//
//  OpacityViewController.swift
//  BasicAnimation
//
//  Created by 魏星 on 2016/12/25.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {
    
    var bgImg: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        bgImg = UIImageView(frame: frame)
        bgImg?.image = #imageLiteral(resourceName: "colored ASCII art")
        bgImg?.contentMode = .scaleAspectFit
        self.view.addSubview(bgImg!)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.repeat,.autoreverse], animations: {
            self.bgImg?.alpha = 0.0
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
