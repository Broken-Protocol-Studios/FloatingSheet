//
//  ApparitionAnimator.swift
//  Marketeer
//
//  Created by Adam Beech on 2020-06-28.
//  Copyright © 2020 Adam Beech. All rights reserved.
//

import UIKit

class ApparitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let isPresentation: Bool
      
    init(isPresentation: Bool) {
        
        self.isPresentation = isPresentation
        super.init()
        
    }
      
    // MARK: -
    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let key: UITransitionContextViewControllerKey = isPresentation ? .to : .from

        guard let controller = transitionContext.viewController(forKey: key) else { return }
      
        if isPresentation {
            controller.view.alpha = 0.0
            transitionContext.containerView.addSubview(controller.view)
        }

        let presentedFrame = transitionContext.finalFrame(for: controller)

        let animationDuration = transitionDuration(using: transitionContext)
        controller.view.frame = presentedFrame

        UIView.animate(withDuration: animationDuration, animations: {

            if self.isPresentation {
                controller.view.alpha = 1.0
            } else {
                controller.view.alpha = 0.0
            }

        }, completion: { finished in

            if !self.isPresentation {
                controller.view.removeFromSuperview()
            }
            transitionContext.completeTransition(finished)

        })
        
    }
      
    
}
