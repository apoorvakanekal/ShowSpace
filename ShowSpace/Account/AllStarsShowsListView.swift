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
                                    .foregroundColor(Color("cool purple"))
                                
                            }
                        }
                    }
                }
            }
            .task{
                await showViewModel.getShows()

            }
        }
    }
    
    var addedToListResults: [Show] {
//        print("entered search")
        let jsonDecoder = JSONDecoder()
        if let data = UserDefaults.standard.object(forKey: "showState") as? Data,
           var showStates = try? jsonDecoder.decode([ShowState].self, from: data) {
//            print(showStates)
            var listShows = showStates.filter{$0.isAddedToList}
            var filterIDs = [Int]()
            for show in listShows {
//                print("\(show.id)")
                filterIDs.append(show.id)
            }
            print(filterIDs)
            var filteredShows = showViewModel.shows.filter{filterIDs.contains($0.id)}
            print(filteredShows)
            return filteredShows
        }
        else{
            var emptyList = [Show]()
            return emptyList
            }
        }
    }

