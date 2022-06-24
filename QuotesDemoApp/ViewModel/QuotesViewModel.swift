//
//  QuotesViewModel.swift
//  QuotesWidgetDemoApp
//
//  Created by Sebastian Hat on 20/06/2022.
//

import Foundation

@MainActor
class QuotesViewModel: ObservableObject {
    
    // MARK: - State
    
    enum State {
        case na
        case loading
        case success(data: Quotes)
        case failed(error: Error)
    }
    
    // MARK: - Private properties

    @Published private(set) var state: State = .na
    static var quotes = Quotes()
    static let quoteExample = Quote(text: "Nothing happens unless first we dream.", author: "Carl Sandburg")
    private let networkService: NetworkManager
    
    // MARK: - Init
    
    init(networkService: NetworkManager = NetworkManager()) {
        self.networkService = networkService
    }
    
    // MARK: - Public methods
    
    func getQuotes() async {
        self.state = .loading
        do {
            let quotes = try await networkService.fetchQuotes()
            self.state = .success(data: quotes)
        } catch {
            self.state = .failed(error: error)
        }
    }
    
    func getQuotesForAWidget(randomQuotesCount: Int = 20, completion: (Quotes) -> Void) async {
        do {
            let quotes = try await networkService.fetchQuotes()
            let randomQuotes = (0 ..< randomQuotesCount).compactMap { _ in quotes.randomElement() }
            completion(randomQuotes)
        } catch {
            print("Error fetching quotes for widget \(error.localizedDescription)")
        }
    }
}
