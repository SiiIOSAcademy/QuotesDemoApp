//
//  Presenter.swift
//  QuotesWidgetDemoApp
//
//  Created by max kryuchkov on 20.06.2022.
//

import UIKit

struct Presenter {
    
    func shareQuote(_ quote: Quote) {
        showActionSheet(text: "\(quote.text) © \(quote.author ?? "Unknown")")
    }
    
    private func showActionSheet(text: String) {
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        MainRouter.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}
