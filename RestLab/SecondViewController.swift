//
//  SecondViewController.swift
//  RestLab
//
//  Created by Admin on 28.12.16.
//  Copyright © 2016 Yaroslav. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var nameIncomeArray: [String]!
    var incomeNames:[String]!{
        didSet{
            nameIncomeArray = incomeNames //no need to call viewDidLoad
        }
    }
    var valuesIncomeArray:[String]!
    var incomeValues:[String]!{
        didSet{
            valuesIncomeArray = incomeValues
        }
    }
    
    
    
    // UIElements
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var enterMenu: UILabel!
    @IBOutlet weak var calculationButton: UIButton!
    
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
    @IBOutlet weak var firstSwitcher: UISwitch!
    @IBOutlet weak var secondSwitcher: UISwitch!
    var enable:Bool = false
    var enableSecond:Bool = false
    
    
    @IBAction func OnOff(_ sender: UISwitch) {
        
        first.text = "Percentage of them"
        
        if firstSwitcher.isOn == true {
            
            first.isHidden = false
            percentageDishesTwo.isHidden = false
            secondSwitcher.isEnabled = true
            enable = true
        
        } else {
            
            first.isHidden = true
            percentageDishesTwo.isHidden = true
            secondSwitcher.isEnabled = false
            second.isHidden = true
            percentageDishesThree.isHidden = true
            enable = false
        }
     }
    
    
    @IBAction func OnOffTwo(_ sender: UISwitch) {
        
        if firstSwitcher.isOn && secondSwitcher.isOn == true {
            
            second.isHidden = false
            percentageDishesThree.isHidden = false
            enableSecond = true
        
        } else if secondSwitcher.isOn != true {
            
            second.isHidden = true
            percentageDishesThree.isHidden = true
            enableSecond = false
        }
    }
    //
    
    @IBAction func NameTyping(_ sender: UITextField) {
        
        desiredDishesName.text = nameOfDishes.text
        
    }
    // MARK: Main func //
    
    func  calculating() {
        
        if(self.numberPerDay.text != "" && self.percentageDishesOne.text != "" ) {
            if isNamePassed == true  {
                if !(Int(percentageDishesOne.text!)! >= 100) || !(Int(percentageDishesOne.text!)! <= 0) {
        
                    let resultOne:Double = (Double(numberPerDay.text!)!/Double(percentageDishesOne.text!)!) * Double(100)
                    mainResult.text = String(Int(resultOne))
        
                    let resultPrst: Double = ( resultOne / Double(percentageDishesOne.text!)!)
                    dishesPerNameResult.text = String(Int(resultPrst))
                    isCalculated = true
                    valuesIncomeArray.enumerated().forEach{ index, value in
                        valuesIncomeArray[index] = String(Double(value)! * resultPrst)
                    }
                    
                    // first switcher opertions
        if enable == true {
            
            let resultTwo:Double = (resultOne/Double(percentageDishesTwo.text!)!) * Double(100)
            percentageTwoResult.text = String(Int(resultTwo))
            
            let resultPrstTwo: Double = ( resultTwo / Double(percentageDishesOne.text!)!)
            dishesPerNameResult.text = String(Int(resultPrstTwo))
            isCalculated = true
                if enableSecond == false {
                    valuesIncomeArray.enumerated().forEach{ index, value in
                        valuesIncomeArray[index] = String(Double(value)! * resultPrstTwo)
                        }
                        }
                 // second switcher operations
        if enableSecond == true {
                    
                    let resultTree:Double = (resultTwo/Double(percentageDishesThree.text!)!) * Double(100)
                  percentageThreeResult.text = String(Int(resultTree))
                    
                    let resultPrstThree: Double = ( resultTree / Double(percentageDishesOne.text!)!)
                    dishesPerNameResult.text = String(Int(resultPrstThree))
                    isCalculated = true
                    valuesIncomeArray.enumerated().forEach{ index, value in
                        valuesIncomeArray[index] = String(Double(value)! * resultPrstThree)
                    }

            }
        }
                }else{
                    let alert = UIAlertController(title: "You wrote wrong percentage", message: "Please do it again", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(cancelAction)
                    present(alert, animated: true, completion: nil)
                }
                
            } else {
                let alert = UIAlertController(title: "You did not write name of the desired dishes", message: "Please fill this field for correct result", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                present(alert, animated: true, completion: nil)

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
    var isNamePassed:Bool = false
    
    @IBAction func inputFinish(_ sender: Any) {
        view.viewWithTag(1)?.endEditing(true)
        
        self.performSegue(withIdentifier: "Third", sender: sender)
    }
    
   

    func textFieldDidChange(_ nameOfDishes: UITextField) {
        isNamePassed = true
    }
    
    @IBAction func showResultButton(_ sender: UIButton) {
        
        calculating()
        
        view.endEditing(true)
        
            if isCalculated == true {
                showIngredTable.isEnabled = true
            } else {
                showIngredTable.isEnabled = false
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for element in incomeNames {
            print(element)
        }

        title =  "Values"
        enterMenu.text = "Enter the number of dishes in the menu"
        calculationButton.setTitle("Calculate",for: .normal)
        
        let imageView = UIImageView(image: UIImage(named: "RegularBig.png"))
        
        imageView.frame = (view.viewWithTag(2)?.frame)!
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        scrollView.backgroundColor = UIColor.clear
        self.view.viewWithTag(1)?.backgroundColor = UIColor.clear
        self.view.viewWithTag(2)?.addSubview(imageView)
        self.view.viewWithTag(2)?.addSubview(scrollView)
        
        let blurEffect = UIBlurEffect(style:.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        
        blurEffectView.frame.size = CGSize(width: 320, height: 67)
        
        self.view.viewWithTag(2)?.addSubview(blurEffectView)
        nameOfDishes.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        numberPerDay.layer.borderColor = UIColor.black.cgColor
        numberPerDay.layer.borderWidth = 1
        percentageDishesOne.layer.borderColor = UIColor.black.cgColor
        percentageDishesOne.layer.borderWidth = 1
        nameOfDishes.layer.borderColor = UIColor.black.cgColor
        nameOfDishes.layer.borderWidth = 1
        percentageDishesTwo.layer.borderColor = UIColor.black.cgColor
        percentageDishesTwo.layer.borderWidth = 1
        percentageDishesThree.layer.borderColor = UIColor.black.cgColor
        percentageDishesThree.layer.borderWidth = 1
        numberMenu.layer.borderColor = UIColor.black.cgColor
        numberMenu.layer.borderWidth = 1
        self.navigationController?.navigationBar.tintColor = UIColor.white

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Third" {
            if let thirdVC = segue.destination as? ThirdViewController {
                thirdVC.incomeNames = incomeNames
                thirdVC.incomeValues = valuesIncomeArray
                
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


