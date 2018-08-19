//
//  AlphabetViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/25/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

final class AlphabetViewController: UIViewController {

    @IBOutlet weak var alphabetTableView: UITableView!

    private struct Constants {
        static let alphabetTableViewHeaderFooterHeight = CGFloat(0.01)
    }
    var navigationTitle = ""
    var dictionaryName = ""
    private var sourceArray = [String]()
    private var displayDictionary = [String: String]()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData(plistName: dictionaryName)
        setupNavigationBar()
        setupTableView()
    }

    // MARK: - Utils

    private func setupData(plistName: String) {
        guard let data = PlistReaderUtils().read(plistName) else {
            return
        }

        sourceArray = data.sourceArray
        displayDictionary = data.displayDictionary
        alphabetTableView.reloadData()
    }

    private func setupTableView() {
        alphabetTableView.rowHeight = UITableViewAutomaticDimension
        alphabetTableView.estimatedRowHeight = 56.0
    }

    private func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }

        NavigationBarStyleUtils().style(navigationBar: navigationBar)
        title = navigationTitle
    }
}

extension AlphabetViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alphabetCell", for: indexPath) as? DictionaryCell else {
            fatalError("ERROR! Unable to dequeue DictionaryCell")
        }

        let letter = sourceArray[indexPath.row]
        
        guard let translation = displayDictionary[letter] else {
            fatalError("ERROR! Unable to get value for key from dictionary")
        }

        cell.updateCellWith(letter: letter,
                            translation: translation,
                            indexPathRow: indexPath.row)

        return cell
    }
}

extension AlphabetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.alphabetTableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.alphabetTableViewHeaderFooterHeight
    }
}
