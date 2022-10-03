//
//  ShowAlertsManager.swift
//  Netflix
//
//  Created by Ahmed Yasein on 9/29/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import Foundation
import UIKit
class AlertManager {
    
    private static let sharedInstance = AlertManager()
       
       class func shared()-> AlertManager{
           return AlertManager.sharedInstance
       }
       
    func showAlertWithCancel(alertTitle: String,message: String,actionTitle: String, completion: @escaping () -> Void){
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: completion)
    }
}
