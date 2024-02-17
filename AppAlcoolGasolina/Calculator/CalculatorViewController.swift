//
//  CalculatorViewController.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorView: CalculatorView?
    var alert: Alert?
    
    override func loadView() {
        calculatorView = CalculatorView()
        self.view = calculatorView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedArround()
        self.alert = Alert(controller: self)
        self.calculatorView?.configDelegate(delegate: self)
    }
    
    func validateTextFields() -> Bool {
        guard let ethanolPrice = calculatorView?.ethanolTextField.text,
              let gasPrice = calculatorView?.gasTextField.text else {
            return false
        }
        
        if (ethanolPrice.isEmpty && gasPrice.isEmpty) {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do álcool e da gasolina")
            return false
        } else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe o valor do álcool!")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe o valor da gasolina")
            return false
        }
        
        return true
    }
}

extension CalculatorViewController: CalculatorViewDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func calculateButtonTapped() {
        
        if  validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: calculatorView?.ethanolTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: calculatorView?.gasTextField.text ?? "0.0") as? Double) ?? 0.0
            
            let vc: ResultViewController?
            
            //MARK: - O valor de 0.7 é uma referência comumente usada para determinar se é mais vantajoso utilizar álcool (etanol) ou gasolina com base nos preços relativos dos combustíveis.
            if ethanolPrice / gasPrice > 0.7 {
                vc = ResultViewController(result: .gas)
            } else {
                vc = ResultViewController(result: .ethanol)
            }
            
            self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
        
    }
}
