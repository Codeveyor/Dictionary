//
//  DictionaryViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 12/17/15.
//  Copyright © 2015 Alex Golub. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dictionaryTableView: UITableView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!

    var dictionaryType: String!

    fileprivate var sourceArray = [String]()
    fileprivate var displayArray = [String]()
    fileprivate var displayDictionary: Dictionary = [String: String]()
    fileprivate let textCellIdentifier = "dictionaryTableCell"
    fileprivate let plistExtension = ".plist"
    fileprivate let tableViewNumberOfSections: Int = 1
    fileprivate let tableViewCellHeight: CGFloat = 50.0
    fileprivate let tableViewHeaderFooterHeight: CGFloat = 0.01
    fileprivate let animationDuration: TimeInterval = 0.3
    fileprivate let attributedStringUtils = AttributedStringUtils()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let dictionaryType = dictionaryType {
            readPlistToDictionary(dictionaryType)
        }
        setupTableView()

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension DictionaryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewNumberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! DictionaryCell
        let word = displayArray[indexPath.row]
        cell.wordLabel?.text = word
        cell.translationLabel?.text = displayDictionary[word]
        setupAttributedString(cell: cell, fullString: word)
        return cell
    }
}

extension DictionaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableViewHeaderFooterHeight
    }
}

extension DictionaryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        displayArray.removeAll()
        if searchText.characters.count == 0 {
            displayArray.append(contentsOf: sourceArray)
        } else {
            for word in sourceArray {
                if word.range(of: searchText, options: NSString.CompareOptions.caseInsensitive) != nil {
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

extension DictionaryViewController {
    // MARK: Utils
    fileprivate func setupTableView() {
        dictionaryTableView.rowHeight = UITableViewAutomaticDimension
        dictionaryTableView.estimatedRowHeight = tableViewCellHeight
    }

    fileprivate func setupAttributedString(cell: DictionaryCell, fullString: String) {
        if searchBar.text!.characters.count > 0 {
            if let searchText = searchBar.text {
                let attributedString = attributedStringUtils.createAttributedString(fullString: fullString, subString: searchText)
                cell.wordLabel.attributedText = attributedString
            }
        }
    }

    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: animationDuration) {
            self.tableViewBottomConstraint.constant = 0
        }
    }

    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        UIView.animate(withDuration: animationDuration) {
            self.tableViewBottomConstraint.constant = keyboardSize.height
        }
    }

    fileprivate func readPlistToDictionary(_ plistType: String) -> Void {
        if let path = pathInTestBundle(forFileWithName: plistType) {
            displayDictionary = NSDictionary(contentsOfFile: path) as! [String: String]
            sourceArray.append(contentsOf: displayDictionary.keys)
            sourceArray.sort { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
            displayArray.append(contentsOf: sourceArray)
            dictionaryTableView.reloadData()
        }
    }

    fileprivate func pathInTestBundle(forFileWithName name: String) -> String? {
        let bundle = Bundle(for:object_getClass(self))
        let safePath = bundle.path(forResource: name, ofType: plistExtension)
        return safePath
    }
}
