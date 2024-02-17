//
//  ViewController.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 12/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    lazy var homeView = HomeView(frame: .zero)
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView.configDelegate(delegate: self)
    }
}

extension HomeViewController: HomeViewDelegate {
    func startTappedButton() {
        self.navigationController?.pushViewController(CalculatorViewController(), animated: true)
    }
}

