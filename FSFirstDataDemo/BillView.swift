//  BillView.swift
//  FSFirstDataDemo
//
//  Created by Fred Sevillano on 10/2/16.
//  Copyright © 2016 admin. All rights reserved.

import UIKit

extension UILabel {
    func setSizeFont (sizeFont: CGFloat) {
        self.font =  UIFont(name: self.font.fontName, size: sizeFont)!
    }
}

class BillView: UIViewController {

    var thankYou = UILabel()
    var locationName = UILabel()
    var selection = UILabel()
    
    var itemOneName = UILabel()
    var itemOnePriceDisplay = UILabel()
    
    var itemTwoName = UILabel()
    var itemTwoPriceDisplay = UILabel()
    
    var itemThreeName = UILabel()
    var itemThreePriceDisplay = UILabel()
    
    var itemFourName = UILabel()
    var itemFourPriceDisplay = UILabel()
    
    var itemFiveName = UILabel()
    var itemFivePriceDisplay = UILabel()
    
    var billPreTax = Double()
    var billTotal = Double()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(colorLiteralRed: 0.3, green: 0.5, blue: 0.7, alpha: 1.0)
        
        thankYou = UILabel.init(frame: CGRect(x: 5, y: 20, width: 200, height: 20))
        thankYou.text = "Thank you for choosing:"
        view.addSubview(thankYou)
        
        locationName = UILabel.init(frame: CGRect(x: 0, y: 45, width: view.frame.size.width, height: 40))
        locationName.text = "Boardwalk Fine Dining!"
        locationName.textAlignment = .center
        locationName.setSizeFont(sizeFont: 25.0)
        locationName.textColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        view.addSubview(locationName)
        
        selection = UILabel.init(frame: CGRect(x: 0, y: 95, width: view.frame.size.width, height: 20))
        selection.text = "---  Selection  ---"
        selection.textAlignment = .center
        selection.setSizeFont(sizeFont: 14.0)
        view.addSubview(selection)
        
        itemOneName = UILabel.init(frame: CGRect(x: 20, y: 120, width: view.frame.size.width, height: 30))
        itemOneName.text = "---  Selection  ---"
        itemOneName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemOneName)

        itemOnePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 120, width: view.frame.size.width - 30, height: 30))
        itemOnePriceDisplay.text = "$29.99"
        itemOnePriceDisplay.textAlignment = .right
        itemOnePriceDisplay.setSizeFont(sizeFont: 16.0)
        view.addSubview(itemOnePriceDisplay)
        
        itemTwoName = UILabel.init(frame: CGRect(x: 20, y: 150, width: view.frame.size.width, height: 30))
        itemTwoName.text = "---  Selection  ---"
        itemTwoName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemTwoName)

        itemTwoPriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 150, width: view.frame.size.width - 30, height: 30))
        itemTwoPriceDisplay.text = "$37.99"
        itemTwoPriceDisplay.textAlignment = .right
        itemTwoPriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemTwoPriceDisplay)
        
        itemThreeName = UILabel.init(frame: CGRect(x: 20, y: 180, width: view.frame.size.width, height: 30))
        itemThreeName.text = "---  Selection  ---"
        itemThreeName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemThreeName)
        
        itemThreePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 180, width: view.frame.size.width - 30, height: 30))
        itemThreePriceDisplay.text = "$48.49"
        itemThreePriceDisplay.textAlignment = .right
        itemThreePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemThreePriceDisplay)
        
        itemFourName = UILabel.init(frame: CGRect(x: 20, y: 210, width: view.frame.size.width, height: 30))
        itemFourName.text = "---  Selection  ---"
        itemFourName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFourName)
        
        itemFourPriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 210, width: view.frame.size.width - 30, height: 30))
        itemFourPriceDisplay.text = "$13.99"
        itemFourPriceDisplay.textAlignment = .right
        itemFourPriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFourPriceDisplay)
        
        itemFiveName = UILabel.init(frame: CGRect(x: 20, y: 240, width: view.frame.size.width, height: 30))
        itemFiveName.text = "---  Selection  ---"
        itemFiveName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFiveName)
        
        itemFivePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 240, width: view.frame.size.width - 30, height: 30))
        itemFivePriceDisplay.text = "$12.47"
        itemFivePriceDisplay.textAlignment = .right
        itemFivePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFivePriceDisplay)
        
        
        
        
        // Item one  + price //steak and fries
        
        // Item two + price // Table D'haute
        
        // Item three + price // Bottle of wine
        
        // Item four + price //  Desert 1
        
        // Item five + price // Desert 2
        
        
        // Tip button switch  $/%
        
        
        
        // sales tax + %
        
        // Tip area
        
        // total dynamic
        
        // Payment button
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
