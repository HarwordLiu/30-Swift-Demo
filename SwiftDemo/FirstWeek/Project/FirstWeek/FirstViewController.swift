//
//  FirstViewController.swift
//  FirstWeek
//
//  Created by 刘浩 on 2017/10/16.
//  Copyright © 2017年 HarwordLiu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipTotalLabel: UILabel!
    
    @IBOutlet weak var percentSilder: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitUI()
    }
    
    func InitUI() {
        inputTextField.clearButtonMode = .whileEditing
        inputTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        tipLabel.text = getTipLabelTextWith(value: percentSilder.value)
        tipTotalLabel.text = getTipTotalLabelTextWith(value: percentSilder.value)
        return true
    }
    
    @IBAction func moveSlider(_ sender: UISlider) {
        percentLabel.text = getPercentLabelTextWith(value: sender.value)
        tipLabel.text = getTipLabelTextWith(value: sender.value)
        tipTotalLabel.text = getTipTotalLabelTextWith(value: sender.value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputTextField.resignFirstResponder()
    }
    
    func getPercentLabelTextWith(value: Float) -> String {
        return String(format: "Tip%.f%%", value * 100)
    }
    
    func getTipLabelTextWith(value: Float) -> String {
        guard let total = Float(inputTextField.text!) else {
            return "$0.00"
        }
        return String(format: "$%.2f", value * total)
    }
    
    func getTipTotalLabelTextWith(value: Float) -> String {
        guard let total = Float(inputTextField.text!) else {
            return "$0.00"
        }
        return String(format: "$%.2f", total * value + total)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
