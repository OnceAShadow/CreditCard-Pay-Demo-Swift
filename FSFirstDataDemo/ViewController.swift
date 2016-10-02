//  ViewController.swift
//  FSFirstDataDemo
//
//  Created by Fred Sevillano on 10/2/16.
//  Copyright © 2016 admin. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    let KApiKey = "test_apikey_bA8hIqpzuAVW6itHqXsXwSl6JtFWPCA0"
    let KApiSecret = "test_apitsecret_YmI4YzA1NmRkZmQzMzA1ZmIZjYzwMWIzZThkMWU2NGRjZmI4OWE5NGRiMzM4NA=="
    let KToken = "test_merchant_token_fdoa-a480ce8951daa73262734cf102641994c1e55e7cdf4c02b6"
    let KURL = "https://api-cert.payeezy.com/v1/transactions"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var demoClient = PayeezySDK.init(apiKey: KApiKey, apiSecret: KApiSecret, merchantToken: KToken, url: KURL)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

