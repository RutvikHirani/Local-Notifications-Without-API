//
//  ViewController.swift
//  NOTIFICATION
//
//  done by Rutvik Hirani on 27/12/18.

//

import UIKit
import UserNotifications
class ViewController: UIViewController {
 
    func notificationsTrigger(){
        let content = UNMutableNotificationContent()
        content.title = "My Title"
        content.body = "My Body"
        content.sound = UNNotificationSound.default()

        let gregorian = Calendar(identifier: .gregorian)
        let now = Date()
        var components = gregorian.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)

        // Change the year date everything you want 😃
        components.year = 2020
        components.month = 10
        components.day = 31
        
        components.hour = 17
        components.minute = 52
        components.second = 5
        
        let date = gregorian.date(from: components)!

        let triggerDaily = Calendar.current.dateComponents([.year, .month, .day,.hour,.minute,.second,], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
        print("INSIDE NOTIFICATION")

        UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
            if let error = error {
                print("SOMETHING WENT WRONG\(error.localizedDescription))")
            }
        })

    }
    @IBAction func notificationAction(_ sender: UIButton) {
        notificationsTrigger()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.alert,.badge],completionHandler: {didAllow,error in})
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

