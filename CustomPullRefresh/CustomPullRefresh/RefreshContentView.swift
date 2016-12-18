//
//  RefreshContentView.swift
//  CustomPullRefresh
//
//  Created by 魏星 on 2016/12/18.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation

import UIKit
// custom view
class RefreshContentView: UIView{
    

    @IBOutlet weak var lablesStack: UIStackView!
    
    var refreshCustomCotent: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        refreshCustomCotent = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)![0] as? UIView
        refreshCustomCotent?.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
        self.addSubview(refreshCustomCotent!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        refreshCustomCotent?.frame = bounds
    }
        
 }
