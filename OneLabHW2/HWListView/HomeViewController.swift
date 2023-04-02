//
//  HomeViewController.swift
//  OneLabHW2
//
//  Created by Arnur Sakenov on 01.04.2023.
//

import UIKit
import SnapKit
import SwiftUI
class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.backgroundColor = .green
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.snp.edges)
        }
    }
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
}
extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "HomeWork \(indexPath.row + 1)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0: navigationController?.pushViewController(ScrollViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(ContactsViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(PinterestViewController(), animated: true)
        case 3:
                    let swiftUIView = ActiveCallView()
                    let hostingController = UIHostingController(rootView: swiftUIView)
                    
                    // Customize hostingController if needed
                    hostingController.modalPresentationStyle = .fullScreen
                    
                    present(hostingController, animated: true, completion: nil)
                
        default:
            print("hi")
        }
    }
}
