//
//  ResizedTextViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/24/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

final class ResizedTextViewController: UIViewController {

    @IBOutlet weak var textTableView: UITableView!

    private struct Constants {
        static let textTableViewHeaderFooterHeight = CGFloat(0.01)
    }
    var navigationTitle: String!
    var text: String!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }

    // MARK: - Utils

    private func setupTableView() {
        textTableView.rowHeight = UITableViewAutomaticDimension
        textTableView.estimatedRowHeight = 60.0
    }

    private func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }

        NavigationBarStyleUtils().style(navigationBar: navigationBar)
        title = navigationTitle
    }
}

extension ResizedTextViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as? InfoCell else {
            fatalError("ERROR! Unable to dequeue InfoCell")
        }

        cell.label?.text = text

        return cell
    }
}

extension ResizedTextViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.textTableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.textTableViewHeaderFooterHeight
    }
}
