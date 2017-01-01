//
//  ViewController.swift
//  ImagePickerSheetController
//
//  Created by 魏星 on 2017/1/1.
//  Copyright © 2017年 wx. All rights reserved.
//

import UIKit
import ImagePicker


class ViewController: UIViewController {

   
    @IBOutlet weak var profileImg: UIImageView!
    
    
    @IBOutlet weak var unameLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        unameLabel.becomeFirstResponder()
        profileImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileDidTap)))
        profileImg.layer.cornerRadius = profileImg.bounds.size.width/2
        profileImg.layer.masksToBounds = true
        
    }
    
    @objc private func profileDidTap(){
        buidAndShowImagePickerPresenter()
    }

    private func buidAndShowImagePickerPresenter(){
        let imageController = ImagePickerController()
        imageController.delegate = self
        present(imageController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unameLabel.resignFirstResponder()
    }

}

extension ViewController: ImagePickerDelegate{
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        let img = images[0]
        profileImg.image = img
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true, completion: nil)
        let img = images[0]
        profileImg.image = img
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
}


