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

    var ccText = UILabel()
    var ccType = UILabel()
    
    var cardHolderText = UILabel()
    var cardHolderName = UITextField()
    
    var cardNumbersText = UILabel()
    var cardNumbers = UITextField()
    
    var cvvText = UILabel()
    var cvvNumbers = UITextField()
    
    var amountText = UILabel()
    var amountValue = UILabel()
    
    var requestStatus = UILabel()
    
    var billAmount = Double()
    
    var payButton = UIButton()
    var backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(colorLiteralRed: 0.3, green: 0.5, blue: 0.7, alpha: 1.0)
        
        backButton = UIButton.init(frame: CGRect(x: -8, y: 35, width: 45, height: 60))
        backButton.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.layer.cornerRadius = 10
        backButton.setTitle("<", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector(backToBill), for: .touchUpInside)
        view.addSubview(backButton)
        
        ccText = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 50, y: 55, width: 100, height: 30))
        ccText.text = "Card Type"
        ccText.textAlignment = .center
        ccText.setSizeFont(sizeFont: 14.0)
        view.addSubview(ccText)
        
        ccType = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: 70, width: 200, height: 40))
        ccType.text = "Unknown"
        ccType.textAlignment = .center
        ccType.textColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        ccType.setSizeFont(sizeFont: 20.0)
        view.addSubview(ccType)
                
        cardHolderText = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: 120, width: 200, height: 30))
        cardHolderText.text = "Name On Card"
        cardHolderText.textAlignment = .center
        cardHolderText.setSizeFont(sizeFont: 14.0)
        view.addSubview(cardHolderText)

        cardHolderName = UITextField.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: 145, width: 200, height: 30))
        cardHolderName.text = ""
        cardHolderName.placeholder = "Name"
        cardHolderName.textAlignment = .center
        cardHolderName.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        cardHolderName.layer.cornerRadius = 8
        view.addSubview(cardHolderName)
        
        cardNumbersText = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: 200, width: 200, height: 30))
        cardNumbersText.text = "Credit Card Number"
        cardNumbersText.textAlignment = .center
        cardNumbersText.setSizeFont(sizeFont: 14.0)
        view.addSubview(cardNumbersText)
        
        cardNumbers = UITextField.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: 225, width: 200, height: 30))
        cardNumbers.text = ""
        cardNumbers.placeholder = "Number"
        cardNumbers.textAlignment = .center
        cardNumbers.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        cardNumbers.layer.cornerRadius = 8
        view.addSubview(cardNumbers)
        
        cvvText = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 50, y: 280, width: 100, height: 30))
        cvvText.text = "CVV Number"
        cvvText.textAlignment = .center
        cvvText.setSizeFont(sizeFont: 14.0)
        view.addSubview(cvvText)
        
        cvvNumbers = UITextField.init(frame: CGRect(x: view.frame.size.width/2 - 50, y: 305, width: 100, height: 30))
        cvvNumbers.text = ""
        cvvNumbers.placeholder = "CVV"
        cvvNumbers.textAlignment = .center
        cvvNumbers.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        cvvNumbers.layer.cornerRadius = 8
        view.addSubview(cvvNumbers)
        
        amountText = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: view.frame.size.height - 275, width: 200, height: 30))
        amountText.text = "Amount To Be Charged"
        amountText.textAlignment = .center
        amountText.setSizeFont(sizeFont: 16.0)
        view.addSubview(amountText)
        
        amountValue = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 50, y: view.frame.size.height - 250, width: 100, height: 30))
        amountValue.text = "$\(billAmount)"
        amountValue.textAlignment = .center
        amountValue.setSizeFont(sizeFont: 24.0)
        amountValue.textColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        view.addSubview(amountValue)
        
        payButton = UIButton.init(frame: CGRect(x: view.frame.size.width/2 - 80, y: view.frame.size.height - 190, width: 160, height: 50))
        payButton.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.5, blue: 0.20, alpha: 1.0)
        payButton.layer.borderWidth = 1
        payButton.layer.borderColor = UIColor.black.cgColor
        payButton.layer.cornerRadius = 12
        payButton.setTitle("Accept Payment", for: .normal)
        payButton.setTitleColor(.black, for: .normal)
        payButton.addTarget(self, action: #selector(sendPayment), for: .touchUpInside)
        view.addSubview(payButton)
        
        requestStatus = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: view.frame.size.height - 125, width: 200, height: 30))
        requestStatus.text = ""
        requestStatus.textAlignment = .center
        requestStatus.setSizeFont(sizeFont: 18.0)
        view.addSubview(requestStatus)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func sendPayment(button: UIButton) {
        
    }
    
    func backToBill(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
