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

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class BillView: UIViewController, UITextFieldDelegate {

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
    
    var salesTaxText = UILabel()
    var salesTaxValue = UILabel()
    
    @IBOutlet var serviceField: UITextField!
    
    var serviceText = UILabel()
    var serviceTypeBtn = UIButton()
    
    var totalText = UILabel()
    var totalDisplay = UILabel()
    
    var toPayment = UIButton()
    
    var billPreTax = Double()
    var taxes = Double()
    var serviceAmount = Double()
    var billTotal = Double()
    
    var paymentView = PaymentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(colorLiteralRed: 0.3, green: 0.5, blue: 0.7, alpha: 1.0)
        
        thankYou = UILabel.init(frame: CGRect(x: 5, y: 30, width: 200, height: 20))
        thankYou.text = "Thank you for choosing:"
        view.addSubview(thankYou)
        
        locationName = UILabel.init(frame: CGRect(x: 0, y: 60, width: view.frame.size.width, height: 40))
        locationName.text = "Boardwalk Fine Dining!"
        locationName.textAlignment = .center
        locationName.setSizeFont(sizeFont: 30.0)
        locationName.textColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        view.addSubview(locationName)
        
        selection = UILabel.init(frame: CGRect(x: 0, y: 110, width: view.frame.size.width, height: 20))
        selection.text = "-----  Selection  -----"
        selection.textAlignment = .center
        selection.setSizeFont(sizeFont: 14.0)
        view.addSubview(selection)
        
        itemOneName = UILabel.init(frame: CGRect(x: 20, y: 135, width: view.frame.size.width, height: 30))
        itemOneName.text = "Cabernet Filet Mignon"
        itemOneName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemOneName)

        itemOnePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 135, width: view.frame.size.width - 30, height: 30))
        itemOnePriceDisplay.text = "$39.99"
        itemOnePriceDisplay.textAlignment = .right
        itemOnePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemOnePriceDisplay)
        
        itemTwoName = UILabel.init(frame: CGRect(x: 20, y: 165, width: view.frame.size.width, height: 30))
        itemTwoName.text = "Wild Surf & Turf"
        itemTwoName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemTwoName)

        itemTwoPriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 165, width: view.frame.size.width - 30, height: 30))
        itemTwoPriceDisplay.text = "$47.99"
        itemTwoPriceDisplay.textAlignment = .right
        itemTwoPriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemTwoPriceDisplay)
        
        itemThreeName = UILabel.init(frame: CGRect(x: 20, y: 195, width: view.frame.size.width, height: 30))
        itemThreeName.text = "2010 Château Faizeau"
        itemThreeName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemThreeName)
        
        itemThreePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 195, width: view.frame.size.width - 30, height: 30))
        itemThreePriceDisplay.text = "$52.49"
        itemThreePriceDisplay.textAlignment = .right
        itemThreePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemThreePriceDisplay)
        
        itemFourName = UILabel.init(frame: CGRect(x: 20, y: 225, width: view.frame.size.width, height: 30))
        itemFourName.text = "Gâteau Forêt-Noire"
        itemFourName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFourName)
        
        itemFourPriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 225, width: view.frame.size.width - 30, height: 30))
        itemFourPriceDisplay.text = "$14.99"
        itemFourPriceDisplay.textAlignment = .right
        itemFourPriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFourPriceDisplay)
        
        itemFiveName = UILabel.init(frame: CGRect(x: 20, y: 255, width: view.frame.size.width, height: 30))
        itemFiveName.text = "Key Lime Pie"
        itemFiveName.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFiveName)
        
        itemFivePriceDisplay = UILabel.init(frame: CGRect(x: 10, y: 255, width: view.frame.size.width - 30, height: 30))
        itemFivePriceDisplay.text = "$12.49"
        itemFivePriceDisplay.textAlignment = .right
        itemFivePriceDisplay.setSizeFont(sizeFont: 14.0)
        view.addSubview(itemFivePriceDisplay)
        
        lineSubTotal = UILabel.init(frame: CGRect(x: 0, y: 290, width: view.frame.size.width, height: 20))
        lineSubTotal.text = "---------------------"
        lineSubTotal.textAlignment = .center
        lineSubTotal.setSizeFont(sizeFont: 14.0)
        view.addSubview(lineSubTotal)
        
        billPreTax = 167.95
        taxes = billPreTax * 0.075
        taxes = taxes.roundTo(places: 2)
        billTotal = billPreTax + taxes
        
        salesTaxText = UILabel.init(frame: CGRect(x: view.frame.size.width - 220, y: 320, width: 140, height: 30))
        salesTaxText.text = "Sales Tax (7.5%): "
        salesTaxText.textAlignment = .right
        salesTaxText.setSizeFont(sizeFont: 14.0)
        view.addSubview(salesTaxText)
        
        salesTaxValue = UILabel.init(frame: CGRect(x: 0, y: 320, width: view.frame.size.width - 18, height: 30))
        salesTaxValue.text = String(format: "$%.2f", taxes)
        salesTaxValue.textAlignment = .right
        salesTaxValue.setSizeFont(sizeFont: 14.0)
        view.addSubview(salesTaxValue)
        
        serviceTypeBtn = UIButton.init(frame: CGRect(x: view.frame.size.width - 179, y: 353, width: 30, height: 30))
        serviceTypeBtn.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        serviceTypeBtn.layer.borderWidth = 1
        serviceTypeBtn.layer.borderColor = UIColor.black.cgColor
        serviceTypeBtn.layer.cornerRadius = 8
        serviceTypeBtn.setTitle("$", for: .normal)
        serviceTypeBtn.setTitleColor(.black, for: .normal)
        serviceTypeBtn.addTarget(self, action: #selector(changeServiceType) , for: .touchUpInside)
        view.addSubview(serviceTypeBtn)
        
        serviceText = UILabel.init(frame: CGRect(x: view.frame.size.width - 156, y: 355, width: 75, height: 25))
        serviceText.text = "Service:  "
        serviceText.textAlignment = .right
        serviceText.setSizeFont(sizeFont: 14.0)
        view.addSubview(serviceText)
        
        serviceField = UITextField.init(frame: CGRect(x: view.frame.size.width - 74, y: 355, width: 60, height: 25))
        serviceField.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        serviceField.layer.cornerRadius = 4
        serviceField.textAlignment = .center
        serviceField.text = ""
        serviceField.placeholder = "$0.00"
        serviceField.keyboardType = .numbersAndPunctuation
        serviceField.delegate = self
        serviceField.addTarget(self, action: #selector(monetaryValue), for: .editingChanged)
        serviceField.addTarget(self, action: #selector(updateTotal), for: .editingDidEnd)
        view.addSubview(serviceField)
        
        totalText = UILabel.init(frame: CGRect(x: view.frame.size.width - 155, y: 385, width: 60, height: 30))
        totalText.text = "Total: "
        totalText.textAlignment = .right
        totalText.setSizeFont(sizeFont: 18.0)
        view.addSubview(totalText)
        
        totalDisplay = UILabel.init(frame: CGRect(x: 0, y: 385, width: view.frame.size.width - 16, height: 30))
        totalDisplay.text = String(format: "$%.2f", billTotal)
        totalDisplay.textAlignment = .right
        totalDisplay.setSizeFont(sizeFont: 18.0)
        view.addSubview(totalDisplay)
        
        toPayment = UIButton.init(frame: CGRect(x: view.frame.size.width/2 - 90, y: view.frame.size.height - 200, width: 180, height: 50))
        toPayment.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        toPayment.layer.borderWidth = 1
        toPayment.layer.borderColor = UIColor.black.cgColor
        toPayment.layer.cornerRadius = 12
        toPayment.setTitle("Proceed To Payment", for: .normal)
        toPayment.setTitleColor(.black, for: .normal)
        toPayment.addTarget(self, action: #selector(goToPaymentView), for: .touchUpInside)
        view.addSubview(toPayment)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // change the tip from precent to money or back
    func changeServiceType(button: UIButton) {
        if !button.isSelected {
            button.isSelected = true
            button.setTitle("%", for: .normal)
            serviceField.placeholder = "0%"
        } else {
            button.isSelected = false
            button.setTitle("$", for: .normal)
            serviceField.placeholder = "$0.00"
        }
        serviceField.text = ""
        calculateService()
    }
    
    //changes the view to the payment view
    func goToPaymentView(button: UIButton) {
        paymentView = PaymentView.init()
        paymentView.billAmount = billTotal
        present(paymentView, animated: true, completion: nil)
    }
    
    //hides the keyboard when the user leaves the textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    // Update the total when user leaves the textfield
    func updateTotal(textField: UITextField) {
        calculateService()
    }
    
    func calculateService() {
        if !serviceTypeBtn.isSelected {
            serviceAmount = Double(serviceField.text!) ?? 0
        }else{
            serviceAmount = Double(serviceField.text!) ?? 0
            serviceAmount = serviceAmount * billPreTax * 0.01
        }
        billTotal = billPreTax + taxes + serviceAmount
        totalDisplay.text = String(format: "$%.2f", billTotal)
    }
    
    func monetaryValue(textField: UITextField) -> Bool {
        
        var newText = removeNonMonetaryValueCharacters(text: textField.text!)
        
        //prevents the field from having anything else then numbers and .
        if newText.characters.count != textField.text?.characters.count {
            textField.text = newText
            return false
        }
        
        // prevents the field from having 2 "."
        if (textField.text?.components(separatedBy: ".").count)! > 2 {
            textField.text?.remove(at: (textField.text?.index(before: (textField.text?.endIndex)!))!)
            return false
        }
        
        return true
    }
    
    func removeNonMonetaryValueCharacters(text: String) -> String {
        //let goodChars : Set<Character> = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_".characters)
        let goodChars : Set<Character> = Set("0123456789.".characters)
        return String(text.characters.filter { goodChars.contains($0)})
    }

}
