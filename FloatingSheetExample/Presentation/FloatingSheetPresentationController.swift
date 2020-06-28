//
//  FloatingSheetPresentationController.swift
//  Marketeer
//
//  Created by Adam Beech on 2020-06-28.
//  Copyright © 2020 Adam Beech. All rights reserved.
//

import UIKit

class FloatingSheetPresentationController: UIPresentationController {

    private var dimmingView: UIView!
      
    override var frameOfPresentedViewInContainerView: CGRect {

        var frame: CGRect = .zero
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)

        // Change size of the dimmed buffer area around the edges, 0.1 = 10% of the screen width/height
        frame.origin.x = containerView!.frame.width * 0.1
        frame.origin.y = containerView!.frame.height * 0.1
        
        return frame
        
    }


    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        setupDimmingView()
        
        // Change corner radius here
        presentedView?.layer.cornerRadius = 25.0
        
    }
    
    // MARK: -
    // Mark: - UIPresentationController
      
    override func presentationTransitionWillBegin() {
        
        guard let dimmingView = dimmingView else {
            return
        }

        containerView?.insertSubview(dimmingView, at: 0)

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|",
            options: [], metrics: nil, views: ["dimmingView": dimmingView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|",
            options: [], metrics: nil, views: ["dimmingView": dimmingView]))

        guard let coordinator = presentedViewController.transitionCoordinator else {
            
            dimmingView.alpha = 1.0
            return
            
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
        
    }
      
    override func dismissalTransitionWillBegin() {
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
          
            dimmingView.alpha = 0.0
            return
            
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
        
    }
      
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
      
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        // Change size of the presented view controller, 0.8 = 80% of the screen width/height
        return CGSize(width: parentSize.width * 0.8, height: parentSize.height * 0.8)
    }

      
    // MARK: -
    // Mark: - DimmingView

    func setupDimmingView() {
        
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        dimmingView.addGestureRecognizer(recognizer)
        
    }
      
    @objc func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }
    
}
