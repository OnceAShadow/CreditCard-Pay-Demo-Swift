//  PaymentViewTests.swift
//  FSFirstDataDemo
//
//  Created by Fred Sevillano on 10/4/16.
//  Copyright © 2016 admin. All rights reserved.

import XCTest
@testable import FSFirstDataDemo

class PaymentViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Credit Card Name Tests
    func testcardNameLettersOnly() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "12345"
        let result = paymentView.cardNameCheck(textField: testTextField)
        XCTAssertEqual(result, false)
    }

    func testcardNameMaxLenght() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "asdfghjklpoiuytrewqasdfghjklpopiuytfsgdfh"
        let result = paymentView.cardNameCheck(textField: testTextField)
        XCTAssertEqual(result, false)
    }
    
    func testcardNameNormal() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "asdfghjklpoiuytrewqasdf"
        let result = paymentView.cardNameCheck(textField: testTextField)
        XCTAssertEqual(result, true)
    }
    
    // Credit Card Numbers Tests
    func testcardNumbersOnly() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "AGGDDA10001"
        let result = paymentView.cardNumbersCheck(textField: testTextField)
        XCTAssertEqual(result, false)
    }
    
    func testcardNumbersMaxLength() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "1234123412341234124"
        let result = paymentView.cardNumbersCheck(textField: testTextField)
        XCTAssertEqual(result, false)
    }
    
    func testcardNumbersNormal() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "1234567890123456"
        let result = paymentView.cardNumbersCheck(textField: testTextField)
        XCTAssertEqual(result, true)
    }

    // CVV Card Numbers Tests
    func testCVVNumbersOnly() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "!WS"
        let result = paymentView.cvvNumbersCheck(textField: testTextField)
        XCTAssertEqual(result, false)
    }
    
    func testCVVNumbersMaxLength() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "12345"
        let result = paymentView.cvvNumbersCheck(textField: testTextField)
        XCTAssertEqual(result, false)
    }
    
    func testCVVNumbersNormal() {
        let testTextField = UITextField.init()
        let paymentView = PaymentView()
        testTextField.text = "123"
        let result = paymentView.cvvNumbersCheck(textField: testTextField)
        XCTAssertEqual(result, true)
    }
}
