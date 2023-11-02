//
//  ShowView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/30/23.
//

import SwiftUI

struct ShowView: View {
    
    var show: Show
    
    var body: some View {
        ZStack{
            DesignConstants.bgColor
                .ignoresSafeArea()
            VStack{
                HStack {
                    VStack{
                        Text("\(show.name)")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .foregroundColor(DesignConstants.textColor)
                            .frame(alignment:.leading)
                        HStack{
                            ForEach(show.genres, id: \.self){ genre in
                                Genre{
                                    Text(genre)
                                        .foregroundColor(Color("show-yellow"))
                                        .font(.caption)
                                        .padding(5)
                                }
                            }
                        }
                        Text("\(show.rating.average ?? 0.0)" + "/10")
                            .foregroundColor(DesignConstants.textColor)
                            .font(.title2)
                        HStack{
                            PrimaryButton()
                            AllStarButton()
                        }
                    }
                    Spacer()
                    AsyncImage(url: URL(string: "\(show.image.medium)")){ phase in switch phase{
                    case .empty:
                        Image(systemName: "photo")
                            .frame(height: 200)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 200)
                    case .failure:
                        Image(systemName: "photo")
                            .frame(height: 200)
                    @unknown default:
                        EmptyView()
                            .frame(height: 200)
                    }
                    }
                    .frame(height: 200)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("\(show.name)")
                            .foregroundColor(DesignConstants.textColor)
                    }
                }
                Text("\(show.summary)")
                    .font(.caption)
                    .foregroundColor(DesignConstants.textColor)
            }
            .padding(.all, DesignConstants.showPadding)
        }
    }
}
