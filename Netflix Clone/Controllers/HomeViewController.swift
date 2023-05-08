//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 08/05/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Class Variables
    
    private let homeFeedTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    // MARK: - Class Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // View covers all bounds of the screen
        homeFeedTable.frame = view.bounds
    }
}

// MARK: - Home View Controller Extensions

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello W"
        return cell
    }
    
    
}
