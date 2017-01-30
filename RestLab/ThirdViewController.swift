//
//  ThirdViewController.swift
//  RestLab
//
//  Created by Admin on 01.01.17.
//  Copyright © 2017 Yaroslav. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    

    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Result"
        tableView.dataSource = self
        tableView.delegate = self
        let imageView = UIImageView(image: UIImage(named: "RegularBig.png"))
        imageView.frame = (view.viewWithTag(2)?.frame)!
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        tableView.frame = (view.viewWithTag(2)?.frame)!
        self.tableView.backgroundView = imageView
       
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //blurView.frame = imageView.bounds
        //imageView.addSubview(blurView)
        blurEffectView.frame.size = CGSize(width: 320, height: 67)
        
        //self.view.viewWithTag(2)?.addSubview(imageView)
        self.view.viewWithTag(2)?.addSubview(blurEffectView)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameIncomeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        
        cell?.backgroundColor = UIColor.clear
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.text = nameIncomeArray[indexPath.row] + " " + valuesIncomeArray[indexPath.row] + "grams"
        //cell?.detailTextLabel?.text = valuesIncomeArray[indexPath.row]
        
        return cell!
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
}
    
