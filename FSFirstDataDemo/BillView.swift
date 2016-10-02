//  BillView.swift
//  FSFirstDataDemo
//
//  Created by Fred Sevillano on 10/2/16.
//  Copyright © 2016 admin. All rights reserved.

import UIKit

class BillView: UIViewController {

    var thankYou = UILabel()
    var locationName = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        thankYou = UILabel.init(frame: CGRect(x: 5, y: 10, width: 200, height: 30))
        thankYou.text = "Thank you for choosing:"
        view.addSubview(thankYou)
        
        locationName = UILabel.init(frame: CGRect(x: 10, y: 50, width: 200, height: 50))
        locationName.text = "Boardwalk Fine Dining!"
        locationName.textColor = UIColor
        view.addSubview(locationName)
        
        // Title
        
        // Selection
        
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
