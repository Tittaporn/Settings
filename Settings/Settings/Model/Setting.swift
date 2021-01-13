//
//  Setting.swift
//  Settings
//
//  Created by Lee McCormick on 1/13/21.
//  Copyright © 2021 Karl Pfister. All rights reserved.
//


import UIKit //include import Foundation
//import Foundation >> That why we don't need to import Foundation
// >> UIKit and Foundation >> are the frameworks from apple. Cocao Pod and Third party library are also frameworks that we can use.

class Setting {
    let name: String
    let icon: UIImage
    var isOn: Bool
    
    init(name: String, icon: UIImage, isOn: Bool) {
        self.name = name
        self.icon = icon
        self.isOn = isOn
    }
}
