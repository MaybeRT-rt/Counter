//
//  ViewController.swift
//  Counter
//
//  Created by Liz-Mary on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var clickButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счетчика: \(count)"
        clickButton.layer.cornerRadius = 14
    }
    
    
    @IBAction func tappedCountButton(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счетчика: \(count)"
    }
}
