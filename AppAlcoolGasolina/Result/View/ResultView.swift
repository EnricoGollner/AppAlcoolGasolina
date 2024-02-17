//
//  ResultView.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

protocol ResultViewDelegate: AnyObject {
    func backButtonTapped()
    func calculateAgainTapped()
}

class ResultView: UIView {
    
    private weak var delegate: ResultViewDelegate?
    
    public func configDelegate(delegate: ResultViewDelegate) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg_blur")
        return imageView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back_button"), for: .normal)
        button.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var logoAppImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo_menor")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 31)
        label.text = "Abasteça com:"
        
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 73)
        
        return label
    }()
    
    lazy var calculateAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular novamente", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = AppColors.pinkColor
        button.addTarget(self, action: #selector(self.calculateAgainTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    @objc func calculateAgainTapped() {
        delegate?.calculateAgainTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addElements()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.backButton)
        self.addSubview(self.logoAppImage)
        self.addSubview(self.sentenceLabel)
        self.addSubview(self.resultLabel)
        self.addSubview(self.calculateAgainButton)
    }
    
    private func setUpConstraints() {
        self.backgroundImage.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.logoAppImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            self.logoAppImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.sentenceLabel.topAnchor.constraint(equalTo: self.logoAppImage.bottomAnchor, constant: 180),
            self.sentenceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.resultLabel.topAnchor.constraint(equalTo: self.sentenceLabel.bottomAnchor, constant: 12),
            self.resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.calculateAgainButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -135),
            self.calculateAgainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.calculateAgainButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.calculateAgainButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
}
