//
//  File.swift
//  My App
//
//  Created by Andreas Ink on 1/5/22.
//

import Foundation
import SwiftUI

struct BottomView: View {
    @State var btns = [BtnData(symbol: "🏡", title: "Home"), BtnData(symbol: "🏡", title: "Home2"), BtnData(symbol: "🏡", title: "Home3"), BtnData(symbol: "🏡", title: "Home4"), BtnData(symbol: "🏡", title: "Home5"), BtnData(symbol: "🏡", title: "Home6")]
    @Binding var text: String
    @Binding var saver: Bool
    @Binding var loader: Bool
    @Binding var placer: Bool
    
    @State var names = UserDefaults().stringArray(forKey: "names") ?? []
    var body: some View {
        VStack {
             
          TextField("YeS", text: $text)
                HStack {
                    Spacer()
                    Button(action: { self.saver.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.saver = false
                        }
                    }) {
                        Text("Save")
                    }
                    Spacer()
                    Button(action: { self.loader.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.loader = false
                        }
                    }) {
                        Text("Load")
                    }
                    Spacer()
                    Button(action: { self.placer.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.placer = false

                            names.append(text)
                            UserDefaults().set(names, forKey: "names")
                            text = ""
                        }
                    }) {
                        Text("Place")
                    }
                   
                }
        LazyVGrid(columns: [GridItem(.flexible(minimum: 20, maximum: 200)), GridItem(.flexible(minimum: 20, maximum: 200)), GridItem(.flexible(minimum: 20, maximum: 200))]) {
            ForEach(btns, id: \.self) { btn in
                MainBtn(btn: btn)
            }
        }
        }
    }
}
