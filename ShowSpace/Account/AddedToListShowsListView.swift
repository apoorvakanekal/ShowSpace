//
//  AddedToListShowsListView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/26/23.
//

import Foundation
import SwiftUI

struct AddedToListShowsListView: View {
    
    @ObservedObject var showViewModel = ShowViewModel()
    @State var searchText = ""

    let dateFormatter = DateFormatter()
    
    
    
    var body: some View {
        if addedToListResults.isEmpty{
            Text("No Shows have been added to your list yet! Find shows you want to watch in the home tab!")
                .padding(DesignConstants.showPadding)
        }
        NavigationView{
            List(addedToListResults) { show in
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(show.premiered.formatted(.dateTime.year()))")
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("show-yellow"))
                            }
                            .padding(.leading, 10)
                        }
                    }
                }
                .padding(.vertical, 5)
                .listRowBackground(
                    Rectangle()
                        .fill(Color(DesignConstants.bgColor).opacity(1))
                         .cornerRadius(5)
                         .padding(5)
                )
            }
            .listStyle(PlainListStyle())
            .task{
                await showViewModel.getShows()

            }
        }
    }
    
    var addedToListResults: [Show] {
//        print("entered search")
        let jsonDecoder = JSONDecoder()
        if let data = UserDefaults.standard.object(forKey: "showState") as? Data,
           let showStates = try? jsonDecoder.decode([ShowState].self, from: data) {
//            print(showStates)
            let listShows = showStates.filter{$0.isAddedToList}
            var filterIDs = [Int]()
            for show in listShows {
//                print("\(show.id)")
                filterIDs.append(show.id)
            }
            print(filterIDs)
            let filteredShows = showViewModel.shows.filter{filterIDs.contains($0.id)}
            print(filteredShows)
            return filteredShows
        }
        else{
            let emptyList = [Show]()
            return emptyList
            }
        }
    }

