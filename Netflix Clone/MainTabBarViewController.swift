//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Amr El-Fiqi on 08/05/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    
    // MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
    }

    func setupView() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
    }
}

