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

    let KApiKey = "test_apikey_bA8hIqpzuAVW6itHqXsXwSl6JtFWPCA0"
    let KApiSecret = "test_apitsecret_YmI4YzA1NmRkZmQzMzA1ZmIZjYzwMWIzZThkMWU2NGRjZmI4OWE5NGRiMzM4NA=="
    let KToken = "test_merchant_token_fdoa-a480ce8951daa73262734cf102641994c1e55e7cdf4c02b6"
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
        
        requestStatus = UILabel.init(frame: CGRect(x: view.frame.size.width/2 - 100, y: view.frame.size.height - 125, width: 200, height: 30))
        requestStatus.text = ""
        requestStatus.textAlignment = .center
        requestStatus.setSizeFont(sizeFont: 18.0)
        view.addSubview(requestStatus)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func backToBill(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendPayment(button: UIButton) {
        
        let ccName = cardHolderName.text
        let ccNumber = cardNumbers.text
        let cvv = cvvNumbers.text
        let expDate = "0450"
        var amount = String(format: "%.2f", billAmount)
        amount = amount.replacingOccurrences(of: ".", with: "")
        
        var testClient = PayeezySDK.init(apiKey: KApiKey, apiSecret: KApiSecret, merchantToken: KToken, url: KURL)
        
        //testClient?.submitAuthorizePurchaseTransaction(withCreditCardDetails: , cardExpMMYY: expDate, cardNumber: ccNumber, cardHolderName: ccName, cardType: <#T##String!#>, currencyCode: <#T##String!#>, totalAmount: <#T##String!#>, merchantRef: <#T##String!#>, transactionType: <#T##String!#>, token_type: <#T##String!#>, method: <#T##String!#>, completion: <#T##(([AnyHashable : Any]?, Error?) -> Void)!##(([AnyHashable : Any]?, Error?) -> Void)!##([AnyHashable : Any]?, Error?) -> Void#>)
        
        
        
        
        // This is from the Objective C Example.
        
        
//        NSString* cardHolderName = _card_holder_name.text;
//        NSDecimalNumber* valueEntered = [NSDecimalNumber decimalNumberWithString:_amountEntered.text];
//        NSString* cardNumber  = _card_number.text;
//        NSString* cardSecurityCode = _card_security_code.text;
//        
//        if (![valueEntered isEqualToNumber:[NSDecimalNumber notANumber]]) {
//            
//            NSString *amount = [[NSString stringWithFormat:@"%@",valueEntered] stringByReplacingOccurrencesOfString:@"." withString:@""];
//            
//            // Test credit card inf
//            NSDictionary* credit_card = @{
//                @"type":@"visa",
//                @"cardholder_name":cardHolderName,
//                @"card_number":cardNumber,
//                @"exp_date":@"0450",
//                @"cvv":cardSecurityCode
//            };
//            PayeezySDK* myClient = [[PayeezySDK alloc]initWithApiKey:KApiKey apiSecret:KApiSecret merchantToken:KToken url:KURL];
//            
//            //myClient.url = KURL;
//            
//            [myClient submitAuthorizeTransactionWithCreditCardDetails:credit_card[@"type"] cardHolderName:credit_card[@"cardholder_name"] cardNumber:credit_card[@"card_number"] cardExpirymMonthAndYear:credit_card[@"exp_date"] cardCVV:credit_card[@"cvv"] currencyCode:@"USD" totalAmount:amount merchantRefForProcessing:@"abc1412096293369"
//            
//            completion:^(NSDictionary *dict, NSError *error) {
//                
//                NSString *authStatusMessage = nil;
//                
//                if (error == nil)
//                {
//                    authStatusMessage = [NSString stringWithFormat:@"Transaction Successful\rType:%@\rTransaction ID:%@\rTransaction Tag:%@\rCorrelation Id:%@\rBank Response Code:%@",
//                    [dict objectForKey:@"transaction_type"],
//                    [dict objectForKey:@"transaction_id"],
//                    [dict objectForKey:@"transaction_tag"],
//                    [dict objectForKey:@"correlation_id"],
//                    [dict objectForKey:@"bank_resp_code"]];
//                    [self voidRefundCaptureTransaction:@"abc1412096293369" :[dict objectForKey:@"transaction_tag"] :@"capture" :[dict objectForKey:@"transaction_id"] :amount];
//                    
//                }
//                else
//                {
//                    authStatusMessage = [NSString stringWithFormat:@"Error was encountered processing transaction: %@", error.debugDescription];
//                }
//                
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"First Data Payment Authorization"
//                message:authStatusMessage delegate:self
//                cancelButtonTitle:@"Dismiss"
//                otherButtonTitles:nil];
//                [alert show];
//            }];
//        }
        
       
        
        
        
    }
    
}
