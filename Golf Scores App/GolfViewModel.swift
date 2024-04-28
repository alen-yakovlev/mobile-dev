//
//  GolfViewModel.swift
//  Golf Scores App
//
//  Created by Alen Yakovlev on 4/10/24.
//

import Foundation

class GolfViewModel: ObservableObject {
    
    @Published private(set) var rankData = [Ranking]()
    
    private let url = "https://live-golf-data.p.rapidapi.com/stats?year=2024&statId=02671"
    
    func fetchData(completion: @escaping (Bool) -> Void) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("0ca31d1d6cmsh2309104bbd2cb5bp1e7dd3jsn5324f83a736a", forHTTPHeaderField: "X-RapidAPI-Key")
            request.setValue("live-golf-data.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error)
                    completion(false)
                    return
                } else {
                    if let data = data {
                        do {
                            let final = try JSONDecoder().decode(GolfModel.self, from: data)
                            self.rankData = final.rankings
                            completion(true)
                        } catch {
                            print(error)
                            completion(false)
                        }
                    }
                }
            }.resume()
        }
    }
}

