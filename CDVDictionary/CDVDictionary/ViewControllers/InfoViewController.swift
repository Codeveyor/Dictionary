//
//  InfoViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/23/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var infoTableView: UITableView!
    fileprivate let tableViewNumberOfSections = 1
    fileprivate let tableViewHeaderFooterHeight: CGFloat = 0.01
    fileprivate let tableViewRowHeight: CGFloat = 60.0
    fileprivate let infoCellIdentifier = "infoCell"
    fileprivate let textSegueIdentifier = "textSegue"
    fileprivate let webSegueIdentifier = "webSegue"
    fileprivate let alphabetSegueIdentifier = "alphabetSegue"
    fileprivate typealias StringTuple = (title: String, text: String)
    fileprivate var sourceArray = [StringTuple]()
    fileprivate var selectedTuple: StringTuple!
    fileprivate var selectedPlist: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == alphabetSegueIdentifier {
            let alphabetViewController = segue.destination as! AlphabetViewController
            alphabetViewController.dictionaryName = selectedPlist
            alphabetViewController.navigationTitle = selectedTuple.title
        } else if segue.identifier == textSegueIdentifier {
            let textViewController = segue.destination as! ResizedTextViewController
            textViewController.navigationTitle = selectedTuple.title
            textViewController.text = selectedTuple.text
        }
    }
}

extension InfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewNumberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: infoCellIdentifier, for: indexPath) as! InfoCell
        let cellText = sourceArray[indexPath.row].title
        cell.label?.text = cellText
        return cell
    }
}

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTuple = sourceArray[indexPath.row]
        switch indexPath.row {
        case 0:
            selectedPlist = "serbianAlphabet"
            performSegue(withIdentifier: alphabetSegueIdentifier, sender: self)
        case 1:
            selectedPlist = "russianAlphabet"
            performSegue(withIdentifier: alphabetSegueIdentifier, sender: self)
        case 2, 3:
            performSegue(withIdentifier: textSegueIdentifier, sender: self)
        case 4:
            performSegue(withIdentifier: webSegueIdentifier, sender: self)
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewRowHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableViewHeaderFooterHeight
    }
}

extension InfoViewController {
    @IBAction func facebookButtonDidPressed(button: UIButton) {
        showSheet(serviceType: SLServiceTypeFacebook)
    }

    @IBAction func twitterButtonDidPressed(button: UIButton) {
        showSheet(serviceType: SLServiceTypeTwitter)
    }
}

extension InfoViewController {
    fileprivate func setupDataSource() {
        sourceArray = [StringTuple("Srpski Abeceda", ""),
                       StringTuple("Русский алфавит", ""),
                       StringTuple("Сербский язык", "Сербский Язык. \n\nСе́рбский язы́к — один из славянских языков. Вместе с болгарским, македонским, словенским, черногорским, хорватским и боснийским относится к южнославянской подгруппе. Последние три языка часто объединяют с сербским в один (сербохорватский язык); в этом случае отдельные сербский, хорватский и боснийский языки считают региональными вариантами сербохорватского. На сербском языке говорят в Сербии и Черногории (до 2006 г. составлявших общее конфедеративное государство), в отдельных восточных районах Хорватии, а также в боснийском регионе Республика Сербская. Число говорящих — около 11 млн. человек. \n\nПисьменность \n\nСербский язык использует в качестве письменности два алфавита: основанный на кириллице («Вуковица») и основанный на латинице («Гаевица»). Кириллица считается официальной, однако вне официального обихода латиница используется также часто. В каждом по 30 букв; существует однозначное соответствие между буквами одного алфавита и другого (но простое автоматическое преобразование текста возможно только в одну сторону, так как латинские диграфы изредка соответствуют парам раздельных кириллических букв: конјункција, поджупан). Га́евица, или хорватская латиница (названа по имени своего создателя, деятеля хорватского возрождения Людевита Гая) — латинский алфавит для хорватского языка, созданный в середине XIX века и с тех пор не менявшийся. Используется в Хорватии.\n\nГаевица \n\nГаевица была заимствована у хорватов другими народами, Боснии и Герцеговины, Сербии и Черногории. Кириллический аналог — Вуковица, которая используется для записи только сербского языка. Для основы данного словаря была выбрана именно Гаевица имеющая большую схожесть с сербским в Вуковице, но имеющим написание кириллическим алфавитом. Таким образом словарь может использоваться в большей степени не только в Сербии, Хорватии но также и во всех странах южнославянской подгруппы языков."),
                       StringTuple("Ruski jezik", "Ruski jezik \n\nRuski jezik — Zajedno s ukrajinskim i bjeloruskim čini skupinu istočnoslavenskih jezika. Standardni ruski jezik temelji se na narječju Moskve. Ruskim kao materinjim jezikom govori oko 180 milijuna ljudi, od kojih oko 130 milijuna živi u Rusiji. Službeni je jezik u Rusiji, Bjelorusiji (uz bjeloruski), Kazahstanu (uz kazaški), Kirgistanu (uz kirgiški) te ukrajinskoj Autonomnoj Republici Krim (uz ukrajinski). U ovim i ostalim zemljama bivšeg Sovjetskog Saveza ruski je materinji jezik dijela stanovništva i u većoj ili manjoj mjeri jezik javnog života. Široko se rabi i u kulturi, znanosti i tehnici. Uzimajući u obzir i broj govornika ruskog kao drugog jezika, njime se služi oko 300 milijuna ljudi. \n\nPismo \n\nRuski se zapisuje ćirilicom, izvedenom u 10. stoljeću iz grčkog pisma uz dodatak nekih slova glagoljice, za zapisivanje crkvenih tekstova na slavenskim jezicima. Oblici mnogih slova promijenjeni su i približeni latinici reformama koje je započeo Petar I. Veliki godine 1708. Ovo su novo tzv. Građansko Pismo preuzeli i svi ostali narodi koji pišu ćirilicom - Srbi, Bugari, Ukrajinci, i Bjelorusi."),
                       StringTuple("Сайт разработчика", "")
        ]
    }

    fileprivate func showSheet(serviceType: String) {
        if let sheet = SocialShareFactory().shareSheet(for: serviceType) {
            present(sheet, animated: true)
        } else {
            let alertController = UIAlertController(title: "Ошибка", message: "Аккаунт не настроен в Настройках устройства", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel) { (action) in })
            present(alertController, animated: true)
        }
    }
}

import Social

private struct SocialShareFactory {
    func shareSheet(for serviceType: String) -> SLComposeViewController? {
        if let composeController = SLComposeViewController(forServiceType: serviceType) {
            composeController.view.tintColor = Colors().yellowColor()
            let completionHandler: SLComposeViewControllerCompletionHandler = { result in
                if result == SLComposeViewControllerResult.cancelled {
                    print("Cancelled")
                } else {
                    print("Done")
                }
                composeController.dismiss(animated: true, completion: nil)
            }
            composeController.completionHandler = completionHandler
            composeController.setInitialText("Русско-сербский словарь для iOS - Балкания")
            composeController.add(UIImage(named: "preview")!)
            composeController.add(URL(string: "http://codeveyor.com"))
            return composeController
        } else {
            return nil
        }
    }
}
