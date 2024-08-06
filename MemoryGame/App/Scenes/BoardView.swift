//
//  BoardView.swift
//  MemoryGame
//
//  Created by Diggo Silva on 03/08/24.
//

import UIKit

protocol BoardViewDelegate: AnyObject {
    func didTapCard()
}

class BoardView: UIView {
    var difficult: Difficult = .hard {
        didSet {
            updateBoard()
        }
    }
    
    enum Difficult {
        case easy
        case normal
        case hard
    }
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: 0"
        label.textAlignment = .center
        label.textColor = .systemRed
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var selectedModeView: NormalBoardView = {
        let view = NormalBoardView()
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
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: BoardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateBoard() {
        selectedModeView.removeFromSuperview()
        
        let boardView: UIView
        
        switch difficult {
        case .easy:
            boardView = EasyBoardView(action: didTapCard)
        case .normal:
            boardView = NormalBoardView(action: didTapCard)
        case .hard:
            boardView = HardBoardView(action: didTapCard)
        }
        
        boardView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(boardView)
        
        NSLayoutConstraint.activate([
            boardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            boardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            boardView.widthAnchor.constraint(equalToConstant: 350),
            boardView.widthAnchor.constraint(lessThanOrEqualTo: boardView.widthAnchor, multiplier: 0.6),
            boardView.heightAnchor.constraint(equalToConstant: 580),
        ])
    }
    
    private func didTapCard() {
        delegate?.didTapCard()
    }
    
    @objc func didTapButton() {
        print("DEBUG: Apertou Começar Novo Jogo")
    }
    
    private func configStack(axis: NSLayoutConstraint.Axis, arrangedSubviews views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .white
        addSubviews([scoreLabel, selectedModeView, newGameButton])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            selectedModeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            selectedModeView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            newGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newGameButton.widthAnchor.constraint(equalToConstant: 250),
            newGameButton.widthAnchor.constraint(lessThanOrEqualTo: newGameButton.widthAnchor, multiplier: 0.6),
            newGameButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
