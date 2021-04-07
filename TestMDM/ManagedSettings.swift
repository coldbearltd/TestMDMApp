//
//  ManagedSettings.swift
//  TestMDM
//
//  Created by Tomas McGuinness on 07/04/2021.
//

import Foundation

let settings: [Setting] = loadManagedSettings()

private func loadManagedSettings() -> [Setting] {
    let serverConfig = UserDefaults.standard.dictionary(forKey: "com.apple.configuration.managed")
    print("serverConfig count:\(String(describing: serverConfig?.count))")
    
    // Loop through the dictionary.
    //
    
    return []
}
