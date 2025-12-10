//
//  CategoryView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/10/25.
//

import SwiftUI

struct CategoryView: View {
    
    @State var cats = ["Sports, Geography, Video Games, Places, School, Holidays, Celebrities, Nature"]
    
    @State var nextView = false
    
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
            
            
            HStack{
                Button{
                    
                } label: {
                    Text("Sports")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                            //.frame(width: 55, height: 30)
                                .foregroundStyle(.gray)
                            
                        )
                }
                
                
                Button {
                    
                } label: {
                    Text("Geography")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                            //.frame(width: 150, height: 45)
                                .foregroundStyle(.gray)
                            
                        )
                }
                
                
                
            }
            HStack{
                Button {
                    
                } label: {
                    Text("Video Games")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                            //.frame(width: 150, height: 45)
                                .foregroundStyle(.gray)
                            
                        )
                }
                
                Button{
                    
                } label: {
                    Text("Places")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                            //.frame(width: 150, height: 45)
                                .foregroundStyle(.gray)
                            
                        )
                }
                
                
                
                // .padding()
            }
            
            
            
            Button {
                
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
            
            
            Button {
                
                nextView = true
                
                //save cat
                
            } label: {
                Text("Submit")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(.blue)
                    )
            }
            
            
            //NavigationLink("", destination: <#T##View#>, isActive: <#T##Binding<Bool>#>)
            
            
        }
        }   //vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .opacity(0.8)
        
    }
}

#Preview {
    CategoryView()
}
