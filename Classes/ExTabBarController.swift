//
//  ITabbarController.swift
//  ipromise
//
//  Created by Tuan Phung on 1/30/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

class ExSwipeView: ExView {
    
    var associatedView: UIView!
    var enabled = true
    var enabledTouchToCollapse = true
    
    var beginTouchPosition = CGPoint(x: 0, y: 0)
    var beginAssociatedViewPosition = CGPoint(x: 0, y: 0)
    
    var sideMenuWidth: CGFloat = 0
    var endTouch: ((collapsed: Bool) -> Void)?
    
    func shouldCollapse() -> Bool {
        var shouldCollapse = false
        
        if (self.beginAssociatedViewPosition.x == 0) {
            if (self.associatedView.frame.origin.x < self.sideMenuWidth/5) {
                shouldCollapse = true
            }
        }
        else {
            if self.enabledTouchToCollapse {
                shouldCollapse = true
            }
            else {
                if self.associatedView.frame.origin.x < self.sideMenuWidth*4/5 {
                    shouldCollapse = true
                }
            }
        }
        
        return shouldCollapse
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        if (!self.enabled) { return nil }
        
        let rect: CGRect = CGRect(x: 0, y: 20, width: 44, height: 44)
        if (CGRectContainsPoint(rect, point)) { return nil }
        
        return super.hitTest(point, withEvent: event)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (!self.enabled) { return }
        
        if let touch = touches.first as? UITouch {
            let window: UIWindow = UIApplication.sharedApplication().delegate!.window!!
            
            self.beginTouchPosition = touch.locationInView(window)
            
            if let associatedView = self.associatedView {
                self.beginAssociatedViewPosition = associatedView.frame.origin
            }
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (!self.enabled) { return }
        
        if let touch = touches.first as? UITouch {
            let window: UIWindow = UIApplication.sharedApplication().delegate!.window!!
            let touchPosition = touch.locationInView(window)
            
            let deltaX = self.beginTouchPosition.x - touchPosition.x
            var associatedViewFrame: CGRect = self.associatedView.frame
            var offsetX = self.beginAssociatedViewPosition.x - deltaX
            
            if (offsetX <= 0) {
                offsetX = 0
            }
            
            associatedViewFrame.origin.x = offsetX
            self.associatedView.frame = associatedViewFrame
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (!self.enabled) { return }
        
        if let endTouch = self.endTouch {
            endTouch(collapsed: self.shouldCollapse())
        }
    }
}

class ExTabBarController: UITabBarController {
    var swipeView: ExSwipeView!
    var sideView: UIView!
    var sideBarCollapsed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func enableSideBarWithCustomView(customView: UIView) {
        self.setUpSwipeView()
        self.setUpSideBarViewWithCustomView(customView)
    }
    
    func disableSideBar() {
        self.sideBarCollapsed = true
        self.swipeView.removeFromSuperview()
        self.sideView.removeFromSuperview()
    }
    
    func sideMenuWidth() -> CGFloat {
        return 100
    }
    
    func sideMenuAnimateDuration() -> CGFloat {
        return 0.2
    }
    
    func setUpSwipeView() {
        self.swipeView = ExSwipeView(frame: view.bounds)
        self.swipeView.sideMenuWidth = self.sideMenuWidth()
        self.swipeView.associatedView = self.view
        self.swipeView.enabled = true
        self.swipeView.backgroundColor = UIColor.clearColor()
        self.swipeView.frame = CGRect(x: 0, y: 0, width: 30, height: self.view.bounds.size.height)
        
        self.swipeView.endTouch = {
            (collapsed: Bool) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                self.collapseSideBar(collapsed)
            })
            return
        }
        
        view.addSubview(self.swipeView)
        view.bringSubviewToFront(self.swipeView)
    }
    
    func setUpSideBarViewWithCustomView(customView: UIView) {
        self.sideBarCollapsed = true
        
        let window: UIWindow = UIApplication.sharedApplication().delegate!.window!!
        let windowSize = window.bounds.size
        
        self.sideView = UIView(frame: CGRectMake(0, 0, windowSize.width, windowSize.height))
        self.sideView.backgroundColor = UIColor.clearColor()
        self.sideView.addSubview(customView)
    }
    
    func toggleSideBar() {
        collapseSideBar(!self.sideBarCollapsed)
    }
    
    func collapseSideBar(collapsed: Bool) {
        self.sideBarCollapsed = collapsed
        
        var window: UIWindow = UIApplication.sharedApplication().delegate!.window!!
        window.userInteractionEnabled = false
        
        var viewFrame = view.frame
        
        if (!collapsed) {
            viewFrame.origin.x = self.sideMenuWidth()
            swipeView.frame = view.bounds
        }
        else {
            viewFrame.origin.x = 0
            swipeView.frame = CGRectMake(0, 0, 30, view.bounds.size.height)
        }
        
        var duration: CGFloat = 0.0;
        if (collapsed) {
            duration = view.frame.origin.x / self.sideMenuWidth() * self.sideMenuAnimateDuration()
        }
        else {
            duration = ((self.sideMenuWidth() - view.frame.origin.x) / self.sideMenuWidth()) * self.sideMenuAnimateDuration()
        }
        
        UIView.animateWithDuration(Double(duration), animations:
            {
                self.view.frame = viewFrame
            }, completion:
            {
                (completed: Bool) -> Void in
                window.userInteractionEnabled = true
                return
        })
    }
}