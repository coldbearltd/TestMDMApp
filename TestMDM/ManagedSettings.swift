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
        // Subscribe to any changes in the UserDefaults
        //
        self.NC.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: nil, using: self.mdmSettingsChanged)
        
        // Read the existing settings.
        //
        readManagedSettings()
    }

    func mdmSettingsChanged(_ notification: Notification) {
        
        print(notification.name)
        
        readManagedSettings()
    }
    
    private func readManagedSettings() {
        if let managedConf = UserDefaults.standard.object(forKey: "com.apple.configuration.managed") as? [String:Any] {
            print("serverConfig count:\(String(describing: managedConf.count))")
        
            var tempSettings = [Setting]()
            var index:Int = 0
            
            // Loop through the dictionary.
            //
            for(key, value) in managedConf {
                
                // Value can be multiple different types.
                //
                //var stringValue:String? = value as! String?
                let t = type(of: value)
                
                print("'\(value)' of type '\(t)'")
                
                switch value {
                    case is Date:
                        let dateValue =  value as! Date
                        tempSettings.append(Setting(id: index, key: key, value: "\(dateValue)", type: "Date"))
                    break;
                    case is Bool:
                        let boolValue =  value as! Bool
                        tempSettings.append(Setting(id: index, key: key, value: "\(boolValue)", type: "Boolean"))
                        break;
                    case is Int:
                        let intValue =  value as! Int
                        tempSettings.append(Setting(id: index, key: key, value: "\(intValue)", type: "Integer"))
                        break;
                    case is String:
                        let stringValue = value as! String
                        tempSettings.append(Setting(id: index, key: key, value: stringValue , type: "String"))
                        break;
                    default:
                        print("Who knows!")
                }
                
                
                
                index = index+1
            }
            
            self.settings = tempSettings
        }
    }
}
