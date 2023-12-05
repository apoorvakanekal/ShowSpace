//
//  HomeView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/30/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var showViewModel = ShowViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                DesignConstants.bgColor
                    .ignoresSafeArea()
                ZStack(alignment: .topLeading){
                    VStack{
                        VStack (spacing: 40){
                            ZStack{
                                Ellipse()
                                    .frame(width: 510, height: 600)
                                    .padding(.leading, -200)
                                    .foregroundColor(Color("bright purple"))
                                    .padding(.top, -500)
                                
                                Ellipse()
                                    .frame(width: 458, height: 450)
                                    .padding(.trailing, -350)
                                    .foregroundColor(Color("show-yellow"))
                                    .padding(.top, -500)
                                
                                Text("Find a new \nshow to watch")
                                    .foregroundColor(DesignConstants.textColor)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 20)
                                    .padding(.top, -100)
                            }
                            .padding(.top, -200)
                        }
                    }
                }
            }
        }
    }
}
