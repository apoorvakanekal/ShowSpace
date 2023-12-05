//
//  AllStarsShowsListView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/22/23.
//

import SwiftUI

struct AllStarsShowsListView: View {
    
    @ObservedObject var showViewModel = ShowViewModel()
    @State var searchText = ""

    let dateFormatter = DateFormatter()
    
    
    
    var body: some View {
        if addedToAllStarsResults.isEmpty{
            Text("No Shows have been added to All Stars yet! Find shows you love in the search tab!")
                .padding(.vertical, DesignConstants.showPadding)
        }
        NavigationView{
            List(addedToAllStarsResults) { show in
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
                            .padding(.bottom, 15)
                            VStack{
                                Text("\(show.name)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(show.premiered.formatted(.dateTime.year()))")
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("cool purple"))
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
                         .padding(.bottom, 10)
                )
            }
            .listStyle(PlainListStyle())
            .task{
                await showViewModel.getShows()

            }
        }
    }
    
    var addedToAllStarsResults: [Show] {
        print("fetching list results")
        let jsonDecoder = JSONDecoder()
        if let data = UserDefaults.standard.object(forKey: "showState") as? Data,
           let showStates = try? jsonDecoder.decode([ShowState].self, from: data) {
//            print(showStates)
            let listShows = showStates.filter{$0.isAddedToAllStars}
            var filterIDs = [Int]()
            for show in listShows {
//                print("\(show.id)")
                filterIDs.append(show.id)
            }
//            print(filterIDs)
            let filteredShows = showViewModel.shows.filter{filterIDs.contains($0.id)}
            print("filteredShows: \(filteredShows)" )
            return filteredShows
        }
        else{
            return []
            }
        }
    }

