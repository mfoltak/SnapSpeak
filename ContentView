import SwiftUI
import Subsonic
    
    struct ContentView: View {
        let names = ["Coupe", "Stylo", "Ordinateur", "Souliers", "Bureau"]
        let columns = [GridItem(.adaptive(minimum:250))]
        var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(names, id: \.self) { name in
                            Button{
                                play(sound: "\(name).m4a")
                                print("\(name)")
                            }label: {
                                Image(name)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(25)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .navigationTitle("SnapSpeak")
            }
            .navigationViewStyle(.stack)  
        }   
    }
