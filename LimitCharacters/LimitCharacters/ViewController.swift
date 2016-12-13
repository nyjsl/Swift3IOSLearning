//
//  ViewController.swift
//  LimitCharacters
//
//  Created by 魏星 on 2016/12/4.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var inputTextView: UITextView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    let MAX_COUNT = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        avatar.layer.cornerRadius = avatar.frame.width/2
        avatar.layer.masksToBounds = true
        countLabel.text = "\(MAX_COUNT)"
        inputTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(note:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    
    @objc private func keyboardWillShow(note: Notification){
        if let userInfo = note.userInfo{
            print(userInfo)
            if let keyboardBounds: CGRect = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect?{
                let height = keyboardBounds.size.height
                if let duration: Double = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double?{
                    
                    UIView.animate(withDuration: duration, delay: 0, options: [], animations: {
                        self.bottomView.transform = CGAffineTransform(translationX: 0, y: -height)
                    }, completion: nil)
                }
            }
            
        }
    }
    
    @objc private func keyboardWillHide(note: Notification){
        if let userInfo = note.userInfo{
            
            if let duration: Double = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double?{
                
                UIView.animate(withDuration: duration, delay: 0, options: [], animations: {
                     self.bottomView.transform = CGAffineTransform.identity
                }, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

extension ViewController: UITextFieldDelegate,UITextViewDelegate{
  
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView === self.inputTextView{
            if range.length == 1&&text.characters.count == 0{
                return true
            }else if self.inputTextView.text.characters.count>=MAX_COUNT{
                let toIndex = textView.text.index(textView.text.startIndex, offsetBy: MAX_COUNT)
                self.inputTextView.text = textView.text.substring(to: toIndex)
                return false
            }
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        countLabel.text = "\(MAX_COUNT - textView.text.characters.count)"

    }
    
    
}

