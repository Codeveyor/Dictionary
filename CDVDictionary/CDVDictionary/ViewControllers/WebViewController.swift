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

    //MARK: Utils

    fileprivate func setupURL() {
        let url = URL(string:"http://codeveyor.com")
        webView.loadRequest(URLRequest(url: url!))
    }

    fileprivate func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = Colors().yellowColor()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title:"", style: .plain, target:nil, action:nil)
    }
}
