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
    
    
    @State var nextView = false
    
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
                
                NavigationLink("", destination: PlayerCountView(), isActive: $nextView)
                    .navigationBarBackButtonHidden(true)
                
                
            }   //vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .opacity(0.8)
        }
    }     //view
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
