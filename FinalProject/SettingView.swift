//
//  SettingView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/11/25.
//

import SwiftUI

struct SettingView: View {
    
    @State var themeColor = "dark"
    
    @State var lightDark = false
    
    @State var numRounds = 3
    
    @State var selected = 0
    
    var body: some View {
        
        VStack{
            
            
            Text("Settings")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                )
                .padding()
            
            
            HStack{
                Text("Dark")
                Toggle("", isOn: $lightDark)
                    .labelsHidden()
                Text("Light")
            }
            
            HStack{
                Text("Number of Rounds:")
                Stepper("\(numRounds)") {
                    numRounds += 1
                } onDecrement: {
                    if numRounds > 3 {numRounds -= 1}
                }


            }
            .padding()
            
            
            HStack{
                
                Text("Difficulty -")
                
                Picker("Difficulty", selection: $selected) {
                    Text("Easy").tag(0)
                        Text("Medium").tag(1)
                        Text("Hard").tag(2)
                }
                .pickerStyle(.segmented)
                
            }
            .padding()
            
            
        }     //vstack
    }
}

#Preview {
    SettingView()
}
