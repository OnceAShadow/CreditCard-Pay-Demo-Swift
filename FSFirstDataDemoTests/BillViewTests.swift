//  BillViewTests.swift
//  FSFirstDataDemo
//
//  Created by Fred Sevillano on 10/3/16.
//  Copyright © 2016 admin. All rights reserved.

import XCTest
@testable import FSFirstDataDemo

class BillViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFieldIsMonetaryValueTwoDots() {
        let testTextField = UITextField.init()
        let billView = BillView()
        testTextField.text = "100.05."
        let result = billView.monetaryValue(textField: testTextField)
        XCTAssertEqual(result, false)
    }
    
    func testFieldIsMonetaryValueLetters() {
        let testTextField = UITextField.init()
        let billView = BillView()
        testTextField.text = "Hello"
        let result = billView.monetaryValue(textField: testTextField)
        XCTAssertEqual(result, false)
    }
    
    func testFieldIsMonetaryValueNormal() {
        let testTextField = UITextField.init()
        let billView = BillView()
        testTextField.text = "456.67"
        let result = billView.monetaryValue(textField: testTextField)
        XCTAssertEqual(result, true)
    }
}
