//
//  ProcessViewController.swift
//  WeatherApp
//
//  Created by Олег Дмитриев on 03.01.2025.
//

import UIKit

class ProcessViewController: UIViewController {
    
    @IBOutlet private weak var messageLabel: UILabel!
    
    var message: String? {
        didSet {
            guard let message = self.message else { return }
            self.messageLabel.text = message
        }
    }
    
}
