//
//  ResultsViewController.swift
//  Discount Calculator
//
//  Created by Kristi Chang on 2/27/17.
//  Copyright © 2017 kristi.chang. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // MARK: properties
    let CalcData: DiscountCalc = DiscountCalc.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add Swipe Right Gesture
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer (target:self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer) {
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
    }

}
