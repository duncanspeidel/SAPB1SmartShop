//
//  ViewController.swift
//  SAPB1SmartShop
//
//  Created by Speidel, Duncan on 7/24/17.
//  Copyright © 2017 SAP B1 Innovation Summit. All rights reserved.
//

import UIKit
//import FacebookCore
import FacebookLogin
/*
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit
*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = LoginButton(readPermissions: [ .PublicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        
        /*
         * Register settings and Load default settings
        */

        registerSettingsBundle()
        let defaults = UserDefaults.standard

        /*
         * Build strings to hold the prefences 
         */
        var password = String()
        var login = String()
        var SLaddress = String()
        var SLuser = String()
        var SLpassword =  String ()
        /*
         * Because these value return optional("perfence value") we must unwrap them in order to store them in the string var properly
         * if on of the defaults.string(forKey: returns nil, this will crash app
         * TODO: add error checking 
         */
        password = defaults.string(forKey: "password")!
        login = defaults.string(forKey: "userid")!
        SLaddress = defaults.string(forKey: "SL")!
        SLuser = defaults.string(forKey: "SLUSER")!
        SLpassword = defaults.string(forKey: "sl_password")!

        
        /*
         * Preference debug statements
         */
            print ("FB UserID = ", login)
            print ("FB Password=", password)
            print ("SL address = ", SLaddress)
            print ("SL user = ", SLuser)
            print ("SL password = ", SLpassword)
        //End debug block
        
        FBLogon(logon: login as NSString, password: password as NSString)
        

        
    }//viewDid load
    
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }//registerSettingsBundle
    

    
    func FBLogon(logon: NSString, password:NSString)
    {
        print ("Logon = ", logon)
        print ("Password = ", password)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func SettingClicked(_ sender: UIButton) {
        /*
         * Access settings for the app
         */
        let settings_app: URL = URL(string: UIApplicationOpenSettingsURLString)!
        UIApplication.shared.open(settings_app)
    }
}

