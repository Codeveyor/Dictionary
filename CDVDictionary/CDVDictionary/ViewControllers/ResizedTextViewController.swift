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
    fileprivate let tableViewNumberOfSections = 1
    fileprivate let tableViewNumberOfRows = 1
    fileprivate let tableViewHeaderFooterHeight: CGFloat = 0.01
    fileprivate let tableViewCellHeight: CGFloat = 60.0
    fileprivate let textCellIdentifier = "textCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        setupTableView()
    }
}

extension ResizedTextViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewNumberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewNumberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! InfoCell
        cell.label?.text = text
        return cell
    }
}

extension ResizedTextViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableViewHeaderFooterHeight
    }
}

extension ResizedTextViewController {
    fileprivate func setupDataSource() {
        title = navigationTitle
        textTableView.reloadData()
    }

    fileprivate func setupTableView() {
        textTableView.rowHeight = UITableViewAutomaticDimension
        textTableView.estimatedRowHeight = tableViewCellHeight
    }
}
