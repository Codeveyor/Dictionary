//
//  ResizedTextViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/24/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

class ResizedTextViewController: UIViewController {
    @IBOutlet weak var textTableView: UITableView!
    var navigationTitle: String!
    var text: String!
    fileprivate let textTableViewNumberOfSections = 1
    fileprivate let textTableViewNumberOfRows = 1
    fileprivate let textTableViewHeaderFooterHeight: CGFloat = 0.01
    fileprivate let textTableViewCellHeight: CGFloat = 60.0
    fileprivate let textCellIdentifier = "textCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
}

extension ResizedTextViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return textTableViewNumberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textTableViewNumberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! InfoCell
        cell.label?.text = text
        return cell
    }
}

extension ResizedTextViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return textTableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return textTableViewHeaderFooterHeight
    }
}

extension ResizedTextViewController {
    // MARK: Utils
    fileprivate func setupTableView() {
        textTableView.rowHeight = UITableViewAutomaticDimension
        textTableView.estimatedRowHeight = textTableViewCellHeight
    }

    fileprivate func setupNavigationBar() {
        NavigationBarStyleUtils().style(navigationBar: (navigationController?.navigationBar)!)
        title = navigationTitle
    }
}
