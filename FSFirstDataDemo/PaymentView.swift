//  PaymentView.swift
//  FSFirstDataDemo
//
//  Created by Fred Sevillano on 10/2/16.
//  Copyright © 2016 admin. All rights reserved.

import UIKit

class PaymentView: UIViewController, UITextFieldDelegate {

    let KApiKey = "YJoqkxsRGYxo6cBczGJRq4VGVF0hJrQd"
    let KApiSecret = "9ba602ee5a9dbc971d2aa9ef51686cb3f5214d27033becfeed4a1966f4bea0bd"
    let KToken = "fdoa-7fae54dc5420e9198cf708675ea45eda7fae54dc5420e919"
    let KURL = "https://api-cert.payeezy.com/v1/transactions"
    
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
    
    var attempts = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        attempts = 0
        
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
        cardHolderName.addTarget(self, action: #selector(cardNameCheck), for: .editingChanged)
        cardHolderName.delegate = self
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
        cardNumbers.keyboardType = .numberPad
        cardNumbers.addTarget(self, action: #selector(cardNumbersCheck), for: .editingChanged)
        cardNumbers.delegate = self
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
        cvvNumbers.keyboardType = .numberPad
        cvvNumbers.addTarget(self, action: #selector(cvvNumbersCheck), for: .editingChanged)
        cvvNumbers.delegate = self
        view.addSubview(cvvNumbers)
        
        amountText = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: view.frame.size.height - 275, width: 200, height: 30))
        amountText.text = "Amount To Be Charged"
        amountText.textAlignment = .center
        amountText.setSizeFont(sizeFont: 16.0)
        view.addSubview(amountText)
        
        amountValue = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: view.frame.size.height - 250, width: 200, height: 30))
        amountValue.text = String(format: "$%.2f", billAmount)
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
        
        requestStatus = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 125, y: view.frame.size.height - 125, width: 250, height: 90))
        requestStatus.text = ""
        requestStatus.numberOfLines = 4
        requestStatus.textAlignment = .center
        requestStatus.setSizeFont(sizeFont: 16.0)
        view.addSubview(requestStatus)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func backToBill(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendPayment(button: UIButton) {
        requestStatus.text = "One Moment Please..."
        requestStatus.setSizeFont(sizeFont: 16.0)
        requestStatus.textColor = .black
        
        var amount = String(format: "%.2f", billAmount)
        amount = amount.replacingOccurrences(of: ".", with: "")
        
        let credit_card: [String: String] = ["type": "visa",
                                            "name": "John Smith",
                                            "number": "4788250000028291",
                                            "cvv": "123",
                                            "exp": "1020"]
                                          
        let transaction_info: [String: String] = ["currency": "USD",
                                                  "amount": amount,
                                                  "merchantRef": "3176752955",
                                                  "type": "purchase"]
        
        let testClient = PayeezySDK.init(apiKey: KApiKey, apiSecret: KApiSecret, merchantToken: KToken, url: KURL)
        
        testClient?.submitAuthorizePurchaseTransaction(withCreditCardDetails: credit_card["type"], cardExpMMYY: credit_card["exp"], cardNumber: credit_card["number"], cardHolderName: credit_card["name"], cardType: credit_card["type"], currencyCode: transaction_info["currency"], totalAmount: transaction_info["amount"], merchantRef: transaction_info["merchantRef"], transactionType: "purchase", token_type: "FDToken", method: "token", completion: { (data, error) in
            
            if error == nil {
                self.requestStatus.text = "Transaction Successful! You were emailed a copy of the Receipt."
                self.requestStatus.setSizeFont(sizeFont: 16.0)
                self.requestStatus.textColor = .black
                self.payButton.isEnabled = false
                self.payButton.setTitle("Successful!", for: .disabled)
                self.payButton.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.8, blue: 0.50, alpha: 1.0)
                
            }else{
                self.attempts += 1
                if self.attempts < 3 {
                    self.requestStatus.text = String(format: "Transction Error: %@", error.debugDescription)
                    self.requestStatus.textColor = .red
                    self.requestStatus.setSizeFont(sizeFont: 14.0)
                }else{
                    self.requestStatus.text = String(format: "Transction Error! Please contact your Bank.")
                    self.requestStatus.textColor = .red
                    self.requestStatus.setSizeFont(sizeFont: 16.0)
                    self.payButton.isEnabled = false
                    self.payButton.setTitle("Blocked!", for: .disabled)
                    self.payButton.backgroundColor = UIColor(colorLiteralRed: 0.5, green: 0.4, blue: 0.50, alpha: 1.0)
                }
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func cardNameCheck(textField: UITextField) {
        
    }
    
    func cardNumbersCheck(textField: UITextField) {
        
    }
    
    func cvvNumbersCheck(textField: UITextField) {
        
    }

}
