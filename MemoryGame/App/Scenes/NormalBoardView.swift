//
//  NormalBoardView.swift
//  MemoryGame
//
//  Created by Diggo Silva on 04/08/24.
//

import UIKit

protocol NormalBoardViewDelegate: AnyObject {
    func buttonTapped()
}

class NormalBoardView: UIView {
    // MARK: Line 1
    lazy var button0: UIButton = {
        configButton()
    }()
    
    lazy var button1: UIButton = {
        configButton()
    }()
    
    lazy var button2: UIButton = {
        configButton()
    }()
    
    lazy var button3: UIButton = {
        configButton()
    }()
    
    lazy var hStack0: UIStackView = {
        configStack(axis: .horizontal, arrangedSubviews: [button0, button1, button2, button3])
    }()
    
    // MARK: Line 2
    lazy var button4: UIButton = {
        configButton()
    }()
    
    lazy var button5: UIButton = {
        configButton()
    }()
    
    lazy var button6: UIButton = {
        configButton()
    }()
    
    lazy var button7: UIButton = {
        configButton()
    }()
    
    lazy var hStack1: UIStackView = {
        configStack(axis: .horizontal, arrangedSubviews: [button4, button5, button6, button7])
    }()
    
    // MARK: Line 3
    lazy var button8: UIButton = {
        configButton()
    }()
    
    lazy var button9: UIButton = {
        configButton()
    }()
    
    lazy var button10: UIButton = {
        configButton()
    }()
    
    lazy var button11: UIButton = {
        configButton()
    }()
    
    lazy var hStack2: UIStackView = {
        configStack(axis: .horizontal, arrangedSubviews: [button8, button9, button10, button11])
    }()
    
    // MARK: Line 4
    lazy var button12: UIButton = {
        configButton()
    }()
    
    lazy var button13: UIButton = {
        configButton()
    }()
    
    lazy var button14: UIButton = {
        configButton()
    }()
    
    lazy var button15: UIButton = {
        configButton()
    }()
    
    lazy var hStack3: UIStackView = {
        configStack(axis: .horizontal, arrangedSubviews: [button12, button13, button14, button15])
    }()
    
    lazy var vStack: UIStackView = {
        configStack(axis: .vertical, arrangedSubviews: [hStack0, hStack1, hStack2, hStack3])
    }()
    
    weak var delegate: BoardViewDelegate?
    
    private var cardBackColor = UIColor.systemRed
    
    private lazy var buttons: [UIButton] = [button0, button1, button2, button3,
                                            button4, button5, button6, button7,
                                            button8, button9, button10, button11,
                                            button12, button13, button14, button15]
    
    private var action: (() -> Void)?
    private var emojisShuffled = [String]()
    private var firstCard: UIButton?
    private var secondCard: UIButton?
    private var isProcessing = false
    private var card1 = 0
    private var card2 = 0
    var score = 0
    
    init(action: (() -> Void)? = nil) {
        super.init(frame: .zero)
        self.action = action
        setupView()
        emojis()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func emojis() {
        // Define categorias e suas cores
        let categories: [([String], UIColor)] = [
            (normalModeVehicles, .systemRed),
            (normalModeAnimals, .systemGreen),
            (normalModeFoods, .systemIndigo),
            (normalModeSmiles, .systemYellow)
        ]
        
        // Seleciona uma categoria aleatória
        let (selectedCategory, color) = categories.randomElement() ?? (normalModeSmiles, .red)
        
        // Define a cor de fundo dos botões de acordo com a categoria selecionada
        cardBackColor = color
        
        // Embaralha os emojis e atribui nos botões
        emojisShuffled = (selectedCategory + selectedCategory).shuffled()
        for (index, button) in buttons.enumerated() {
            button.setTitle("", for: .normal)
            button.backgroundColor = cardBackColor // Atualiza a cor de fundo dos botões
        }
        print("DEBUG: \(emojisShuffled)")
    }
    
    @objc func buttonTapped() {
        action?()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .white
        addSubviews([vStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStack.widthAnchor.constraint(equalToConstant: 350),
            vStack.widthAnchor.constraint(lessThanOrEqualTo: vStack.widthAnchor, multiplier: 0.6),
            vStack.heightAnchor.constraint(equalToConstant: 460),
        ])
    }
    
    private func configButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 3.0
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
    
    private func configStack(axis: NSLayoutConstraint.Axis, arrangedSubviews views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }
}
