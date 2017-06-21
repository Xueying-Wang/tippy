//
//  ViewController.swift
//  tippy
//
//  Created by Xueying Wang on 6/20/17.
//  Copyright © 2017 Xueying Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true)
        calculateTip()
    }

    func calculateTip() {
        
        let defaults = UserDefaults.standard
        let tipRate = defaults.double(forKey: "default_tip_percentage")
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipRate
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onSegmentedChange(_ sender: Any) {
        let commonPercentages = [0.18, 0.2, 0.25]
        
        let defaults = UserDefaults.standard
        let tipRate = commonPercentages[tipControl.selectedSegmentIndex]
        defaults.set(tipRate, forKey: "default_tip_percentage")
        defaults.synchronize()
        calculateTip()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        calculateTip()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
}

