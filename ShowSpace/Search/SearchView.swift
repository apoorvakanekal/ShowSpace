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

    let dateFormatter = DateFormatter()
    
    
    var body: some View {
        
        NavigationView{
            List(searchResults) { show in
                VStack(alignment: .leading) {
                    NavigationLink{
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(show.premiered.formatted(.dateTime.year()))")
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("show-yellow"))
                                
                            }
                        }
                    }
                }
            }
            .task{
                await showViewModel.getShows()

            }
            .searchable(text:$searchText)
            .navigationTitle("Looking for a show?")
            .overlay(
                noResultsView()
                    .opacity(searchResults.isEmpty ? 1 : 0)
            )

        }
    }
    
    @ViewBuilder
    private func noResultsView() -> some View {
        if searchResults.isEmpty && !searchText.isEmpty {
            Text("No results found.")
                .foregroundColor(.secondary)
                .padding(DesignConstants.showPadding)
        } else {
            EmptyView()
        }
    }
    
    var searchResults: [Show] {
        print("entered search")
        if searchText.isEmpty {
            return []
        }
        else{
            return showViewModel.shows.filter{
                $0.name.contains(searchText)
            }
        }
    }
}
