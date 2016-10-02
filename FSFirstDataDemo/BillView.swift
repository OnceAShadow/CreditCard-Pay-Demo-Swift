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
    
    var lineSubTotal = UILabel()
    
    var salesTax = UILabel()
    var serviceField = UITextField()
    var serviceText = UILabel()
    var serviceTypeBtn = UIButton()
    var totalText = UILabel()
    var totalDisplay = UILabel()
    var toPayment = UIButton()
    
    var billPreTax = Double()
    var billTotal = Double()
    var serviceAmount = Double()
    
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
        selection.text = "-----  Selection  -----"
        selection.textAlignment = .center
        selection.setSizeFont(sizeFont: 14.0)
        view.addSubview(selection)
        
        itemOneName = UILabel.init(frame: CGRect(x: 20, y: 120, width: view.frame.size.width, height: 30))
        itemOneName.text = "Cabernet Filet Mignon"
        itemOneName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemOneName)

        itemOnePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 120, width: view.frame.size.width - 30, height: 30))
        itemOnePriceDisplay.text = "$39.99"
        itemOnePriceDisplay.textAlignment = .right
        itemOnePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemOnePriceDisplay)
        
        itemTwoName = UILabel.init(frame: CGRect(x: 20, y: 150, width: view.frame.size.width, height: 30))
        itemTwoName.text = "Wild Surf & Turf"
        itemTwoName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemTwoName)

        itemTwoPriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 150, width: view.frame.size.width - 30, height: 30))
        itemTwoPriceDisplay.text = "$47.99"
        itemTwoPriceDisplay.textAlignment = .right
        itemTwoPriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemTwoPriceDisplay)
        
        itemThreeName = UILabel.init(frame: CGRect(x: 20, y: 180, width: view.frame.size.width, height: 30))
        itemThreeName.text = "2010 Château Faizeau"
        itemThreeName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemThreeName)
        
        itemThreePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 180, width: view.frame.size.width - 30, height: 30))
        itemThreePriceDisplay.text = "$52.49"
        itemThreePriceDisplay.textAlignment = .right
        itemThreePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemThreePriceDisplay)
        
        itemFourName = UILabel.init(frame: CGRect(x: 20, y: 210, width: view.frame.size.width, height: 30))
        itemFourName.text = "Gâteau Forêt-Noire"
        itemFourName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFourName)
        
        itemFourPriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 210, width: view.frame.size.width - 30, height: 30))
        itemFourPriceDisplay.text = "$14.99"
        itemFourPriceDisplay.textAlignment = .right
        itemFourPriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFourPriceDisplay)
        
        itemFiveName = UILabel.init(frame: CGRect(x: 20, y: 240, width: view.frame.size.width, height: 30))
        itemFiveName.text = "Key Lime Pie"
        itemFiveName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFiveName)
        
        itemFivePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 240, width: view.frame.size.width - 30, height: 30))
        itemFivePriceDisplay.text = "$12.47"
        itemFivePriceDisplay.textAlignment = .right
        itemFivePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFivePriceDisplay)
        
        lineSubTotal = UILabel.init(frame: CGRect(x: 0, y: 270, width: view.frame.size.width, height: 20))
        lineSubTotal.text = "--------------------"
        lineSubTotal.textAlignment = .center
        lineSubTotal.setSizeFont(sizeFont: 14.0)
        view.addSubview(lineSubTotal)
        
        salesTax = UILabel.init(frame: CGRect(x: 0, y: 290, width: view.frame.size.width - 24, height: 30))
        salesTax.text = "Sales Tax:     7.5%"
        salesTax.textAlignment = .right
        salesTax.setSizeFont(sizeFont: 14.0)
        view.addSubview(salesTax)
        
        serviceTypeBtn = UIButton.init(frame: CGRect(x: view.frame.size.width - 179, y: 318, width: 30, height: 30))
        serviceTypeBtn.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        serviceTypeBtn.layer.borderWidth = 1
        serviceTypeBtn.layer.borderColor = UIColor.black.cgColor
        serviceTypeBtn.layer.cornerRadius = 8
        serviceTypeBtn.setTitle("$", for: .normal)
        serviceTypeBtn.setTitleColor(.black, for: .normal)
        serviceTypeBtn.setTitle("%", for: .selected)
        view.addSubview(serviceTypeBtn)
        
        serviceText = UILabel.init(frame: CGRect(x: view.frame.size.width - 156, y: 320, width: 75, height: 25))
        serviceText.text = "Service:  "
        serviceText.textAlignment = .right
        serviceText.setSizeFont(sizeFont: 14.0)
        view.addSubview(serviceText)
        
        serviceField = UITextField.init(frame: CGRect(x: view.frame.size.width - 74, y: 320, width: 60, height: 25))
        serviceField.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        serviceField.layer.cornerRadius = 4
        serviceField.textAlignment = .right
        serviceField.placeholder = "0.00"
        view.addSubview(serviceField)
        
        totalText = UILabel.init(frame: CGRect(x: view.frame.size.width - 140, y: 350, width: 60, height: 30))
        totalText.text = "Total: "
        totalText.textAlignment = .right
        totalText.setSizeFont(sizeFont: 14.0)
        view.addSubview(totalText)
        
        billTotal = 499.99
        
        totalDisplay = UILabel.init(frame: CGRect(x: 0, y: 350, width: view.frame.size.width - 18, height: 30))
        totalDisplay.text = "$\(billTotal)"
        totalDisplay.textAlignment = .right
        totalDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(totalDisplay)
        
        toPayment = UIButton.init(frame: CGRect(x: view.frame.size.width - 220, y: view.frame.size.height - 80, width: 200, height: 60))
        toPayment.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        toPayment.layer.borderWidth = 1
        toPayment.layer.borderColor = UIColor.black.cgColor
        toPayment.layer.cornerRadius = 12
        toPayment.setTitle("Proceed To Payment", for: .normal)
        toPayment.setTitleColor(.black, for: .normal)
        view.addSubview(toPayment)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
