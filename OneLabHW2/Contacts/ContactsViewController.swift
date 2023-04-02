import UIKit
import SnapKit
import Contacts
class ContactsViewController: UIViewController {
    private let searchController: UISearchController = {
        let searchcontroller = UISearchController(searchResultsController: nil)
        searchcontroller.obscuresBackgroundDuringPresentation = false
        searchcontroller.searchBar.placeholder = "Search"
        return searchcontroller
    }()
    var filteredNames: [String] = []
    var filteredSections: [Character] = []

    var names: [String] = {
        if let savedNames = UserDefaults.standard.array(forKey: "names") as? [String] {
            return savedNames.sorted()
        } else {
            let defaultNames = [
                "Smith", "Johnson", "Williams", "Jones", "Brown",
                "Davis", "Miller", "Wilson", "Moore", "Taylor",
                "Aidar", "Aigerim", "Alibek", "Asylbek", "Dauren",
                "Dinara", "Dulat", "Gulnaz", "Kamila", "Nursultan",
                "Adina", "Aizere", "Akzhol", "Arailym", "Arman",
                "Aruzhan", "Asel", "Askhat", "Ayaulym", "Bakyt",
                "Bolat", "Damir", "Dana", "Daniyar", "Darina",
                "Dastan", "Diana", "Dilnaz", "Dinmukhamed", "Edil",
                "Eldar", "Elena", "Emin", "Erkebulan", "Erzhan",
                "Farida", "Galym", "Gaukhar", "Gulmira", "Islambek"
            ]
            UserDefaults.standard.setValue(defaultNames, forKey: "names")
            return defaultNames.sorted()
        }
    }()



    private let tableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchController.searchBar.delegate = self
        setNavBar()
        setTableView()
        filteredNames = names
        filteredSections = Array(Set(names.map { $0.first! })).sorted()
    }
    private func filterContacts(searchText: String) {
        if searchText.isEmpty {
            filteredNames = names
            filteredSections = Array(Set(names.map { $0.first! })).sorted()
        } else {
            filteredNames = names.filter { $0.lowercased().contains(searchText.lowercased()) }
            filteredSections = Array(Set(filteredNames.map { $0.first! })).sorted()
        }
        tableView.reloadData()
    }

    private func addContact(name: String) {
        names.append(name)
        names = names.sorted()
        
        filteredNames = names
        filteredSections = Array(Set(names.map { $0.first! })).sorted()
        
        updateNamesInUserDefaults()
        tableView.reloadData()
    }

    private func presentAddContactAlert() {
        let alertController = UIAlertController(title: "Add Contact", message: "Enter contact name", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Contact Name"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self, weak alertController] _ in
            if let textField = alertController?.textFields?.first,
               let contactName = textField.text,
               !contactName.isEmpty {
                self?.addContact(name: contactName)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    private func setNavBar() {
        title = "Contacts"
        
        let userButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addContactButtonTapped))
        navigationItem.rightBarButtonItem = userButton
        userButton.tintColor = .systemBlue
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }

    @objc private func addContactButtonTapped() {
        presentAddContactAlert()
    }
    private func filteredNamesInSection(section: Int) -> [String] {
        let letter = filteredSections[section]
        return filteredNames.filter { $0.first == letter }
    }
    private func updateNamesInUserDefaults() {
        UserDefaults.standard.setValue(names, forKey: "names")
    }

    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return filteredNamesInSection(section: section).count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           let filteredNamesInSection = self.filteredNamesInSection(section: indexPath.section)
           cell.textLabel?.text = filteredNamesInSection[indexPath.row]
           return cell
       }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return String(filteredSections[section])
       }

       func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
           return filteredSections.firstIndex(of: Character(title)) ?? 0
       }

       func sectionIndexTitles(for tableView: UITableView) -> [String]? {
           return filteredSections.map { String($0) }
       }

       func numberOfSections(in tableView: UITableView) -> Int {
           return filteredSections.count
       }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         filterContacts(searchText: searchText)
     }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let section = indexPath.section
            let row = indexPath.row
            
            let letter = filteredSections[section]
            let name = filteredNamesInSection(section: section)[row]
            
            filteredNames.removeAll { $0 == name }
            names.removeAll { $0 == name }

            filteredSections = Array(Set(names.map { $0.first! })).sorted()
            
            updateNamesInUserDefaults()
            tableView.reloadData()
        }
    }

    }
