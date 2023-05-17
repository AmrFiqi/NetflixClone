//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 08/05/2023.
//

import UIKit

// MARK: - Enum

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    // MARK: - Class Variables
    
    // Create tablewview
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    let sectionTitles: [String] = ["Trending Movies", "Trending TV", "Popular", "Upcoming Movies", "Top rated"]
    
    let apiCaller = APICaller()
    
    // MARK: - Class Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // Add the table view the the HomeViewController
        view.addSubview(homeFeedTable)
        setupSubView(homeFeedTable)
        setupHeaderView(homeFeedTable)
        configNavBar()
        getTrendingMovies()
        //getTrendingTvs()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // View covers all bounds of the screen
        homeFeedTable.frame = view.bounds
    }
    
    func setupSubView(_ view: UITableView){
        view.delegate = self
        view.dataSource = self
    }
    
    func setupHeaderView(_ view: UITableView){
        let headerView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        view.tableHeaderView = headerView
    }
    
    private func configNavBar() {
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil),
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func getTrendingMovies() {
        APICaller.shared.makeAPIRequest(endpoint: Constants.popular, responseType: TrendingTitleResponse.self) { result in
            switch result {
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
}


private func getTrendingTvs() {
    APICaller.shared.makeAPIRequest(endpoint: Constants.trendingTvs, responseType: TrendingTitleResponse.self) { result in
        switch result {
        case .success(let movies):
            print(movies)
        case .failure(let error):
            print(error)
        }
    }
}


// MARK: - Home View Controller Extensions

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20 , y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.lowercased()
        header.textLabel?.text = header.textLabel?.text?.capitalizingFirstLetter()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell()}
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            apiCall(endpoint: Constants.trendingMovies, cells: cell)
        case Sections.TrendingTv.rawValue:
            apiCall(endpoint: Constants.trendingTvs, cells: cell)
        case Sections.Popular.rawValue:
            apiCall(endpoint: Constants.popular, cells: cell)
        case Sections.Upcoming.rawValue:
            apiCall(endpoint: Constants.upcomingMovies, cells: cell)
        case Sections.TopRated.rawValue:
            apiCall(endpoint: Constants.topRated, cells: cell)
        default: return UITableViewCell();
        }
        return cell
    }
    
    private func apiCall(endpoint: String, cells: CollectionViewTableViewCell) {
        APICaller.shared.makeAPIRequest(endpoint: endpoint, responseType: TrendingTitleResponse.self) { result in
            switch result {
            case .success(let titles):
                cells.configure(with: titles.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaulOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaulOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    
}
