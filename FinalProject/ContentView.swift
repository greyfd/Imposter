//
//  ContentView.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    
    @Binding var themeColor: Color
    
    
    @State var nextView = false
    @State var setView = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Button {
                    
                    nextView = true
                    
                   
                    
                    
                } label: {
                    VStack{
                        Text("Start Game")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 200, height: 50)
                                    .foregroundStyle(.blue)
                            )
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding(.top, 100)
                        
                    }
                    .padding()
                    
                }
                
                
                Button {
                    
                    setView = true
                    
                   
                    
                    
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundStyle(.blue)
                                .frame(width: 200, height: 50)
                        )
                }

                
                NavigationLink("", destination: PlayerCountView(), isActive: $nextView)
                    .navigationBarBackButtonHidden(true)
                
                NavigationLink("", destination: SettingView(themeColor: $themeColor), isActive: $setView)
                
                
            }   //vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(themeColor)
            .opacity(0.8)
        }
    }     //view
}

#Preview {
    ContentView(themeColor: .constant(.black))
//        .modelContainer(for: Item.self, inMemory: true)
}
