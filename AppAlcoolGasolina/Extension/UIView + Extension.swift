//
//  UIView.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

extension UIView {
    public func pin(to superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
}
