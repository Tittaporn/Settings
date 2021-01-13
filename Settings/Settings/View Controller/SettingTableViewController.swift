//
//  SettingTableViewController.swift
//  Settings
//
//  Created by Lee McCormick on 1/13/21.
//  Copyright © 2021 Karl Pfister. All rights reserved.
//

import UIKit


class SettingTableViewController: UITableViewController {
   
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingController.shared.settings.count //total array
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //using guard to cast the cell to as SettingTableViewCell , if we can not find settingCell, we just need to return UITableViewCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
        
        let setting = SettingController.shared.settings[indexPath.row] //each row == indexPath.row
        
        //setting delegate and then conform SettingCellDelegate on extension
        cell.delegate = self
        
        cell.updateView(setting: setting)
        
        return cell
    }
}

// MARK: - Extensions

// we need to conform the protocol >> Meaning to use function on protocol
extension SettingTableViewController: SettingCellDelegate {
    
    
    
    func settingSwitchToggled(cell: SettingTableViewCell) {
        
        print("Employee hears boss say setting swifch was toggled.")
        
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        
        let setting = SettingController.shared.settings[indexPath.row]
        
        SettingController.shared.toggleIsOn(setting: setting)
        
        cell.updateView(setting: setting)
    }
    
    
}


/*
 
 //MARK: - Communication Patterns Swift Delegates and Protocols
 
 As the Name suggest communication, passing information from one screen to other or sharing data from one screen to other through a specific set of rules and regulation is known as Communication Pattern. It is one of the most used and important Design Pattern in iOS programming. Communication patterns are of two types Delegates and Protocols and Notification and Observers. In this tutorial we will be focussing on Swift Delegates and Protocols.
 
 - Protocols == Boss
 As Apple says A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol. You can read more about Protocols here.
 
 - Delegates == Employee
 As said earlier, delegates means someone on your behalf i.e. giving responsibility to other. Imagine ViewController1 calls a ViewController2 to do certain task, Once the task is completed ViewController1 should know that ViewController2 has completed it task so that it can take necessary action.
 https://thenucleargeeks.com/2019/09/25/swift-delegates-and-protocols/
 https://www.iosapptemplates.com/blog/swift-programming/swift-delegates-communication-patterns
 
 //_________________________________________________________________________________
 
 
 //MARK: - TableView on ViewController
 How to use tableView on ViewController by MaxPoff
 - Create storyboard view (UIViewController, then drag Table View onto controller)
 - Subclass your view
 - Drag outlet for table view
 - Set delegate and datasource in viewDidLoad
 - Create extension on viewController class and conform to UITableViewDelegate and UITabeViewDataSource
 - Add required functionality (protocol stubs for numberOfRows and CellForRowAt)
 
 //_________________________________________________________________________________
 
 //MARK: - Singleton
 /// `Singleton`:  The singleton restricts the instantiation of a class to a single instance. This is done in order to provide coordinated access to a certain resource -- in this case, our `WHATEVER` array, throughout an entire software system. The singleton ensures that it’s only instantiated once, and can provide easy access to the single instance
 
 */
