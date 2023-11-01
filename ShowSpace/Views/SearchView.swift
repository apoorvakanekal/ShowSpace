//
//  SearchView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/30/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var showViewModel = ShowViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                DesignConstants.bgColor
                    .ignoresSafeArea()
                List(searchResults) { show in
                    VStack(alignment: .leading) {
                        NavigationLink {
                            ShowView(show: show)
                        } label: {
                            HStack{
                                AsyncImage(url: URL(string: "\(show.image.medium)")){ phase in switch phase{
                                case .empty:
                                    Image(systemName: "photo")
                                        .frame(height: 80)
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxHeight: 80)
                                case .failure:
                                    Image(systemName: "photo")
                                        .frame(height: 80)
                                @unknown default:
                                    EmptyView()
                                        .frame(height: 80)
                                }
                                }
                                .frame(height: 80)
                                VStack{
                                    Text("\(show.name)")
                                    Text("\(show.premiered)")
                                }
                            }
                        }
                    }
                }
            }
            .task{
                await showViewModel.getShows()
            }
            .searchable(text:$searchText)
        }
    }
    
    var searchResults: [Show] {
        if searchText.isEmpty {
            return showViewModel.shows
        }
        else{
            return showViewModel.shows.filter{
                $0.name.contains(searchText)
            }
        }
    }
}
