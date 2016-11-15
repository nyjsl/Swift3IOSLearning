//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by 魏星 on 2016/11/14.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit
class LoginViewController: UIViewController{
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var pwdTextField: UITextField!
   
    
    @IBOutlet weak var unTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.loginBtn.layer.cornerRadius = 5
        
        print(self.view.frame)
        print(self.view.bounds)
        print(pwdTextField.frame)
        print(pwdTextField.bounds)

    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        UIView.animateKeyframes(withDuration: 1, delay: 0.0, options: .repeat, animations: { 
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                
                var bouds = self.loginBtn.bounds
                bouds.origin.x -= 20
                bouds.size.width += 40
                self.loginBtn.bounds = bouds
            })
            }, completion: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        //导航栏背景色
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        //返回按钮及文字颜色
        self.navigationController?.navigationBar.tintColor = UIColor.white
        //标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        self.unTextField.alpha = 0
        self.pwdTextField.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.unTextField.center.x -= self.view.frame.size.width/2
        self.pwdTextField.center.x -= self.view.frame.size.width/2
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: { 
            self.unTextField.center.x += self.view.frame.size.width/2
            self.unTextField.alpha = 1
            }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.pwdTextField.center.x += self.view.frame.size.width/2
            self.pwdTextField.alpha = 1
            }, completion: nil)
    }
    
    
}
