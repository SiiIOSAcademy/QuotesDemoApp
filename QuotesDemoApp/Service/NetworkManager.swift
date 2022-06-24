//
//  NetworkManager.swift
//  QuotesWidgetDemoApp
//
//  Created by Sebastian Hat on 20/06/2022.
//

import Foundation

enum NetworkManagerError: Error {
    case badResponse(URLResponse)
    case badLocalUrl
}

struct NetworkManager {
    
    private let apiURLString = "https://type.fit/api/quotes/"
    
    func fetchQuotes() async throws -> [Quote] {
        guard let url = URL(string: apiURLString) else {
            // If API URL is wrong there is no point to load the app at this point.
            fatalError("API url is wrong")
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw NetworkManagerError.badResponse(response)
        }
        let decodedData = try JSONDecoder().decode(Quotes.self, from: data)
        return decodedData
    }
}
