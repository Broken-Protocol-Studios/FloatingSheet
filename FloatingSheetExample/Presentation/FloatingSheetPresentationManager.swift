//
//  FloatingSheetPresentationManager.swift
//  Marketeer
//
//  Created by Adam Beech on 2020-06-28.
//  Copyright © 2020 Adam Beech. All rights reserved.
//

import UIKit

class FloatingSheetPresentationManager: NSObject, UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
      
        let presentationController = FloatingSheetPresentationController(presentedViewController: presented, presenting: presenting)

        return presentationController
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ApparitionAnimator(isPresentation: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ApparitionAnimator(isPresentation: false)
    }
    
}
