//
//  ContentView.swift
//  TestMDM
//
//  Created by Tomas McGuinness on 07/04/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            SettingList()
                .navigationBarTitle("MDM Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
