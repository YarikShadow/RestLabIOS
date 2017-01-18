//
//  SecondViewController.swift
//  RestLab
//
//  Created by Admin on 28.12.16.
//  Copyright © 2016 Yaroslav. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var values:Array<Any>!
    // Input variables
    
    @IBOutlet weak var numberPerDay: UITextField!
    
    @IBOutlet weak var percentageDishesOne: UITextField!
    
    @IBOutlet weak var nameOfDishes: UITextField!
    
    @IBOutlet weak var percentageDishesTwo: UITextField!
    
    @IBOutlet weak var percentageDishesThree: UITextField!
    
    @IBOutlet weak var numberMenu: UITextField!
    
    //end
    
    // Output results
    
    @IBOutlet weak var mainResult: UILabel!
    @IBOutlet weak var percentageTwoResult: UILabel!
    @IBOutlet weak var percentageThreeResult: UILabel!
    @IBOutlet weak var dishesPerNameResult: UILabel!
    @IBOutlet weak var desiredDishesName: UILabel!
    
    //end
    
    @IBAction func EditEnd(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
    
    
    //MARK: Switchers
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var secondSwitcher: UISwitch!
    var enable:Bool = false
    var enableSecond:Bool = false
    
    
    @IBAction func OnOff(_ sender: UISwitch) {
        
        first.isHidden = false
        percentageDishesTwo.isHidden = false
        enable = true
        secondSwitcher.isEnabled = true
        
     }
    
    
    @IBAction func OnOffTwo(_ sender: UISwitch) {
        
        second.isHidden = false
        percentageDishesThree.isHidden = false
        enableSecond = true
    }
    //
    
    @IBAction func NameTyping(_ sender: UITextField) {
        
        desiredDishesName.text = nameOfDishes.text
        
    }
    // MARK: Main func //
    
    func  calculating() {
        
        if(self.numberPerDay.text != "" && self.percentageDishesOne.text != "" ) {
        
        let resultOne:Double = (Double(numberPerDay.text!)!/Double(percentageDishesOne.text!)!) * Double(100)
        mainResult.text = String(Int(resultOne))
        
        let resultPrst: Double = ( resultOne / Double(percentageDishesOne.text!)!)
        dishesPerNameResult.text = String(Int(resultPrst))
        
        if enable == true {
            
            let resultTwo:Double = (resultOne/Double(percentageDishesTwo.text!)!) * Double(100)
            percentageTwoResult.text = String(Int(resultTwo))
            
            let resultPrstTwo: Double = ( resultTwo / Double(percentageDishesOne.text!)!)
            dishesPerNameResult.text = String(Int(resultPrstTwo))
            
                if enableSecond == true {
                    
                    let resultTree:Double = (resultTwo/Double(percentageDishesThree.text!)!) * Double(100)
                  percentageThreeResult.text = String(Int(resultTree))
                    
                    let resultPrstThree: Double = ( resultTree / Double(percentageDishesOne.text!)!)
                    dishesPerNameResult.text = String(Int(resultPrstThree))

            }
        }
        
        } else {
            let alert = UIAlertController(title: "You did not write values", message: "Please fill first and second fields at least", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    ///////
    
    @IBOutlet weak var showIngredTable: UIBarButtonItem!
    var isCalculated:Bool = false
    
    @IBAction func showResultButton(_ sender: UIButton) {
        calculating()
        isCalculated = true
        
            if isCalculated == true {
                showIngredTable.isEnabled = true
            } else {
                showIngredTable.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title =  "Values"
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Third" {
            if let thirdVC = segue.destination as? ThirdViewController {
                if let values = sender as? Array<Any> {
                    thirdVC.values = values
                }
            }
        }
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
