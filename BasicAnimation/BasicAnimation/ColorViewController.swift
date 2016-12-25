//
//  ColorViewController.swift
//  BasicAnimation
//
//  Created by 魏星 on 2016/12/25.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = UIColor.black
        }, completion: nil)
        
        
        UIView.animate(withDuration: 2, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [.autoreverse,.repeat,.curveEaseOut], animations: {
            self.label.textColor = UIColor(red: 0.9, green: 0.8, blue: 0.5, alpha: 0.5)
        }, completion: nil)
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
