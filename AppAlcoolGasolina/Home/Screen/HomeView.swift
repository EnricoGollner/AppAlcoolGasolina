//
//  HomeView.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 12/11/23.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func startTappedButton()
}

class HomeView: UIView {
    private weak var delegate: HomeViewDelegate?
    
    public func configDelegate(delegate: HomeViewDelegate) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg_home")
        return imageView
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = AppColors.pinkColor
        button.addTarget(self, action: #selector(self.startButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func startButtonTapped() {
        self.delegate?.startTappedButton()
    }
    
    override
    init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(backgroundImage)
        self.addSubview(logoAppImageView)
        self.addSubview(startButton)
        
        self.setUpConstraints()
    }
    
    private func setUpConstraints() {
        self.backgroundImage.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 104),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            
            self.startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -125),
            self.startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.startButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
