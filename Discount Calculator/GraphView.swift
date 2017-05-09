//
//  GraphView.swift
//  Discount Calculator
//
//  Created by Kristi Chang on 3/6/17.
//  Copyright © 2017 kristi.chang. All rights reserved.
//

import UIKit

extension CGContext {
    func setFillColor(_ hex:Int) {
        // Mask different values of the hex code
        // 0xFF0000 - Red
        // 0x00FF00 - Green
        // 0x0000FF - Blue
        
        // FF0000 >> 0000FF = 255.0 / 255.0 = 1.0 == convenient 0.0/1.0 number
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}

class GraphView: UIView {

    // MARK: properties
    let CalcData: DiscountCalc = DiscountCalc.shared
    var discount = DiscountCalc.shared.discount
    
    
    override func draw(_ rect: CGRect) {
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let leftGuide:CGFloat = 16.0
        let rightGuide:CGFloat = screenWidth - 16.0
        let topGuide:CGFloat = 64.0 + 16.0 //80.0
        // let botGuide:CGFloat = screenHeight - 16.0
        
        // Text Attributes
        let textAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]

        // Rectangle for Amount Saved
        // percent1 is the percentage of space the rectangle will take up
        let percent1 = CGFloat(CalcData.amountSaved / CalcData.originalPrice)
        context.setFillColor(0xFF9FF9)
        context.fill(CGRect(x:rightGuide / 2 + 16, y:topGuide, width:rightGuide / 2 - 16, height:(screenHeight - 96)*percent1))
        
        // write the content inside the rectangle
        let saved = "You Saved "
        let saved2 = "$" + String(CalcData.amountSaved)
        let saved3 = String((CalcData.amountSaved / CalcData.originalPrice) * 100) + "%"
        saved.draw(at:CGPoint(x:rightGuide / 2 + 32, y:topGuide + 16), withAttributes: textAttributes)
        saved2.draw(at:CGPoint(x:rightGuide / 2 + 32, y:topGuide + 32) , withAttributes: textAttributes)
        saved3.draw(at:CGPoint(x:rightGuide / 2 + 32, y:topGuide + 48) , withAttributes: textAttributes)
        
        // Rectangle for Discounted Price
        // percent2 is the percentage of space the you pay rectangle will take up
        let percent2 = CGFloat(CalcData.discountPrice / CalcData.originalPrice)
        context.setFillColor(0x888CFF)
        context.fill(CGRect(x: rightGuide / 2 + 16, y: topGuide + (screenHeight - 96)*percent1, width: rightGuide / 2 - 16, height: (screenHeight - 96)*percent2))
        
        // write the content inside the rectangle
        let pay = "You Pay"
        let pay2 = "$" + String(CalcData.discountPrice)
        let pay3 = String((CalcData.discountPrice / CalcData.originalPrice) * 100) + "%"
        pay.draw(at:CGPoint(x: rightGuide / 2 + 32, y: (topGuide + (screenHeight - 96) * percent1 + 16)), withAttributes: textAttributes)
        pay2.draw(at:CGPoint(x: rightGuide / 2 + 32, y: (topGuide + (screenHeight - 96) * percent1 + 32)), withAttributes: textAttributes)
        pay3.draw(at:CGPoint(x: rightGuide / 2 + 32, y: (topGuide + (screenHeight - 96) * percent1 + 48)), withAttributes: textAttributes)
        
        
        // Rectangle for Original Price
        context.setFillColor(0xB77FFF)
        context.fill(CGRect(x:leftGuide, y:topGuide, width:(rightGuide / 2), height:(screenHeight - 96)*(percent1 + percent2)))
        
        // write the content inside the rectangle
        let oPrice = "Original Price: "
        let oPrice2 = "$" + String(CalcData.originalPrice)
        oPrice.draw(at:CGPoint(x: leftGuide + 16, y: topGuide + 16), withAttributes: textAttributes)
        oPrice2.draw(at:CGPoint(x: leftGuide + 16, y: topGuide + 32), withAttributes: textAttributes)
        
        }

}
