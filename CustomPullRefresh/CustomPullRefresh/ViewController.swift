//
//  ViewController.swift
//  CustomPullRefresh
//
//  Created by 魏星 on 2016/12/14.
//  Copyright © 2016年 wx. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]
    
    var refreshCustomCotent: RefreshContentView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        
        refreshCustomCotent = RefreshContentView(frame:(refreshControl?.bounds)!)
        //为什么设置了backgroudColor 和不设置后的效果不一样??
        self.refreshControl?.backgroundColor = UIColor.clear
        //set autoresize fill parent
        refreshCustomCotent.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
        refreshControl?.addSubview(refreshCustomCotent)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CellOneLable
        cell.idLabel.text = dataArray[indexPath.row]
        return cell
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        animationStepRotate()
    }
    
    
    override func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    private func animateLables(transform: CGAffineTransform,color: UIColor){
        let subViews = refreshCustomCotent.lablesStack.subviews
        guard animationIndex < subViews.count else{
            animationStepScale()
            return
        }
        if(transform == CGAffineTransform.identity){
            UIView.animate(withDuration: 0.1, animations:{
                let l = subViews[self.animationIndex] as! UILabel
                l.transform = transform
                l.textColor = color
                
            }, completion: { (complete)  in
                if complete{
                    self.animationIndex = self.animationIndex + 1
                }
            })
        }else{
            UIView.animate(withDuration: 0.1, animations:{
                let l = subViews[self.animationIndex] as! UILabel
                l.transform = transform
                l.textColor = color
                
            }, completion: { (complete)  in
                if complete{
                    self.animatedIndex = self.animationIndex
                }
            })
        }
    }
    
    
    // 当前正在动画
    var animationIndex = 0{
        didSet{
            self.animateLables(transform: CGAffineTransform(rotationAngle: CGFloat(M_PI_4)),color: UIColor.red)
        }
        
    }
    //动画完了恢复
    var animatedIndex = 0 {
        didSet{
            self.animateLables(transform:CGAffineTransform.identity , color: UIColor.black)
        }
    }
    
    private func animationStepRotate(){
        self.animationIndex = 0
    }
    
    private func animationStepScale(){
        let subViews = refreshCustomCotent.lablesStack.subviews
        subViews.forEach { (view) in
            UIView.animate(withDuration: 0.4, delay: 0.0, options: UIViewAnimationOptions.curveLinear,animations: {
                view.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            }, completion: { (finished) in
                if finished {
                    view.transform = CGAffineTransform.identity
                    self.refreshControl?.endRefreshing()
                }
            })
        }
        
    }

}

