//
//  DictionaryViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 12/17/15.
//  Copyright © 2015 Alex Golub. All rights reserved.
//

import UIKit

final class DictionaryViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dictionaryTableView: UITableView!
    @IBOutlet weak var dictionaryTableViewBottomConstraint: NSLayoutConstraint!

    var dictionaryName: String!

    fileprivate var sourceArray = [String]()
    fileprivate var displayArray = [String]()
    fileprivate var displayDictionary: Dictionary = [String: String]()
    fileprivate let dictionaryCellIdentifier = "dictionaryCell"
    fileprivate let dictionaryTableViewNumberOfSections: Int = 1
    fileprivate let dictionaryTableViewCellHeight: CGFloat = 50.0
    fileprivate let dictionaryTableViewHeaderFooterHeight: CGFloat = 0.01
    fileprivate let animationDuration: TimeInterval = 0.3
    fileprivate let attributedStringUtils = AttributedStringUtils()
    fileprivate let colors = ColorUtils()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let dictionaryName = dictionaryName {
            setupData(plistName: dictionaryName)
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
        return dictionaryTableViewNumberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dictionaryCellIdentifier, for: indexPath) as! DictionaryCell
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
        return dictionaryTableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return dictionaryTableViewHeaderFooterHeight
    }
}

extension DictionaryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        displayArray.removeAll()
        if searchText.count == 0 {
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
        dictionaryTableView.estimatedRowHeight = dictionaryTableViewCellHeight
    }

    fileprivate func setupData(plistName: String) {
        guard let data = PlistReaderUtils().read(plistName) else {
            return
        }
        sourceArray = data.sourceArray
        displayDictionary = data.displayDictionary
        displayArray.append(contentsOf: sourceArray)
        dictionaryTableView.reloadData()
    }

    fileprivate func setupAttributedString(cell: DictionaryCell, fullString: String) {
        if searchBar.text!.count > 0 {
            if let searchText = searchBar.text {
                let attributedString = attributedStringUtils.createAttributedString(fullString: fullString, subString: searchText)
                cell.wordLabel.attributedText = attributedString
            }
        }
    }

    fileprivate func setupColorView(indexPathRow: Int) -> UIColor {
        if indexPathRow % 2 == 0 {
            return colors.yellowColor()
        }
        return colors.cellYellowColor().withAlphaComponent(0.3)
    }

    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: animationDuration) {
            self.dictionaryTableViewBottomConstraint.constant = 0
        }
    }

    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        UIView.animate(withDuration: animationDuration) {
            self.dictionaryTableViewBottomConstraint.constant = keyboardSize.height
        }
    }
}
