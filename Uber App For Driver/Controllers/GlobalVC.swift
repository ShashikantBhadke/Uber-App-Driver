//
//  GlobalVC.swift
//  Uber App For Driver
//
//  Created by Trupti Karale on 16/12/17.
//  Copyright © 2017 Ankita Chordia. All rights reserved.
//

import Foundation
import UIKit

typealias ok_Handler = () -> Void

func showAlert(title: String, msg: String, viewController:UIViewController){
    let alert = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)

    let cancelAction = UIAlertAction.init(title: "Cancel", style: .default, handler: nil)
    
    alert.addAction(cancelAction)
    
    viewController.present(alert, animated: true, completion: nil)
}

func showAlertWithOkAction(viewController:UIViewController,ok_handler: ok_Handler?){
    let alert = UIAlertController.init(title: "Success", message: "", preferredStyle: .alert)
    
    let OkAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
        ok_handler!()
    }
    
    alert.addAction(OkAction)
    
    viewController.present(alert, animated: true, completion: nil)
    
}




