//
//  UIScrollViewViewController.swift
//  QuotesWidgetDemoApp
//
//  Created by max kryuchkov on 20.06.2022.
//

import UIKit
import SwiftUI

final class UIScrollViewViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.scrollView)
        self.pinEdges(of: self.scrollView, to: self.view)

        self.hostingController.willMove(toParent: self)
        self.scrollView.addSubview(self.hostingController.view)
        self.pinEdges(of: self.hostingController.view, to: self.scrollView)
        self.hostingController.didMove(toParent: self)

    }
    
    // MARK: - Private methods
    
    private func pinEdges(of viewA: UIView, to viewB: UIView) {
        viewA.translatesAutoresizingMaskIntoConstraints = false
        viewB.addConstraints([viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
                              viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
                              viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
                              viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
                             ])
    }
}
