//
//  ViewController.swift
//  ImageScroller
//
//  Created by 魏星 on 2016/11/8.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    fileprivate lazy var steveImageView: UIImageView = {
        var frame: CGRect = self.view.frame
        frame.size.width = frame.size.width*2
        frame.size.height = frame.size.height*1.5
        let steve: UIImageView = UIImageView(frame: frame)
        steve.contentMode = .scaleAspectFill
        steve.image = #imageLiteral(resourceName: "steve")
        return steve
    }()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.addSubview(steveImageView)
        scrollView.contentSize = self.steveImageView.frame.size
        scrollView.maximumZoomScale = 3
        scrollView.minimumZoomScale = 0.33
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIScrollViewDelegate{
 
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.steveImageView
    }
}

