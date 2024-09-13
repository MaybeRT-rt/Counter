//
//  ViewController.swift
//  Counter
//
//  Created by Liz-Mary on 08.09.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var count = 0
    
    //MARK: @IBOutlet
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var clickButton: UIButton!
    
    @IBOutlet weak private var buttonStack: UIStackView!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var logTextView: UITextView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(count)"
        logTextView.isEditable = false
        configureButtons()
    }
    
   private func configureButtons() {
        clickButton.layer.cornerRadius = 14
        minusButton.layer.cornerRadius = 14
        plusButton.layer.cornerRadius = 14
    }
    
    //MARK: - Actions
    @IBAction private func tappedPlusButton(_ sender: Any) {
        count += 1
        counterLabel.text =  "\(count)"
        updateHistory(with: "значение изменено на +1")
    }
    
    @IBAction private func tappedMinusButton(_ sender: Any) {
        guard count != 0 else {
            updateHistory(with: "попытка уменьшить значение счётчика ниже 0")
            return
        }
        count -= 1
        counterLabel.text =  "\(count)"
        updateHistory(with: "значение изменено на -1")
    }
    
    @IBAction private func tappedRefreshButton(_ sender: Any) {
        count = 0
        counterLabel.text =  "\(count)"
        updateHistory(with: "значение сброшено")
    }
}

// MARK: - extensions
extension ViewController {
    
    private func updateHistory(with text: String) {
        let currentDate = Date() // хранит текущие дату и время
        let dateFormatter = DateFormatter() // для преобразования времени в конкретный формат
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss" // устанавливаем формат
        let formattedDate = dateFormatter.string(from: currentDate) // преобразуем в строку
        
        let newEntry = "\n[\(formattedDate)]: \(text)"
        logTextView.text += newEntry
    }
}
