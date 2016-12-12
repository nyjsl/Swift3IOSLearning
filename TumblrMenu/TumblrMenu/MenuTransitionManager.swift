//
//  MenuTransitionManager.swift
//  TumblrMenu
//
//  Created by 魏星 on 2016/12/4.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation
import UIKit

class MenuTransitionManager:NSObject,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate{
    
    private var isPresenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        let screens: (from: UIViewController, to: UIViewController) = (transitionContext.viewController(forKey: .from)!,transitionContext.viewController(forKey: .to)!)
        
        let menuViewController = !self.isPresenting ?  screens.from as!MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !self.isPresenting ? screens.to:screens.from
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        if self.isPresenting{
            self.offStageMenuController(menuController: menuViewController)
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
       
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations:
            {
                if self.isPresenting{
                    self.onStageMenuController(menuController: menuViewController)
                }else{
                    self.offStageMenuController(menuController: menuViewController)
                }
        }, completion:
            {
                finished in
                transitionContext.completeTransition(true)
//                UIApplication.shared.keyWindow?.addSubview(screens.to.view)
        })
    }
    
    func offStage(amount: CGFloat) -> CGAffineTransform{
        return CGAffineTransform(translationX: amount, y: 0)
    }
    
    func offStageMenuController(menuController: MenuViewController){
        menuController.view.alpha = 0
        
        let topRowOffset:CGFloat = 300
        let midRowOffset:CGFloat = 150
        let bottomRowOffset:CGFloat = 50
        
        menuController.textView.transform = self.offStage(amount: -topRowOffset)
        menuController.photoVIew.transform = self.offStage(amount: topRowOffset)
        
        menuController.quoteView.transform = self.offStage(amount: -midRowOffset)
        menuController.linkView.transform = self.offStage(amount: midRowOffset)
        
        menuController.chatView.transform = self.offStage(amount: -bottomRowOffset)
        menuController.audioView.transform = self.offStage(amount: bottomRowOffset)
    }
    
    func onStageMenuController(menuController: MenuViewController){
        menuController.view.alpha = 1
        
        menuController.textView.transform = CGAffineTransform.identity
        menuController.photoVIew.transform = CGAffineTransform.identity
        
        menuController.quoteView.transform = CGAffineTransform.identity
        menuController.linkView.transform = CGAffineTransform.identity
        
        menuController.chatView.transform = CGAffineTransform.identity
        menuController.audioView.transform = CGAffineTransform.identity
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }
    
}
