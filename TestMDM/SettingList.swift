//
//  SettingList.swift
//  TestMDM
//
//  Created by Tomas McGuinness on 07/04/2021.
//

import SwiftUI

struct SettingList: View {
    
    @ObservedObject var model = ManagedSettings()
    
    init() {
        let skyBlue = Color(red: 67/255, green: 56/255, blue: 202/255)

        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: skyBlue]
    }

    var body: some View {
        if(model.settings.count == 0) {
            VStack {
                Text("There are no managed app settings")
            }
        } else {
            List(model.settings) {
                setting in SettingRow(setting: setting)
            }
        }
    }
}

struct SettingList_Previews: PreviewProvider {
    static var previews: some View {
        SettingList()
    }
}
