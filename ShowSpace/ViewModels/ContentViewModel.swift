//
//  ContentViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/25/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    func getShows() {

        let headers = [
            "X-RapidAPI-Key": "0b5dd1e7d3msh225211f73c8dbf6p159964jsncde6666e61d3",
            "X-RapidAPI-Host": "tvjan-tvmaze-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://tvjan-tvmaze-v1.p.rapidapi.com/shows/%7Bid%7D")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
    }
}
