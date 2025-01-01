//
//  ViewController.swift
//  FirstApp
//
//  Created by Олег Дмитриев on 01.01.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    private var counterNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.counterLabel.text = "\(self.counterNumber)"
        self.counterLabel.textColor = .systemGray
        self.counterLabel.font = .systemFont(ofSize: 32, weight: .bold)
    }

    @IBAction func minusButtonDidTap(_ sender: Any) {
        if self.counterNumber <= 0 { return }
        self.counterNumber = self.counterNumber - 1
        changeCounterLabel(self.counterNumber)
    }
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        self.counterNumber = self.counterNumber + 1
        changeCounterLabel(self.counterNumber)
    }
    
    private func changeCounterLabel(_ num: Int) {
        self.counterLabel.text = "\(num)"
    }
    
}

