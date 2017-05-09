//
//  CalculatorViewController.swift
//  Discount Calculator
//
//  Created by Kristi Chang on 2/27/17.
//  Copyright © 2017 kristi.chang. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MARK: shared
    let CalcData: DiscountCalc = DiscountCalc.shared
    
    // MARK: Properties
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dollarsOffTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var otherDiscountTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    var price:Float = 0.0
    var dollarsOff:Float = 0.0
    var discount:Float = 0.0
    var otherDiscount:Float = 0.0
    var tax:Float = 0.0
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Make Swipe Gestures
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer (target:self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        // handleSwipe is a function down below...
        // #selector selects and executes that function
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Swipe Function
    func handleSwipe(_ sender:UIGestureRecognizer) {
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    // MARK: actions
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        // grab values
        price = Float(priceTextField.text!)!
        dollarsOff = Float(dollarsOffTextField.text!)!
        discount = Float(discountTextField.text!)!
        otherDiscount = Float(otherDiscountTextField.text!)!
        tax = Float(taxTextField.text!)!
        
        // calc prices
        let originalPrice:Float = price * (tax / 100) + price
        let discountPrice:Float = price - (price * (discount / 100) + price * (otherDiscount / 100)) + (price * (tax / 100))
        let amountSaved:Float = originalPrice - discountPrice

        // share values
        CalcData.price = price
        CalcData.dollarsOff = dollarsOff
        CalcData.discount = discount
        CalcData.otherDiscount = otherDiscount
        CalcData.tax = tax
        CalcData.discountPrice = discountPrice
        CalcData.originalPrice = originalPrice
        CalcData.amountSaved = amountSaved
        
        let originalLabel:String = String(originalPrice)
        originalPriceLabel.text = originalLabel
        let discountLabel:String = String(discountPrice)
        discountPriceLabel.text = discountLabel
        
    }
    
    // Enable Unwinding Other Views
    @IBAction func unwindToCalc(segue:UIStoryboardSegue) {
        
    }

}
