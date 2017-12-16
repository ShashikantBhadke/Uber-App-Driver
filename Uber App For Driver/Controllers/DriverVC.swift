//
//  DriverVC.swift
//  Uber App For Driver
//
//  Created by Trupti Karale on 16/12/17.
//  Copyright © 2017 Ankita Chordia. All rights reserved.
//

import UIKit
import MapKit

class DriverVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    //MARK:- Outlets
    @IBOutlet weak var myMap: MKMapView!
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK:- Btn Actions
    @IBAction func cancleUber_btn_Clicked(_ sender: UIButton) {
        
    }
    
    @IBAction func logOut_btn_Clicker(_ sender: UIBarButtonItem) {
        if AuthProvider.Instance.logOut(){
            dismiss(animated: true, completion: nil)
        }else{
            showAlert(title: "Error", msg: "We Could not logout. plese try again,", viewController: self)
        }
        
    }
    
}//class

















