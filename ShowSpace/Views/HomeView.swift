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
    let dateFormatter = DateFormatter()
    @State var selectedGenre: String = "Overall" // Default genre
    
    
    var body: some View {
        NavigationView{
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
                        .padding(.top, 150)
                    }
                    Text("Top rated shows by category")
                        .foregroundColor(DesignConstants.textColor)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, DesignConstants.showPadding)
                        .padding(.top, DesignConstants.showPadding)
                    Picker("Select Genre", selection: $selectedGenre) {
                        ForEach(genreOptions, id: \.self) { genre in
                            Text(genre).tag(genre)
                                .foregroundColor(.blue)
                        }
                    }
                    .pickerStyle(.menu)
                    .background(Color("show-yellow"))
                    .padding(.leading, DesignConstants.showPadding)
                    .cornerRadius(3.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    List(filteredShows) { show in
                        VStack(alignment: .leading) {
                            NavigationLink {
                                ShowView(show: show)
                            } label: {
                                HStack {
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
                    .task {
                        await showViewModel.getShows()
                    }
                }
            }
        }
    }
    var genreOptions: [String] {
        // Dynamically get unique genres from shows
        return ["Overall"] + Array(Set(showViewModel.shows.flatMap { $0.genres }))
    }
    
    var filteredShows: [Show] {
        var showsForSelectedGenre: [Show]

        if selectedGenre == "Overall" {
            showsForSelectedGenre = showViewModel.shows
        } else {
            showsForSelectedGenre = showViewModel.shows.filter { $0.genres.contains(selectedGenre) }
        }

        // Convert the subsequence to an array and return only the top 3 highest-rated shows for the selected genre
        return Array(showsForSelectedGenre
            .sorted(by: { $0.rating.average ?? 0 > $1.rating.average ?? 0 })
            .prefix(5)
        )
    }
}
