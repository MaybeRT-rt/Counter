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
    
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var pluseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(count)"
        clickButton.layer.cornerRadius = 14
        minusButton.layer.cornerRadius = 14
        pluseButton.layer.cornerRadius = 14
    }
    
    @IBAction func tappedPluseButton(_ sender: Any) {
        count += 1
        counterLabel.text =  "\(count)"
    }
    
    @IBAction func tappedMinusButton(_ sender: Any) {
        guard count != 0 else { return }
        count -= 1
        counterLabel.text =  "\(count)"
    }
    
    @IBAction func tappedRefreshButton(_ sender: Any) {
        count = 0
        counterLabel.text =  "\(count)"
    }
//    @IBAction func tappedCountButton(_ sender: Any) {
//        count += 1
//        counterLabel.text =  "\(count)"
//    }
}
