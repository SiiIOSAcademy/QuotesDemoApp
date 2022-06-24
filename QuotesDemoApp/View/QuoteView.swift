//
//  QuoteView.swift
//  QuotesWidgetDemoApp
//
//  Created by max kryuchkov on 20.06.2022.
//

import SwiftUI

struct QuoteView: View {
    
    @State var quote: Quote
    private let presenter = Presenter()
    
    var body: some View {
        VStack(spacing: 20.0) {
            Spacer()
            Text(quote.text)
                .font(.largeTitle)
                .padding(.init(top: 0.0, leading: 20.0, bottom: 20.0, trailing: 20.0))
                .minimumScaleFactor(0.01)
            Text(quote.author ?? "Unknown")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, UIDevice.current.userInterfaceIdiom == .pad ? 60.0 : 30.0)
            Spacer()
            Button(action: {
                presenter.shareQuote(quote)
            }) {
                Image(systemName: "square.and.arrow.up")
            }.padding(.bottom, 20.0)
        }
    }
}
