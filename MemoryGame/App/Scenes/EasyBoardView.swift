//
//  EasyBoardView.swift
//  MemoryGame
//
//  Created by Diggo Silva on 04/08/24.
//

import UIKit

protocol EasyBoardViewDelegate: AnyObject {
    func buttonTapped()
}

class EasyBoardView: UIView {
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
    
    lazy var vStack: UIStackView = {
        configStack(axis: .vertical, arrangedSubviews: [hStack0, hStack1, hStack2])
    }()
    
    weak var delegate: BoardViewDelegate?
    
    private var action: (() -> Void)?
   
    private let cardBackColor = UIColor.systemRed
    
    private var emojisShuffled = [String]() // Array de emojis embaralhados
    
    private lazy var buttons: [UIButton] = [button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11]

    init(action: (() -> Void)? = nil) {
        super.init(frame: .zero)
        self.action = action
        setupView()
        emojis() // Inicializa os emojis
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func emojis() {
        emojisShuffled = (easyModeVehicles + easyModeVehicles).shuffled()
        for (index, button) in buttons.enumerated() {
            button.setTitle("", for: .normal)
        }
        print("DEBUG: \(emojisShuffled)")
    }
    
    @objc func buttonTapped(sender: UIButton) {
        flipCard(sender)
    }
    
    private func flipCard(_ button: UIButton) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .curveEaseInOut]

        UIView.transition(with: button, duration: 0.6, options: transitionOptions, animations: {
            if button.title(for: .normal) == "" {
                // Revela o emoji
                if let index = self.buttons.firstIndex(of: button) {
                    button.setTitle(self.emojisShuffled[index], for: .normal)
                    button.layer.borderWidth = 2
                    button.layer.borderColor = self.cardBackColor.cgColor
                    button.backgroundColor = .white
                    button.titleLabel?.font = .systemFont(ofSize: 40)
                }
            } else {
                // Oculta o emoji mostrando o verso da carta
                button.setTitle("", for: .normal)
                button.backgroundColor = .systemRed
            }
        }, completion: nil)
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
            vStack.heightAnchor.constraint(equalToConstant: 340),
        ])
    }
    
    private func configButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = cardBackColor // Define a cor sólida como fundo
        button.setTitle("", for: .normal) // Inicialmente define o título como vazio
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 3.0
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
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
