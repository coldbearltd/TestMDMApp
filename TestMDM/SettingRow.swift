//
//  SettingView.swift
//  TestMDM
//
//  Created by Tomas McGuinness on 07/04/2021.
//

import SwiftUI

struct SettingRow: View {
    var setting: Setting
    
    var body: some View {
        HStack {
        VStack(alignment: .leading) {
            Text(setting.key)
            
            HStack {
                Text(setting.type)
                Text(" - ")
                Text(setting.value)
                Spacer()
            }
        }
            Spacer()
        }
    }
}

struct SettingRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingRow(setting: Setting(id: 1, key: "Key1", value: "The Value", type: "String"))
    }
}
