//
//  ViewController.swift
//  Counter
//
//  Created by Alexander Bralnin on 22.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var buttonRestart: UIButton!
    
    @IBOutlet weak var changeLogTextView: UITextView!
    
    
    private var counter = 0
    private let dateFormatter = DateFormatter()
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        counterLabel.text = "0"
        changeLogTextView.text = "История изменений:\n"
    }
    
    
    @IBAction func buttonPlusDidTap(_ sender: Any) {
        counter+=1
        counterLabel.text = "Значение счётчика: \(counter)"
        logAndShowEvent(what: "значение изменено на +1")
    }
    
    
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        if counter >= 1{
            counter-=1
            counterLabel.text = "Значение счётчика: \(counter)"
            logAndShowEvent(what: "значение изменено на -1")
        } else {
            logAndShowEvent(what: "попытка уменьшить значение счётчика ниже 0")
        }
    }
 
    
    @IBAction func buttonRestartDidTap(_ sender: Any) {
        counter=0
        counterLabel.text = "0"
        logAndShowEvent(what: "значение сброшено")
    }
    
    private func logAndShowEvent (what message: String){
        let formattedDate = dateFormatter.string(from: Date.now)
        let logMessage = "[\(formattedDate)]: \(message)\n"
        changeLogTextView.text += logMessage
        let bottom = NSMakeRange(changeLogTextView.text.count - 1, 1)
        changeLogTextView.scrollRangeToVisible(bottom)
    }
    
}

