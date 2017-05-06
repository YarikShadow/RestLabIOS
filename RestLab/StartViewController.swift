//
//  StartViewController.swift
//  RestLab
//
//  Created by Admin on 17.02.17.
//  Copyright © 2017 Yaroslav. All rights reserved.
//

import UIKit
import UserNotifications

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,initialSpringVelocity: 6.0,
                       options: .allowUserInteraction, animations: {
            [weak self] in self?.startButton.transform = .identity
        }, completion: nil)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        sheduleNotification(inSeconds: 10) { (sucsess) in
            if sucsess {
                print("+")
            } else {
                print("-")
            }
        }
    }
    
    
    

    @available(iOS 10.0, *)
    func sheduleNotification(inSeconds seconds: TimeInterval, completion: (Bool) -> ()) {
        
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
        
        let date = Date(timeIntervalSinceNow: seconds)
        
        let content = UNMutableNotificationContent()
        content.title = "RestLab"
        content.body = "Hey, calculate some dishes"
        content.sound = UNNotificationSound.default()
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: "MyUniqueIdentifier", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
    
    @available(iOS 10.0, *)
    func removeNotifications(withIdentifiers identifiers: [String]) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    @available(iOS 10.0, *)
    deinit {
        removeNotifications(withIdentifiers: ["MyUniqueIdentifier"])
    }
   
}
