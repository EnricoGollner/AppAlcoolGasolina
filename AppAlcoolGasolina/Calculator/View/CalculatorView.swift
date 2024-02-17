//
//  CalculatorView.swift
//  AppAlcoolGasolina
//
//  Created by Enrico Sousa Gollner on 17/02/24.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject {
    func backButtonTapped()
    func calculateButtonTapped()
}

class CalculatorView: UIView {
    private weak var delegate: CalculatorViewDelegate?
    
    public func configDelegate(delegate: CalculatorViewDelegate) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bg_blur")
        imageView.contentMode = .scaleAspectFit
        
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
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var ethanolTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no  // disable textField autocorretion
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço do Álcool"
        textField.textColor = .darkGray
        
        return textField
    }()
    
    lazy var gasTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço da gasolina"
        textField.textColor = .darkGray

        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColors.pinkColor
        button.setTitle("Calcular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = AppColors.disabledButtonColor
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func backButtonTapped() {
        self.delegate?.backButtonTapped()
    }
    
    @objc func calculateButtonTapped() {
        self.delegate?.calculateButtonTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addElements()
        self.setUpConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addElements() {
        self.addSubview(backgroundImage)
        self.addSubview(backButton)
        self.addSubview(logoAppImage)
        self.addSubview(ethanolTextField)
        self.addSubview(gasTextField)
        self.addSubview(calculateButton)
    }
    
    private func setUpConstaints() {
        self.backgroundImage.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.logoAppImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 150),
            self.logoAppImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoAppImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.ethanolTextField.topAnchor.constraint(equalTo: self.logoAppImage.bottomAnchor, constant: 134),
            self.ethanolTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.ethanolTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.ethanolTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.gasTextField.topAnchor.constraint(equalTo: self.ethanolTextField.bottomAnchor, constant: 15),
            self.gasTextField.leadingAnchor.constraint(equalTo: self.ethanolTextField.leadingAnchor),
            self.gasTextField.trailingAnchor.constraint(equalTo: self.ethanolTextField.trailingAnchor),
            self.gasTextField.heightAnchor.constraint(equalTo: self.ethanolTextField.heightAnchor),
            
            self.calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -135),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
