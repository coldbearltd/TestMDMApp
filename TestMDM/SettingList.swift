//
//  SettingList.swift
//  TestMDM
//
//  Created by Tomas McGuinness on 07/04/2021.
//

import SwiftUI

struct SettingList: View {
    var body: some View {
        if(settings.count == 0) {
            VStack {
                Text("There are no settings");
            }
        } else {
            List(settings) {
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
