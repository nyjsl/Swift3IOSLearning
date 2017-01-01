//
//  ViewController.swift
//  WikiFace
//
//  Created by 魏星 on 2017/1/1.
//  Copyright © 2017年 wx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var faceImageView: UIImageView!
    
    
    fileprivate lazy var activityIndicator: UIActivityIndicatorView = {
        let indicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
        indicatorView.frame = self.view.bounds
        return indicatorView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.resignFirstResponder()
        nameTextField.delegate = self
        self.view.addSubview(activityIndicator)
        self.faceImageView.alpha = 0
        self.faceImageView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameTextField.resignFirstResponder()
        if activityIndicator.isAnimating{
            activityIndicator.stopAnimating()
            WikiFaceRequest.cancelTask()
        }
    }
    

}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let content =  textField.text{
            
            activityIndicator.startAnimating()
            
            WikiFaceRequest.requestPersonFace(person: content, size: CGSize(width:faceImageView.bounds.size.width,height:faceImageView.bounds.size.height), requestHandler: { [unowned self](img, getted) in
                
                self.activityIndicator.stopAnimating()
                if getted {
                    if let img = img{
                        self.bindAndAnimateView(img: img)
                    }
                }
            })
        }
        
        return true
    }
    
    func bindAndAnimateView(img: UIImage){
        DispatchQueue.main.async(execute: {  [unowned self] in
            self.faceImageView.image = img
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.4, options: [.curveEaseOut], animations: {
                self.faceImageView.alpha = 1
                self.faceImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
            
        })
    }
}






