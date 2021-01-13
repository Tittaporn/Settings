//
//  SettingController.swift
//  Settings
//
//  Created by Lee McCormick on 1/13/21.
//  Copyright © 2021 Karl Pfister. All rights reserved.
//

import Foundation
class SettingController {
    
    // MARK: - Properties
    static let shared = SettingController()
    
    // S.O.T
    let settings: [Setting] = {
        /*
         //Image Literal are saving you from import UIKit >> Cannot find 'UIImage' in scope
         let musicTestImageLiteral = Setting(name: "Music", icon: UIImage(name: "book"), isOn: false)
         */
        let music = Setting(name: "Music", icon: #imageLiteral(resourceName: "iTunes"), isOn: false)
        let apps = Setting(name: "Apps", icon: #imageLiteral(resourceName: "appStore"), isOn: false)
        let books = Setting(name: "Music", icon: #imageLiteral(resourceName: "iBooks"), isOn: false)
        return [music, apps, books]
    }()
    
    // MARK: - CRUD
    
    func toggleIsOn(setting: Setting) {
        setting.isOn = !setting.isOn
    }
    /*
     There are 3 way to do toggleIsOn
     setting.isOn = !setting.isOn
     
     setting.isOn.toggle() //This is the function of toggle is false
     
     if setting.isOn == true {  // Check if the seting is on
     setting.isOn = false //set the setting to off
     } else {
     setting.isOn = true //set the setting to on
     }
     */
    
    
}
