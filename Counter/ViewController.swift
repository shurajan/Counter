//
//  ViewController.swift
//  Counter
//
//  Created by Alexander Bralnin on 22.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Controls
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var buttonPlus: UIButton!
    
    @IBOutlet private weak var buttonMinus: UIButton!
    
    @IBOutlet private weak var buttonRestart: UIButton!
    
    @IBOutlet private weak var changeLogTextView: UITextView!
    
    // MARK: - Instance Properties
    private var counter = 0
    private let dateFormatter = DateFormatter()
    
    // MARK: - Instance Methods
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        counterLabel.text = "0"
        changeLogTextView.text = "История изменений:\n"
    }
    
    // MARK: - Private Methods
    private func logAndShowEvent (what message: String){
        let formattedDate = dateFormatter.string(from: Date.now)
        let logMessage = "[\(formattedDate)]: \(message)\n"
        changeLogTextView.text += logMessage
        let bottom = NSMakeRange(changeLogTextView.text.count - 1, 1)
        changeLogTextView.scrollRangeToVisible(bottom)
    }
    
    // MARK: - Actions Handling Methods
    @IBAction private func buttonPlusDidTap(_ sender: Any) {
        counter+=1
        counterLabel.text = "Значение счётчика: \(counter)"
        logAndShowEvent(what: "значение изменено на +1")
    }
    
    
    @IBAction private func buttonMinusDidTap(_ sender: Any) {
        if counter >= 1{
            counter-=1
            counterLabel.text = "Значение счётчика: \(counter)"
            logAndShowEvent(what: "значение изменено на -1")
        } else {
            logAndShowEvent(what: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    
    @IBAction private func buttonRestartDidTap(_ sender: Any) {
        counter=0
        counterLabel.text = "0"
        logAndShowEvent(what: "значение сброшено")
    }
}

