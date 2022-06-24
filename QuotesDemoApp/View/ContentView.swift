//
//  ContentView.swift
//  QuotesWidgetDemoApp
//
//  Created by Sebastian Hat on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var quotesViewModel = QuotesViewModel()
    
    var body: some View {
        VStack {
            switch quotesViewModel.state {
            case .success(let quotes):
                NavigationView {
                    GeometryReader { proxy in
                        UIScrollViewWrapper {
                            VStack(spacing: 0) {
                                ForEach(quotes, id: \.self) { quote in
                                    QuoteView(quote: quote).frame(height: proxy.size.height)
                                }
                            }.frame(width: proxy.size.width)
                        }
                    }
                    .navigationTitle("Quotes")
                    .navigationBarTitleDisplayMode(.inline)
                }.navigationViewStyle(StackNavigationViewStyle())
            case .loading:
                Text("Loading quotes...")
                Image(systemName: "quote.bubble")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .padding(.vertical, 20.0)
                ProgressView()
                    .scaleEffect(2.0)
            case .failed(error: let error):
                Text(error.localizedDescription)
            default:
                Text("Nothing here")
            }
        }.task {
            await quotesViewModel.getQuotes()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
