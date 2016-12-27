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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view = self.scrollView
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        
        let screenSize: CGRect = UIScreen.main.bounds;
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        //Create textview
        let textView : UITextView = UITextView(frame : CGRect(x:      10,
                                                              y:      (screenHeight/2),
                                                              width:  (screenWidth-20),
                                                              height: (screenHeight/3)));
        
        textView.backgroundColor = UIColor( red: 0.9, green: 0.9, blue:0.9, alpha: 1.0 );
        
        textView.text = NSLocalizedString("Start typing... maybe...", comment: "");
        
        //textView.borderStyle:  border's are not supported by the UITextView
        
        self.view.addSubview(textView);
        
        return;
     
    }
    
    @IBAction func changingValue(_ sender: UIStepper) {
        numberLabel.text = String(Int(sender.value))
    }
  /*  @IBAction func ingredNumber(_ sender: UITextField) {
        
        _ = self.IngNumber.text
        
        
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        let textView : UITextView = UITextView(frame : CGRect(x:10, y:(screenHeight/2), width:(screenWidth-20), height: (screenHeight/3) ))
        textView.backgroundColor = UIColor( red: 0.9, green: 0.9, blue:0.9, alpha: 1.0 )
        textView.text = NSLocalizedString("Start typing... maybe...", comment: "");

        
        //   textView.autocorrectionType = .Yes
        self.view.addSubview( textView )
        
        
        }
      */
}

