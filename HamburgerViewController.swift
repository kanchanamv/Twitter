//
//  HamburgerViewController.swift
//  Twitter
//
//  Created by Kanch on 2/25/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

var _globalNavigationController: HamburgerViewController?

class HamburgerViewController: UIViewController {

	@IBOutlet weak var leftMarginConstraing: NSLayoutConstraint!
	var originalLeftMargin: CGFloat!

	@IBOutlet weak var menuView: UIView!
	@IBOutlet weak var contentView: UIView!

    var menuViewController: UIViewController!{
        didSet{
        view.layoutIfNeeded()
       // menuView.addSubview(menuViewController.view)
            
            menuViewController.view.frame = self.menuView.bounds
            menuViewController.willMoveToParentViewController(self)
            menuView.addSubview(menuViewController.view)
            menuViewController.didMoveToParentViewController(self)
        }
    }

	override func viewDidLoad() {
		super.viewDidLoad()
		_globalNavigationController = self

		// Do any additional setup after loading the view.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

//	var menuViewController: UIViewController! {
//		didSet {
//			view.layoutIfNeeded() // trick that delays the next line of code to be executed. If not, there will be an error
//			self.addChildViewController(menuViewController)
//			menuViewController.view.frame = self.menuView.bounds
//			menuViewController.willMoveToParentViewController(self)
//			menuView.addSubview(menuViewController.view)
//			menuViewController.didMoveToParentViewController(self)
//		}
//	}

	var contentViewController: UIViewController! {
		didSet (oldContentViewController) {
			view.layoutIfNeeded()
            
           // contentView.addSubview(contentViewController.view)

			if (oldContentViewController != nil) {
				oldContentViewController.willMoveToParentViewController(nil)
				oldContentViewController.view.removeFromSuperview()
				oldContentViewController.didMoveToParentViewController(nil)
			}

			self.addChildViewController(contentViewController)
			contentViewController.view.frame = self.contentView.bounds
			contentViewController.view.autoresizingMask = [.FlexibleHeight, .FlexibleTopMargin, .FlexibleBottomMargin]
			contentViewController.willMoveToParentViewController(self)
			contentView.addSubview(contentViewController.view)

            UIView.animateWithDuration(0.5, animations: {
                self.leftMarginConstraing.constant = 0
                self.view.layoutIfNeeded()
            })

			contentViewController.didMoveToParentViewController(self)
		}
	}

	@IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
		let translation = sender.translationInView(view)
		let velocity = sender.velocityInView(view)
		let point = sender.locationInView(view)

		if sender.state == UIGestureRecognizerState.Began {
			originalLeftMargin = leftMarginConstraing.constant

			print("Gesture began at: \(point)")
		} else if sender.state == UIGestureRecognizerState.Changed {
			leftMarginConstraing.constant = originalLeftMargin + translation.x
			print("Gesture changed at: \(point)")
		} else if sender.state == UIGestureRecognizerState.Ended {

			if velocity.x > 0 {
				leftMarginConstraing.constant = view.frame.size.width - 50 }
			else {
				leftMarginConstraing.constant = 0
			}
			print("Gesture ended at: \(point)")
		}
	}

	class var globalNavigationController: HamburgerViewController? {
		get {
			return _globalNavigationController
		}
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */
}
