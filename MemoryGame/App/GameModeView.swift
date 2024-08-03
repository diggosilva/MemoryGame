//
//  GameModeView.swift
//  MemoryGame
//
//  Created by Diggo Silva on 03/08/24.
//

import UIKit

class GameModeView: UIView {
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 5, height: 5)
        image.layer.shadowOpacity = 0.5
        image.layer.shadowRadius = 3.0
        return image
    }()
    lazy var easyButton: UIButton = {
        buildButton(setTitle: "Fácil 🍼", colorDefault: .systemOrange, action: #selector(easyButtonTapped))
    }()
    
    lazy var normalButton: UIButton = {
        buildButton(setTitle: "Normal 😏", colorDefault: .systemGreen, action: #selector(normalButtonTapped))
    }()
    
    lazy var hardButton: UIButton = {
        buildButton(setTitle: "Difícil 🫡", colorDefault: .systemRed, action: #selector(hardButtonTapped))
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [easyButton, normalButton, hardButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func easyButtonTapped() {
        print("Escolheu FÁCIL")
    }
    
    @objc private func normalButtonTapped() {
        print("Escolheu NORMAL")
    }
    
    @objc private func hardButtonTapped() {
        print("Escolheu DIFÍCIL")
    }
    
    func buildButton(setTitle: String, colorDefault: UIColor = .systemBlue, cornerRadius: CGFloat = 20, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(colorDefault, for: .normal)
        button.backgroundColor = colorDefault.withAlphaComponent(0.25)
        button.layer.borderColor = colorDefault.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)
        button.clipsToBounds = true
        button.addTarget(self, action: action, for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 3.0
        return button
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .white
        addSubviews([logoImage, vStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStack.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
