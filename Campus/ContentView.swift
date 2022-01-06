//
//  ContentView.swift
//  Campus
//
//  Created by Andreas Ink on 1/3/22.
//

import SwiftUI
import os
struct ContentView: View {
    var body: some View {
        HomeView()
            .onAppear() {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
