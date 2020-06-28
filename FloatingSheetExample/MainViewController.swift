//
//  ViewController.swift
//  FloatingSheetExample
//
//  Created by Adam Beech on 2020-06-28.
//  Copyright © 2020 Broken Protocol Studios. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    lazy var floatingTransitioningDelegate = FloatingSheetPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? FloatingViewController {
          
            controller.transitioningDelegate = floatingTransitioningDelegate
            controller.modalPresentationStyle = .custom
          
        }
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showFloatingViewController", sender: nil)
    }
    
}

