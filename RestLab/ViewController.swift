//
//  ViewController.swift
//  RestLab
//
//  Created by Admin on 17.11.16.
//  Copyright © 2016 Yaroslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {

    @IBOutlet weak var numberLabel: UILabel!
     @IBOutlet weak var IngNumber: UITextField!
     let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    var numberOfViews : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Igred"
        
        //self.view = self.scrollView
        //self.view.translatesAutoresizingMaskIntoConstraints = false;
        
     }
    
    @IBAction func changingValue(_ sender: UIStepper) {
        numberLabel.text = String(Int(sender.value))
        numberOfViews = Int(numberLabel.text!)!
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
       
        
    
            
     
            let textView : UITextView = UITextView(frame : CGRect(x:      50,
                                                                  y:      (screenHeight/2),
                                                                  width:  (screenWidth-100),
                                                                  height: (screenHeight/10)))
            
                textView.backgroundColor = UIColor( red: 0.9, green: 0.9, blue:0.9, alpha: 1.0 )
            
                textView.text = NSLocalizedString("Put ingredient here", comment: "")
            
            
            
                self.view.addSubview(textView)
            
                return
            
    
            
        
    }

}

