//
//  DictionaryViewController.swift
//  Dictionary
//
//  Created by Alex Golub on 12/17/15.
//  Copyright © 2015 Alex Golub. All rights reserved.
//

import UIKit

final class DictionaryViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dictionaryTableView: UITableView!
    @IBOutlet weak var dictionaryTableViewBottomConstraint: NSLayoutConstraint!

    private struct Constants {
        static let dictionaryTableViewHeaderFooterHeight =  CGFloat(0.01)
        static let animationDuration = TimeInterval(0.3)
    }

    var dictionaryName: String!

    private var sourceArray = [String]()
    private var displayArray = [String]()
    private var displayDictionary = [String: String]()

    private let attributedStringUtils = AttributedStringUtils()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let dictionaryName = dictionaryName {
            setupData(plistName: dictionaryName)
        }
        setupTableView()

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillHide(notification:)),
                                       name: .UIKeyboardWillHide,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(keyboardWillShow(notification:)),
                                       name: .UIKeyboardWillShow,
                                       object: nil)
    }

    // MARK: - Utils

    private func setupTableView() {
        dictionaryTableView.rowHeight = UITableViewAutomaticDimension
        dictionaryTableView.estimatedRowHeight = 50.0
    }

    private func setupData(plistName: String) {
        guard let data = PlistReaderUtils().read(plistName) else {
            return
        }

        sourceArray = data.sourceArray
        displayDictionary = data.displayDictionary
        displayArray.append(contentsOf: sourceArray)
        dictionaryTableView.reloadData()
    }

    private func setupAttributedString(cell: DictionaryCell, fullString: String) {
        guard let text = searchBar.text,
            text.count >= 0 else { return }

        cell.wordLabel.attributedText = attributedStringUtils.createAttributedString(fullString: fullString, subString: text)
    }

    private func setupColorView(indexPathRow: Int) -> UIColor {
        if indexPathRow % 2 == 0 {
            return .base
        }

        let baseCellColor = UIColor.baseCell.withAlphaComponent(0.3)
        return baseCellColor
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: Constants.animationDuration) {
            self.dictionaryTableViewBottomConstraint.constant = 0
        }
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        UIView.animate(withDuration: Constants.animationDuration) {
            self.dictionaryTableViewBottomConstraint.constant = keyboardSize.height
        }
    }
}

extension DictionaryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath) as? DictionaryCell else {
            fatalError("ERROR! Unable to dequeue DictionaryCell")
        }

        let word = displayArray[indexPath.row]
        cell.wordLabel?.text = word
        cell.translationLabel?.text = displayDictionary[word]
        setupAttributedString(cell: cell, fullString: word)
        cell.colorView.backgroundColor = setupColorView(indexPathRow: indexPath.row)

        return cell
    }
}

extension DictionaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.dictionaryTableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.dictionaryTableViewHeaderFooterHeight
    }
}

extension DictionaryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        displayArray.removeAll()
        if searchText.isEmpty {
            displayArray.append(contentsOf: sourceArray)
        } else {
            for word in sourceArray {
                if word.range(of: searchText, options: .caseInsensitive) != nil {
                    displayArray.append(word)
                }
            }
        }

        dictionaryTableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
