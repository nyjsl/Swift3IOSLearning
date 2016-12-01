//
//  MenuTransitionManager.swift
//  SlideMenu
//
//  Created by 魏星 on 2016/12/1.
//  Copyright © 2016年 wx. All rights reserved.
//

import Foundation

import UIKit
@objc protocol MenuControllerDismissDelegate {
    func dismiss()
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate{
    
    var duration = 0.5
    
    var isPresenting = false
    
    var delegate:MenuControllerDismissDelegate?
    
    var snapsShot: UIView?{
        didSet{
            if let delegate = delegate{
                let tapGestureRecognier = UITapGestureRecognizer(target: delegate, action: "dismiss")
                snapsShot?.addGestureRecognizer(tapGestureRecognier)
            }
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let containerView = transitionContext.containerView
        
        let moveDown = CGAffineTransform(translationX: 0, y: containerView.frame.height - 150)
        
        let moveUp = CGAffineTransform(translationX: 0, y: -50)
        
        
        if isPresenting {
            toView?.transform = moveUp
            snapsShot = fromView?.snapshotView(afterScreenUpdates: true)
            containerView.addSubview(toView!)
            containerView.addSubview(snapsShot!)
        }
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations:
            {
                if self.isPresenting{
                    self.snapsShot?.transform = moveDown
                    toView?.transform = CGAffineTransform.identity
                }else{
                    self.snapsShot?.transform = CGAffineTransform.identity
                    fromView?.transform = moveUp
                }
        }, completion:
            { finished in
                transitionContext.completeTransition(true)
                if !self.isPresenting {
                    self.snapsShot?.removeFromSuperview()
                }
        })
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
}
