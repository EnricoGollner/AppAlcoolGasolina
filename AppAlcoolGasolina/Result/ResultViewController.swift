//
//  ResultViewController.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

class ResultViewController: UIViewController {
    var resultView: ResultView?
    
    override func loadView() {
        resultView = ResultView()
        self.view = resultView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultView?.configDelegate(delegate: self)
    }
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ResultViewController: ResultViewDelegate {
    func backButtonTapped() {
        self.popViewController()
    }
    
    func calculateAgainTapped() {
        self.popViewController()
    }
    
}
