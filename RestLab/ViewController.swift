//
//  ViewController.swift
//  RestLab
//
//  Created by Admin on 17.11.16.
//  Copyright © 2016 Yaroslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {

    //UIElemets
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numbers: UIStepper!
    @IBOutlet weak var advice: UILabel!
    @IBOutlet weak var adviceForValues: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var confrimButtonOK: UIButton!
    var imageView: UIImageView!
    //
    
    //For input
    var textView:UITextField!
    var textViewTwo:UITextField!
    var arrayOfTextFields:[UITextField] = []
    var arrayOfValueFields:[UITextField] = []
    var arrayOfNames:[String] = []
    var arrayOfValues:[String] = []
    //
    
 
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addBlurEffect()
        
       //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
       // self.navigationController?.navigationBar.shadowImage = UIImage()
      //  self.navigationController?.navigationBar.isTranslucent = true
         imageView = UIImageView(image: UIImage(named: "RegularBig.png"))
         imageView.frame = (view.viewWithTag(2)?.frame)!
         title = "Igred"
     
        scrollView.backgroundColor = UIColor.clear
        self.view.viewWithTag(1)?.backgroundColor = UIColor.clear
        self.view.viewWithTag(2)?.addSubview(imageView)
        self.view.viewWithTag(2)?.addSubview(scrollView)
       
        
        let blurEffect = UIBlurEffect(style:.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        
        blurEffectView.frame.size = CGSize(width: 320, height: 67)
        
        self.view.viewWithTag(2)?.addSubview(blurEffectView)
        //self.navigationController?.navigationBar.sendSubview(toBack: blurEffectView)
         /*
        ---------------------------------------------------
        let color1 = UIColor(red: 36.0 / 255.0, green: 198.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0).cgColor
        let color2 = UIColor(red: 81.0 / 255.0, green: 74.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y:1.0)
        
        self.view.viewWithTag(1)?.layer.insertSublayer(gradientLayer, at: 0)
        self.view.viewWithTag(2)?.layer.insertSublayer(gradientLayer, at: 0)
        */
    }
   
    
    
    @IBAction func InputFinish(_ sender: UIBarButtonItem) {
        view.viewWithTag(1)?.endEditing(true)
       

        self.performSegue(withIdentifier: "Second", sender: sender)
        
    }
    
  @IBAction func changingValue(_ sender: UIStepper) {
    
        numberLabel.text = String(Int(sender.value))
        confrimButtonOK.isEnabled = true
     }

    @IBAction func OK(_ sender: UIButton) {
        
        numbers.isHidden = true
        confrimButtonOK.isHidden = true
        numberLabel.isHidden = true
        
        let number = Int(numberLabel.text!)
        
            let textViewHeight = 30
            let textViewWidth = 97
            let startPoint = CGPoint(x: 48, y: 190)
            let startPointTwo = CGPoint(x: 177, y: 190)
            let space = 10
            for i in 0...number!-1 {
                
                
                
                textView = UITextField(frame: CGRect(x: Int(startPoint.x), y: Int(startPoint.y + CGFloat((textViewHeight + space) * i)), width: textViewWidth, height: textViewHeight))
                textView.placeholder = "Potato"
                textView.clearButtonMode = .whileEditing
                self.arrayOfTextFields.append(textView)
                
                
                textViewTwo = UITextField(frame: CGRect(x: Int(startPointTwo.x), y: Int(startPointTwo.y + CGFloat((textViewHeight + space) * i)), width: textViewWidth, height: textViewHeight))
                textViewTwo.placeholder = "123.2"
                textViewTwo.clearButtonMode = .whileEditing
                self.arrayOfValueFields.append(textViewTwo)
                
                
                
                self.view.viewWithTag(1)?.addSubview(textView)
                self.view.viewWithTag(1)?.addSubview(textViewTwo)
                
                
                textView.layer.cornerRadius = 5
                textView.layer.borderColor = UIColor.black.cgColor
                textView.layer.backgroundColor = UIColor.white.cgColor
                textView.alpha = 0.8
                textView.layer.borderWidth = 1
                
               
                textViewTwo.layer.cornerRadius = 5
                textViewTwo.layer.borderColor = UIColor.black.cgColor
                textViewTwo.layer.backgroundColor = UIColor.white.cgColor
                textViewTwo.alpha = 0.8
                textViewTwo.layer.borderWidth = 1
            }
       
        advice.isHidden = false
        adviceForValues.isHidden = false
    }
   

    @IBAction func doneeeee(_ sender: UIButton) {
        
        
        for element in arrayOfTextFields {
            arrayOfNames.append(element.text!)
        }
        
        for element in arrayOfValueFields {
            arrayOfValues.append(element.text!)
        }
        
        for element in arrayOfNames {
            print(element)
        }
        
        for element in arrayOfValues {
            print(element)
        }
       
    }
   
 
  // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   //     if segue.identifier == "Second" {
    //        if let secondVC = segue.destination as? SecondViewController {
   //             secondVC.nameIncomeArray = arrayOfNames
    //            secondVC.valuesIncomeArray = arrayOfValues
     //
     //       }
     //  }
   // }


//
//   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "Second" {
//        if let DVC = segue.destination as? SecondViewController{
//            DVC.incomeNames = arrayOfNames
//        } else {
//           print("Data NOT Passed! destination vc is not set to firstVC")
//        }
//    } else { print("Id doesnt match with Storyboard segue Id") }
// }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second" {
            let svc = segue.destination as! SecondViewController
            
            svc.incomeNames = arrayOfNames
            svc.incomeValues = arrayOfValues
            
        }
    }
}
extension UIColor {
    class var rstAquaMarine: UIColor {
        return UIColor(red: 36.0 / 255.0, green: 198.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0)
    }
    class var rstBlueberry: UIColor {
        return UIColor(red: 81.0 / 255.0, green: 74.0 / 255.0, blue: 157.0 / 255.0, alpha: 1.0)
    }
}

