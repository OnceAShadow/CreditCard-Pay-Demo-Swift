//  PaymentView.swift
//  FSFirstDataDemo
//
//  Created by Fred Sevillano on 10/2/16.
//  Copyright © 2016 admin. All rights reserved.

import UIKit

//enum CardType {
//    case Unknown
//    case Visa
//    case MC
//    case Amex
//}

class PaymentView: UIViewController, UITextFieldDelegate {

    //var cardType = CardType()
    var ccText = UILabel()
    var ccType = UILabel()
    
    var cardHolderName = UITextField()
    var cardNumbers = UITextField()
    var cvvNumbers = UITextField()
    
    var amountToBeCharged = UILabel()
    var billText = UILabel()
    var billAmount = Double()
    
    var payButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(colorLiteralRed: 0.3, green: 0.5, blue: 0.7, alpha: 1.0)
        
        ccText = UILabel.init(frame: CGRect(x: 20, y: 35, width: 100, height: 30))
        ccText.text = "Card Type: "
        view.addSubview(ccText)
        
        ccType = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: 30, width: 200, height: 40))
        ccType.textAlignment = .center
        ccType.textColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        ccType.text = "Unknown"
        ccType.setSizeFont(sizeFont: 25.0)
        view.addSubview(ccType)
                
        // Cardholder's name
        
        // CC Numbers numbers only
        
        // CVV Number textfield max size 4 numbers only
        
        amountToBeCharged = UILabel.init(frame: CGRect(x: 50, y: view.frame.size.height - 250, width: 200, height: 30))
        amountToBeCharged.text = "Amount To Be Charged: "
        amountToBeCharged.textAlignment = .left
        amountToBeCharged.setSizeFont(sizeFont: 16.0)
        view.addSubview(amountToBeCharged)
        
        billText = UILabel.init(frame: CGRect(x: view.frame.size.width - 145, y: view.frame.size.height - 250, width: 100, height: 30))
        billText.text = "$\(billAmount)"
        billText.textAlignment = .center
        billText.setSizeFont(sizeFont: 18.0)
        billText.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        
        view.addSubview(billText)
        
        payButton = UIButton.init(frame: CGRect(x: view.frame.size.width/2 - 80, y: view.frame.size.height - 200, width: 160, height: 50))
        payButton.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        payButton.layer.borderWidth = 1
        payButton.layer.borderColor = UIColor.black.cgColor
        payButton.layer.cornerRadius = 12
        payButton.setTitle("Accept Payment", for: .normal)
        payButton.setTitleColor(.black, for: .normal)
        payButton.addTarget(self, action: #selector(sendPayment), for: .touchUpInside)
        view.addSubview(payButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func sendPayment(button: UIButton) {
        
    }
}
