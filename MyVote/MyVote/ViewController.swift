//
//  ViewController.swift
//  MyVote
//
//  Created by David Araya on 2019-08-25.
//  Copyright © 2019 ElValle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    private let locationSource = ["Canada", "United States of America", "France", "England"]
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var locationPicker: UIPickerView!
    
    @IBAction func buttonAction(_ sender: Any) {
        print("Button i clicked")
        
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationPicker.dataSource = self
        locationPicker.delegate = self
        
        //view.addSubview(initButton)
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return locationSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationLabel.text = locationSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationSource[row]
    }
}
