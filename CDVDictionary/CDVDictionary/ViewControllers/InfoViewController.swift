//
//  InfoViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/23/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

final class InfoViewController: UIViewController {

    @IBOutlet weak var infoTableView: UITableView!

    private struct Constants {
        static let infoTableViewHeaderFooterHeight: CGFloat = 0.01
        static let textSegueIdentifier = "textSegue"
        static let webSegueIdentifier = "webSegue"
        static let alphabetSegueIdentifier = "alphabetSegue"
    }

    private typealias StringTuple = (title: String, text: String)
    private var sourceArray = [StringTuple]()
    // TODO: test
    private var selectedTuple: StringTuple!
    private var selectedPlist = ""

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.alphabetSegueIdentifier {
            guard let alphabetViewController = segue.destination as? AlphabetViewController else { return }

            alphabetViewController.dictionaryName = selectedPlist
            alphabetViewController.navigationTitle = selectedTuple.title
        } else if segue.identifier == Constants.textSegueIdentifier {
            guard let textViewController = segue.destination as? ResizedTextViewController else { return }

            textViewController.navigationTitle = selectedTuple.title
            textViewController.text = selectedTuple.text
        }
    }

    // MARK: - Actions

    @IBAction func didPressFacebook(button: UIButton) {
        showSheet(serviceType: SLServiceTypeFacebook)
    }

    @IBAction func didPressTwitter(button: UIButton) {
        showSheet(serviceType: SLServiceTypeTwitter)
    }

    // MARK: - Utils

    private func setupDataSource() {
        // TODO: test
        sourceArray = [StringTuple("Srpski Abeceda", ""),
                       StringTuple("Русский алфавит", ""),
                       StringTuple("Сербский язык", "Сербский Язык. \n\nСе́рбский язы́к — один из славянских языков. Вместе с болгарским, македонским, словенским, черногорским, хорватским и боснийским относится к южнославянской подгруппе. Последние три языка часто объединяют с сербским в один (сербохорватский язык); в этом случае отдельные сербский, хорватский и боснийский языки считают региональными вариантами сербохорватского. На сербском языке говорят в Сербии и Черногории (до 2006 г. составлявших общее конфедеративное государство), в отдельных восточных районах Хорватии, а также в боснийском регионе Республика Сербская. Число говорящих — около 11 млн. человек. \n\nПисьменность \n\nСербский язык использует в качестве письменности два алфавита: основанный на кириллице («Вуковица») и основанный на латинице («Гаевица»). Кириллица считается официальной, однако вне официального обихода латиница используется также часто. В каждом по 30 букв; существует однозначное соответствие между буквами одного алфавита и другого (но простое автоматическое преобразование текста возможно только в одну сторону, так как латинские диграфы изредка соответствуют парам раздельных кириллических букв: конјункција, поджупан). Га́евица, или хорватская латиница (названа по имени своего создателя, деятеля хорватского возрождения Людевита Гая) — латинский алфавит для хорватского языка, созданный в середине XIX века и с тех пор не менявшийся. Используется в Хорватии.\n\nГаевица \n\nГаевица была заимствована у хорватов другими народами, Боснии и Герцеговины, Сербии и Черногории. Кириллический аналог — Вуковица, которая используется для записи только сербского языка. Для основы данного словаря была выбрана именно Гаевица имеющая большую схожесть с сербским в Вуковице, но имеющим написание кириллическим алфавитом. Таким образом словарь может использоваться в большей степени не только в Сербии, Хорватии но также и во всех странах южнославянской подгруппы языков."),
                       StringTuple("Ruski jezik", "Ruski jezik \n\nRuski jezik — Zajedno s ukrajinskim i bjeloruskim čini skupinu istočnoslavenskih jezika. Standardni ruski jezik temelji se na narječju Moskve. Ruskim kao materinjim jezikom govori oko 180 milijuna ljudi, od kojih oko 130 milijuna živi u Rusiji. Službeni je jezik u Rusiji, Bjelorusiji (uz bjeloruski), Kazahstanu (uz kazaški), Kirgistanu (uz kirgiški) te ukrajinskoj Autonomnoj Republici Krim (uz ukrajinski). U ovim i ostalim zemljama bivšeg Sovjetskog Saveza ruski je materinji jezik dijela stanovništva i u većoj ili manjoj mjeri jezik javnog života. Široko se rabi i u kulturi, znanosti i tehnici. Uzimajući u obzir i broj govornika ruskog kao drugog jezika, njime se služi oko 300 milijuna ljudi. \n\nPismo \n\nRuski se zapisuje ćirilicom, izvedenom u 10. stoljeću iz grčkog pisma uz dodatak nekih slova glagoljice, za zapisivanje crkvenih tekstova na slavenskim jezicima. Oblici mnogih slova promijenjeni su i približeni latinici reformama koje je započeo Petar I. Veliki godine 1708. Ovo su novo tzv. Građansko Pismo preuzeli i svi ostali narodi koji pišu ćirilicom - Srbi, Bugari, Ukrajinci, i Bjelorusi."),
                       StringTuple("Сайт разработчика", "")
        ]
    }
}

extension InfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? InfoCell else {
            fatalError("ERROR! Unable to dequeue InfoCell")
        }

        cell.label?.text = sourceArray[indexPath.row].title

        return cell
    }
}

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTuple = sourceArray[indexPath.row]
        switch indexPath.row {
        case 0:
            selectedPlist = "serbianAlphabet"
            performSegue(withIdentifier: Constants.alphabetSegueIdentifier, sender: self)
        case 1:
            selectedPlist = "russianAlphabet"
            performSegue(withIdentifier: Constants.alphabetSegueIdentifier, sender: self)
        case 2, 3:
            performSegue(withIdentifier: Constants.textSegueIdentifier, sender: self)
        case 4:
            performSegue(withIdentifier: Constants.webSegueIdentifier, sender: self)
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.infoTableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.infoTableViewHeaderFooterHeight
    }
}
