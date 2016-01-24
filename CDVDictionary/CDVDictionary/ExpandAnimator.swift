//
//  ExpandAnimator.swift
//  CDVDictionary
//
//  Created by Alex Golub on 1/1/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import Foundation
import UIKit

class ExpandAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    static var animator = ExpandAnimator()
    
    enum ExpandTransitionMode: Int {
        case Present, Dismiss
    }
    
    let presentDuration = 0.4
    let dismissDuration = 0.15
    
    var openingFrame: CGRect?
    var transitionMode: ExpandTransitionMode = .Present
    
    var topView: UIView!
    var bottomView: UIView!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        if transitionMode == .Present {
            return presentDuration
        }
        else {
            return dismissDuration
        }
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // From view controller
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let fromViewFrame = fromViewController.view.frame
        
        // To view controller
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        // Container view
        let containerView = transitionContext.containerView()!
        
        if (transitionMode == .Present)
        {
            // Get top view using resizableSnapshotViewFromRect
            topView = fromViewController.view.resizableSnapshotViewFromRect(fromViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsMake(openingFrame!.origin.y, 0, 0, 0))
            topView.frame = CGRectMake(0, 0, fromViewFrame.width, openingFrame!.origin.y)
            
            // Add top view to container
            containerView.addSubview(topView)
            
            // Get bottom view using resizableSnapshotViewFromRect
            bottomView = fromViewController.view.resizableSnapshotViewFromRect(fromViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsMake(0, 0, fromViewFrame.height - openingFrame!.origin.y - openingFrame!.height, 0))
            bottomView.frame = CGRectMake(0, openingFrame!.origin.y + openingFrame!.height, fromViewFrame.width, fromViewFrame.height - openingFrame!.origin.y - openingFrame!.height)
            
            // Add bottom view to contatiner
            containerView.addSubview(bottomView)
            
            // Take a snapshot of the view controller and change its frame to opening frame
            let snapshotView = toViewController.view.resizableSnapshotViewFromRect(fromViewFrame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
            snapshotView.frame = openingFrame!
            containerView.addSubview(snapshotView)
            
         toViewController.view.alpha = 0.0
            containerView.addSubview(toViewController.view)
            
            UIView.animateWithDuration(presentDuration, animations: { () -> Void in
                
                // Move top and bottom views out of the screen
                self.topView.frame = CGRectMake(0, -self.topView.frame.height, self.topView.frame.width, self.topView.frame.height)
                self.bottomView.frame = CGRectMake(0, fromViewFrame.height, self.bottomView.frame.width, self.bottomView.frame.height)
                
                // Expand snapshot view to fill entire frame
                snapshotView.frame = toViewController.view.frame
                }, completion: { (finished) -> Void in
                    
                    // Remove snapshot view from contatiner view
                    snapshotView.removeFromSuperview()
                    // Make to view controller visible
                    toViewController.view.alpha = 0.0
                    // Complete transition
                    transitionContext.completeTransition(finished)
            })
        } else {
            let snapshotView = fromViewController.view.resizableSnapshotViewFromRect(fromViewController.view.bounds, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
            containerView.addSubview(snapshotView)
            
            fromViewController.view.alpha = 0.0
            
            UIView.animateWithDuration(dismissDuration, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                
                self.topView.frame = CGRectMake(0, 0, self.topView.frame.width, self.topView.frame.height)
                self.bottomView.frame = CGRectMake(0, fromViewController.view.frame.height - self.bottomView.frame.height, self.bottomView.frame.width, self.bottomView.frame.height)
                snapshotView.frame = self.openingFrame!
                }, completion: { (finished) -> Void in
                    
                    // Remove snapshot view from contatiner view
                    snapshotView.removeFromSuperview()
                    // Make to view controller visible
                    toViewController.view.alpha = 0.0
                    // Complete transition
                    transitionContext.completeTransition(finished)
            })
        }
}
