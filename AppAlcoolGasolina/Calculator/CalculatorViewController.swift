//
//  CalculatorViewController.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    lazy var calculatorView = CalculatorView(frame: .zero)
    
    override func loadView() {
        self.view = calculatorView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculatorView.configDelegate(delegate: self)
    }

}

extension CalculatorViewController: CalculatorViewDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func calculateButtonTapped() {
        print(#function)
    }
}
