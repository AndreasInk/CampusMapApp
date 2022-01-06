//
//  File.swift
//  My App
//
//  Created by Andreas Ink on 1/5/22.
//

import SwiftUI

struct MainBtn: View {
    @State var btn: BtnData
    var body: some View {
        VStack {
           
                Button {
                    
                } label: {
                    VStack {
                        Text(btn.symbol)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color(.systemBlue)))
                            
                        Text(btn.title)
                         
                    }   .font(.system(.largeTitle, design: .rounded))
                }

            
        }
    }
}

