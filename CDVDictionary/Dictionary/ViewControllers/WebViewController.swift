//
//  WebViewController.swift
//  Dictionary
//
//  Created by Alex Golub on 9/25/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

final class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupURL()
        setupNavigationBar()
    }

    // MARK: - Utils

    private func setupURL() {
        guard let url = URL(string: "http://codeveyor.com") else { return }
        webView.loadRequest(URLRequest(url: url))
    }

    private func setupNavigationBar() {
        NavigationBarStyleUtils().style(navigationBar: (navigationController?.navigationBar)!)
        title = "CODEVEYOR.COM"
    }
}
