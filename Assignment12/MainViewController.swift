//
//  MainViewController.swift
//  Assignment12
//
//  Created by Tekla on 10/29/23.
//

import UIKit

class MainViewController: UIViewController {
    /*
    private let navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return navBar
    }()
    */
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("+", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var favourites: UITableView!

    private func setupTableView() {
        initTableView()
        setTableConstraints()
        registerTableViewCells()
     }
    
    private func initTableView() {
        favourites = UITableView()
        favourites.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favourites)
        favourites.dataSource = self
        favourites.delegate = self
    }
    
    //Do we need this?
    private func registerTableViewCells() {
        favourites.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setTableConstraints() {
        NSLayoutConstraint.activate([
                                       // favourites.topAnchor.constraint(equalTo: addButton.bottomAnchor),
                                        favourites.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        favourites.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        favourites.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        favourites.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    //private var items = Item.favouriteItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setupTableView()
       // view.addSubview(navBar)
       //addButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
       // addButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
       // addButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       // addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
       // view.addSubview(addButton)
    }
}
    //MARK: - TableView Data Source
    
    extension MainViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            30
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // Again, do we even need this?
            cell.backgroundColor = .systemIndigo
            return cell
        }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 10 {
            return 100
        }
        return 50
    }
}

