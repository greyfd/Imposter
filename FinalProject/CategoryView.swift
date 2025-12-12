//
//  CategoryView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/10/25.
//

import SwiftUI

struct CategoryView: View {
    
    @State var cats = ["Sports", "Geography", "Video Games", "Places", "School", "Holidays", "Celebrities", "Nature"]
    
    @State var nextView = false
    
    @State var selectedCat: String?
    
    @State var currentCats: [String] = []
    
    @State var count: Int
    
    @State var players: [Player]
    
    
    var body: some View {
        
        NavigationStack{
        
        VStack{
            
            Text("Categories")
                .foregroundStyle(.white)
                .font(.title)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: 150, height: 45)
                        .foregroundStyle(.gray)
                    
                )
            
            let columns = [GridItem(.flexible()), GridItem(.flexible())]
            
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(currentCats, id: \.self) { cat in
                    Button {
                        selectedCat = cat
//                        print(selectedCat ?? "not working")
//                        print(count)
//                        for player in players {
//                           print(player.name)
//                         }
                        //Game(numberOfPlayers: , category: <#T##Game.category#>)
                        
                        nextView = true
                    } label: {
                        Text("\(cat)")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 6)
                                
                            )
                    }
                }
            }
            

            
            
            Button {
                
                generateNew()
                
            } label: {
                Text("Generate New")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(.cyan)
                    )
            }
            
            
//            Button {
//                
//                nextView = true
//                
//                //save cat
//                
//            } label: {
//                Text("Submit")
//                    .foregroundStyle(.white)
//                    .font(.largeTitle)
//                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 6)
//                            .foregroundStyle(.blue)
//                    )
//            }
            
            
            NavigationLink("", destination: GameView(players: players, count: count, cat: selectedCat ?? "not working"), isActive: $nextView)
            
            
        }
        }   //vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .opacity(0.8)
        .onAppear{
            generateNew()
        }
        
    }
    
    
    func generateNew() {
            currentCats = Array(cats.shuffled().prefix(4))
            selectedCat = nil
        }
    
}

#Preview {
    //CategoryView()
}
