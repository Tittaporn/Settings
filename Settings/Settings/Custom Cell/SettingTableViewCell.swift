//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Lee McCormick on 1/13/21.
//  Copyright © 2021 Karl Pfister. All rights reserved.
//

import UIKit


// BOSS == PROTOCAL >> always write the protocol outside the class and above the class
// : AnyObject >> Always write : AnyObject, when create protocol

// 1) Create the protocol (BOSS)
protocol SettingCellDelegate: AnyObject {
    
    // 1.5) State what the boss can do
    func settingSwitchToggled(cell: SettingTableViewCell)
}


class SettingTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var settingIconImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    
    // Who it's delegate (employee) is
    // 2) Set the delegate - Who the boss's employee is
    weak var delegate: SettingCellDelegate?
    
    
    // MARK: - Actions
    @IBAction func settingSwichToggled(_ sender: UISwitch) {
        // 3) Communicate to delegate (employee) instruction
        delegate?.settingSwitchToggled(cell: self)
    }
    
    // MARK: - Helper Fuctions
    
    func updateView(setting: Setting) {
        settingIconImageView.image = setting.icon
        settingNameLabel.text = setting.name
        settingSwitch.isOn = setting.isOn
        
        if setting.isOn { // == true
            backgroundColor = .cyan
        } else {
            backgroundColor = .white
        }
    }
}
