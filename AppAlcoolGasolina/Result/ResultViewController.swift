//
//  ResultViewController.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultViewController: UIViewController {
    var resultView: ResultView?
    var bestFuel: BestFuel
    
    init(result: BestFuel) {
        self.bestFuel = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.resultView?.resultLabel.text = bestFuel.rawValue
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
