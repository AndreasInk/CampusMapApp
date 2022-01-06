import SwiftUI
import MapKit


struct HomeView: View {
    @State private var saver = false
    @State private var loader = false
    @State private var placer = false
    @State private var isPresented = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State var names = UserDefaults().stringArray(forKey: "names") ?? []
    @State var text = "HEY"
    
    @State private var isVisible = true
    @State private var isExpanded = false
    @State private var useTallerMinHeight = false
    @State private var useShorterMaxHeight = false
   // @State private var sheetStyle = BottomSheetStyle.standard
    
    var body: some View {
        ZStack {
            VStack {
                RealityKitView2(anchorNames: $names, text: $text, saved: $saver, loaded: $loader, placer: $placer)
                    .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isPresented = true
                        }
                    }
                    .frame(height: 500)
                //TextField("YeS", text: $text)
//                HStack {
//                    Spacer()
//                    Button(action: { self.saver.toggle()
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            self.saver = false
//                        }
//                    }) {
//                        Text("Save")
//                    }
//                    Spacer()
//                    Button(action: { self.loader.toggle()
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            self.loader = false
//                        }
//                    }) {
//                        Text("Load")
//                    }
//                    Spacer()
//                    Button(action: { self.placer.toggle()
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                            self.placer = false
//
//                            names.append(text)
//                            UserDefaults().set(names, forKey: "names")
//                            text = ""
//                        }
//                    }) {
//                        Text("Place")
//                    }
//                    Button(action: { self.isPresented.toggle() }) {
//                        Text("Toggle")
//                    }
//                }
            }
            
        
            //.bottomSheet(isPresented: $isPresented, contentView: sheet)
            BottomSheetView(isOpen: $isPresented, maxHeight: 900) {
                ZStack {
                    Color.white
                        .ignoresSafeArea()
                    BottomView(text: $text, saver: $saver, loader: $loader, placer: $placer)
                }
            }
        }
        
       
    }
    
}





