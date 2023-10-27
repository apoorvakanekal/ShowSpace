//
//  ContentViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/25/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
//    @Published var shows = [Show]()
    
    init(){
        getShows()
    }
    
    func getShows() {

        let headers = [
            "X-RapidAPI-Key": "0b5dd1e7d3msh225211f73c8dbf6p159964jsncde6666e61d3",
            "X-RapidAPI-Host": "tvjan-tvmaze-v1.p.rapidapi.com"
        ]
        
        Task{
            
            var request = URLRequest(url: URL(string: "https://tvjan-tvmaze-v1.p.rapidapi.com/shows/2")!)
                  request.httpMethod = "POST"
                  request.allHTTPHeaderFields = headers
                  let jsonDecoder = JSONDecoder()
            
            do{
                let (data, _) = try await URLSession.shared.data(for: request)
                       let shows = try jsonDecoder.decode(Show.self, from: data)
                       print("shows \(shows)")
            }
            catch(let error){
                print("API error \(error)")
            }
        }
//        let request = NSMutableURLRequest(url: NSURL(string: "https://tvjan-tvmaze-v1.p.rapidapi.com/shows/%7Bid%7D")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
        

//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            guard let data = data else{
//                print("error, missing data")
//                return
//            }
//            let shows = try JSONDecoder().decode(Show.self, from: data)
//            if (error != nil) {
//                print(error as Any)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//            }
//        })
//
//        dataTask.resume()
    }
}
