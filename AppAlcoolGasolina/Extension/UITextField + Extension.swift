//
//  UITextField + Extension.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(self.doneButtonTapped))
        
        let items = [flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
    }
    
    @objc private func doneButtonTapped() {
        self.resignFirstResponder()
    }
}
