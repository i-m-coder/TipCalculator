//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sumanth Madala on 12/31/16.
//  Copyright © 2016 Sumanth Madala. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let percents = ["10%","15%","20%","25%", "30%"]
    @IBAction func onBillEntered(_ sender: Any) {
           updateResult(prow:percentPicker.selectedRow(inComponent: 0))
    }
    

    @IBOutlet weak var displayResult: UITextView!
    
    
    @IBOutlet weak var percentPicker: UIPickerView!
    
    @IBOutlet weak var inputAmount: UITextField!
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return percents.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return percents[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateResult(prow: row)
    }
    
    @IBAction func onAmountChanged(_ sender: Any) {
        updateResult(prow:percentPicker.selectedRow(inComponent: 0))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateResult(prow:Int){
        let enterValue = inputAmount.text
        
        if(!enterValue!.isEmpty){
            
            let intvalue = Float64(enterValue!)
            let result = calculateTotal(amount: intvalue!, crow: prow)
            displayResult.text = "Total Bill = $ \(result.1) \n with Tips of $ \(result.0)"
            
            
        }
    }
    
    func calculateTotal(amount: Float64, crow: Int) ->  (Float64 ,Float64){
        var sTip =    percents[crow].components(separatedBy: "%")
        let perValue = Float64(sTip[0])
        let tipvalue = amount*perValue!/100;
        let total = amount+tipvalue;
        
    return(tipvalue,total)
    }


}

