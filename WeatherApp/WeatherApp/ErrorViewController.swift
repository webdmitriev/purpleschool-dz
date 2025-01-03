//
//  ErrorViewController.swift
//  WeatherApp
//
//  Created by Олег Дмитриев on 03.01.2025.
//

import UIKit

class ErrorViewController: ViewController {
    
    @IBOutlet private weak var messageLabel: UILabel!
    
    var message: String? {
        didSet {
            guard let message = self.message else { return }
            self.messageLabel.text = message
        }
    }
    
    @IBOutlet weak var actionButton: UIButton!
    
    var actionButtonTitle: String? {
        didSet {
            guard let actionButtonTitle = self.actionButtonTitle else { return }
            self.actionButton.setTitle(actionButtonTitle, for: [])
        }
    }
    
    @IBAction private func didTapOpenSettingsButton(_ sender: Any) {
        self.didRequestOpenSettings?()
    }
    
    var didRequestOpenSettings: (() -> Void)?
}
