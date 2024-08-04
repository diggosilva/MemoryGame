//
//  BoardView.swift
//  MemoryGame
//
//  Created by Diggo Silva on 03/08/24.
//

import UIKit

class BoardView: UIView {
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: 0"
        label.textAlignment = .center
        label.textColor = .systemRed
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var hardModeView: HardBoardView = {
        let view = HardBoardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var newGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar Novo Jogo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .white
        addSubviews([scoreLabel, hardModeView, newGameButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            hardModeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            hardModeView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            newGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newGameButton.widthAnchor.constraint(equalToConstant: 250),
            newGameButton.widthAnchor.constraint(lessThanOrEqualTo: newGameButton.widthAnchor, multiplier: 0.6),
            newGameButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
