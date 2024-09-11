//
//  ViewController.swift
//  Counter
//
//  Created by Liz-Mary on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    //MARK: UI
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var clickButton: UIButton!
    
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var pluseButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    
    //MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(count)"
        logTextView.isEditable = false
        configureButtons()
    }
    
    func configureButtons() {
        clickButton.layer.cornerRadius = 14
        minusButton.layer.cornerRadius = 14
        pluseButton.layer.cornerRadius = 14
    }
    
    //MARK: - Actions
    @IBAction func tappedPluseButton(_ sender: Any) {
        count += 1
        counterLabel.text =  "\(count)"
        updateHistory(with: "значение изменено на +1")
    }
    
    @IBAction func tappedMinusButton(_ sender: Any) {
        guard count != 0 else {
            updateHistory(with: "попытка уменьшить значение счётчика ниже 0")
            return
        }
        count -= 1
        counterLabel.text =  "\(count)"
        updateHistory(with: "значение изменено на -1")
    }
    
    @IBAction func tappedRefreshButton(_ sender: Any) {
        count = 0
        counterLabel.text =  "\(count)"
        updateHistory(with: "значение сброшено")
    }

}

// MARK: - extensions
extension ViewController {
    
    func updateHistory(with text: String) {
        let currentDate = Date() // хранит текущие дату и время
        let dateFormatter = DateFormatter() // для преобразования времени в конкретный формат
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss" // устанавливаем формат
        let formattedDate = dateFormatter.string(from: currentDate) // преобразуем в строку
        
        let newEntry = "\n[\(formattedDate)]: \(text)"
        logTextView.text += newEntry
    }
    
}
