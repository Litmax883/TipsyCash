//
//  ResultViewController.swift
//  Tipsy
//
//  Created by MAC on 10.10.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var count: Double = 2
    var tip: Double!
    var result: Double!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBAction func recalcPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(format: "%.2f", result)
        commentLabel.text = "Split between \(Int(count)) people, with \(Int(tip))% tip."
    }

}
