//
//  ShowView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/30/23.
//

import SwiftUI

struct ShowView: View {
    
    @AppStorage("isAddedToAllStars") private var isAddedToAllStars = false
    
    var show: Show
    
    var body: some View {
        ZStack(alignment: .topLeading){
            DesignConstants.bgColor
                .ignoresSafeArea()
            VStack{
                HStack {
                    VStack{
                        Text("\(show.name)")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(DesignConstants.textColor)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
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
                        .frame(maxWidth: .infinity, alignment: .leading)
                        HStack{
                            PrimaryButton()
                            AllStarButton()
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 10))
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
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
                Divider()
                HStack{
                    VStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("show-yellow"))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                        Text("\(show.rating.average ?? 0.0)" + "/10")
                            .foregroundColor(DesignConstants.textColor)
                            .frame(alignment: .leading)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                    VStack{
                        Image(systemName: "star")
                            .foregroundColor(Color("cool purple"))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                        Text("Rate this?")
                    }
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                Divider()
                Text("Summary")
                    .font(.title2)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    .foregroundColor(DesignConstants.textColor)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                Text("\(show.summary.replacingOccurrences(of: "<p>|</p>|<b>|</b>|<br />|<i>|</i>", with: "", options: .regularExpression))")
                    .font(.caption)
                    .foregroundColor(DesignConstants.textColor)
                    .lineLimit(nil)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.all, DesignConstants.showPadding)
            .frame(maxWidth: .infinity, alignment: .top)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("\(show.name)")
                        .foregroundColor(DesignConstants.textColor)
                }
            }
        }
    }
}
