//
//  WebViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/25/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupURL()
        setupNavigationBar()
    }
}

extension WebViewController {
    //MARK: Utils
    fileprivate func setupURL() {
        let url = URL(string:"http://codeveyor.com")
        webView.loadRequest(URLRequest(url: url!))
    }

    fileprivate func setupNavigationBar() {
        NavigationBarStyleUtils().style(navigationBar: (navigationController?.navigationBar)!)
        title = "CODEVEYOR.COM"
    }
}
