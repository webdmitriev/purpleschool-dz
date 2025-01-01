//
//  ViewController.swift
//  FirstApp
//
//  Created by Олег Дмитриев on 01.01.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.number.textColor = .systemGray
        self.number.font = .systemFont(ofSize: 32, weight: .bold)
        // Do any additional setup after loading the view.
    }

    @IBAction func actionMinus(_ sender: Any) {
        guard let num = self.number.text else { return }
        
        if Int(num)! <= 0 { return }
        
        self.number.text = "\(Int(num)! - 1)"
    }
    @IBAction func actionPlus(_ sender: Any) {
        guard let num = self.number.text else { return }
        
        self.number.text = "\(Int(num)! + 1)"
    }
    
}

