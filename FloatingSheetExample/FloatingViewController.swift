//
//  FloatingViewController.swift
//  FloatingSheetExample
//
//  Created by Adam Beech on 2020-06-28.
//  Copyright © 2020 Broken Protocol Studios. All rights reserved.
//

import UIKit

class FloatingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
