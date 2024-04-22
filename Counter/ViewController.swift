//
//  ViewController.swift
//  Counter
//
//  Created by Alexander Bralnin on 22.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var incrementButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    private var counter = 0
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "0"
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
    }
}

