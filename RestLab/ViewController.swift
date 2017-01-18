//
//  ViewController.swift
//  RestLab
//
//  Created by Admin on 17.11.16.
//  Copyright © 2016 Yaroslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {

   
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var second: UITextField!
    @IBOutlet weak var third: UITextField!
    @IBOutlet weak var four: UITextField!
    @IBOutlet weak var fifth: UITextField!
    @IBOutlet weak var six: UITextField!
    @IBOutlet weak var sevens: UITextField!
    @IBOutlet weak var eights: UITextField!
    @IBOutlet weak var nines: UITextField!
    @IBOutlet weak var tens: UITextField!
    @IBOutlet weak var elevens: UITextField!
    @IBOutlet weak var twelves: UITextField!
    @IBOutlet weak var thirdteens: UITextField!
    @IBOutlet weak var fourteens: UITextField!
    @IBOutlet weak var fiveteens: UITextField!
    

    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numbers: UIStepper!
    
   
    var textView:UITextField!
    var textViewTwo:UITextView!
    var valueOfStepper = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Igred"
        
        /*
        let color1 = UIColor(red: 153/255, green: 26/255, blue: 61/255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 243/255, green: 155/255, blue: 51/255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y:1.0)
        self.view.viewWithTag(1)?.layer.insertSublayer(gradientLayer, at: 0)
        self.view.viewWithTag(2)?.layer.insertSublayer(gradientLayer, at: 0)
        
        
        //self.view = self.scrollView
        //self.view.translatesAutoresizingMaskIntoConstraints = false;
        */
      }
    
    
    @IBOutlet weak var Scroll: UIScrollView!
    
  
    
    var foodo:[Food] = []
    
    @IBAction func InputFinish(_ sender: UIBarButtonItem) {
        
        
        for i in 0...valueOfStepper - 1 {
            
            
           //var food = [ Food(name: textView.text!, value: textViewTwo.text!, id: i + 1)]
            //foodo[i] = food[i]
      //      let food:[String] = [textView.text]
            
            //print(food[i])
        }
        
        
        /*
        food = [
            Food(name: first.text!, value: firstValue.text!, id: "1"),
            Food(name: second.text!, value: secondValue.text!, id: "2"),
            Food(name: third.text!, value: thirdValue.text!, id: "3"),
            Food(name: fourth.text!, value: fourthValue.text!, id: "4"),
            Food(name: fifth.text!, value: fifthValue.text!, id: "5"),
            Food(name: six.text!, value: sixValue.text!, id: "6"),
            Food(name: sevens.text!, value: sevensValue.text!, id: "7"),
            Food(name: eights.text!, value: eightsValue.text!, id: "8"),
            Food(name: nines.text!, value: ninesValue.text!, id: "9"),
            Food(name: tens.text!, value: tensValue.text!, id: "10"),
            Food(name: elevens.text!, value: elevensValue.text!, id: "11"),
            Food(name: twelves.text!, value: twelvesValue.text!, id: "12"),
            Food(name: thirteens.text!, value: thirteensValue.text!, id: "13"),
            Food(name: fourteens.text!, value: fourteensValue.text!, id: "14")
            
        ]
        */
    }
    
    //let text:[UITextField] = [self.first, self.second, self.third ]
    
    
    @IBAction func changingValue(_ sender: UIStepper) {
        
        numberLabel.text = String(Int(sender.value))
        let number = Int(numberLabel.text!)
        
        
        var previousValue = 0
        if number! > previousValue {
        
            let textViewHeight = 30
            let textViewWidth = 97
            let startPoint = CGPoint(x: 48, y: 190)
            let startPointTwo = CGPoint(x: 177, y: 190)
        
            for i in 0...number!-1 {
                textView = UITextField(frame: CGRect(x: Int(startPoint.x), y: Int(startPoint.y + CGFloat(textViewHeight * i)), width: textViewWidth, height: textViewHeight))
               
                textViewTwo = UITextView(frame: CGRect(x: Int(startPointTwo.x), y: Int(startPointTwo.y + CGFloat(textViewHeight * i)), width: textViewWidth, height: textViewHeight))
               
            
                self.view.viewWithTag(1)?.addSubview(textView)
                self.view.viewWithTag(1)?.addSubview(textViewTwo)
                
                
                textView.tag = 1 + i
                print(textView.tag)
                textView.layer.cornerRadius = 5
                textView.layer.borderColor = UIColor.blue.cgColor
                textView.layer.borderWidth = 1
                textView.viewWithTag(1)
                
                textViewTwo.tag = 101 + i
               // print(textViewTwo.tag)
                textViewTwo.layer.cornerRadius = 5
                textViewTwo.layer.borderColor = UIColor.blue.cgColor
                textViewTwo.layer.borderWidth = 1
                
                
               
            
            }
           previousValue =  previousValue + number!
            valueOfStepper += number!
            //print(previousValue)
           
       
        } else if number! < previousValue {
            for i in 0...number!-1 {
            
                let textView = self.view.viewWithTag(i) as! UITextView
                    textView.willRemoveSubview((textView))
            }
            previousValue =  previousValue + number!
            //print(previousValue)
            }
        
   
      
       
    }

    
    @IBAction func OK(_ sender: UIButton) {
        for i in 0...valueOfStepper - 1 {
        textView.text = "lol"
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second" {
            if let secondVC = segue.destination as? SecondViewController {
                if let values = sender as? [Food] {
                    secondVC.values = foodo
                }
            }
        }
    }

}


