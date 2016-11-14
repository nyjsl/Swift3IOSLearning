//
//  ViewController.swift
//  LoginAnimation
//
//  Created by 魏星 on 2016/11/14.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func loginAction(_ sender: UIButton) {
//        self.navigationController?.present(LoginViewController(), animated: true, completion: nil)
        
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(loginViewController!, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        signUpBtn.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

