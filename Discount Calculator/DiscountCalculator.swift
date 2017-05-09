//
//  DiscountCalculator.swift
//  Discount Calculator
//
//  Created by Kristi Chang on 3/13/17.
//  Copyright © 2017 kristi.chang. All rights reserved.
//

import UIKit

class DiscountCalc {

    // MARK: Properties
    var price:Float = 0.0
    var dollarsOff:Float = 0.0
    var discount:Float = 0.0
    var otherDiscount:Float = 0.0
    var tax:Float = 0.0
    var originalPrice:Float = 0.0
    var discountPrice:Float = 0.0
    var amountSaved:Float = 0.0
    
    // MARK: Initialization
    init(_ price:Float = 0.0,_ dollarsOff:Float = 0.0,_ discount:Float = 0.0,
         _ otherDiscount:Float = 0.0,_ tax:Float = 7.75) {
        self.price = price
        self.dollarsOff = dollarsOff
        self.discount = discount
        self.otherDiscount = otherDiscount
        self.tax = tax
        setOriginalPrice()
        setDiscountPrice()
        setAmountSaved()
    }
    
    
    // MARK: Functions
    func setOriginalPrice() {
        self.originalPrice = price * (tax / 100) + price
    }
    
    func setDiscountPrice() {
        self.discountPrice = price - (price * (discount / 100) + price * (otherDiscount / 100)) + (price * (tax / 100))
    }
    
    func setAmountSaved() {
        self.amountSaved = originalPrice - discountPrice
    }
    
    func getOriginalPrice() -> Float {
        return originalPrice
    }
    
    
    // MARK: shared
    static let shared:DiscountCalc = DiscountCalc()
    
}
