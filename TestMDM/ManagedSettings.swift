//
//  ManagedSettings.swift
//  TestMDM
//
//  Created by Tomas McGuinness on 07/04/2021.
//

import Foundation

class ManagedSettings : ObservableObject  {

    @Published var settings: [Setting] = [Setting]()
    
    let NC = NotificationCenter.default
    
    init() {
        self.NC.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: nil, using: self.mdmSettingsChanged)
        
        if let managedConf = UserDefaults.standard.object(forKey: "com.apple.configuration.managed") as? [String:Any] {
            print("serverConfig count:\(String(describing: managedConf.count))")
        
            var tempSettings = [Setting]()
            var index:Int = 0
            
            // Loop through the dictionary.
            //
            for(key, _) in managedConf {
                
                // Value can be multiple different types.
                //
                //var stringValue:String? = value as! String?
                
                tempSettings.append(Setting(id: index, key: key, value: "Nothing yet!"))
                
                index = index+1
            }
            
            self.settings = tempSettings
        }
    }

    func mdmSettingsChanged(_ notification: Notification) {
        
        if let managedConf = UserDefaults.standard.object(forKey: "com.apple.configuration.managed") as? [String:Any] {
            print("serverConfig count:\(String(describing: managedConf.count))")
        
            var tempSettings = [Setting]()
            var index:Int = 0
            
            // Loop through the dictionary.
            //
            for(key, _) in managedConf {
                
                // Value can be multiple different types.
                //
                //var stringValue:String? = value as! String?
                
                tempSettings.append(Setting(id: index, key: key, value: "Nothing yet!"))
                
                index = index+1
            }
            
            self.settings = tempSettings
        }
    }
}
