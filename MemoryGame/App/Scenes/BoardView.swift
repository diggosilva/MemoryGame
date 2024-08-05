//
//  BoardView.swift
//  MemoryGame
//
//  Created by Diggo Silva on 03/08/24.
//

import UIKit

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
            boardView = EasyBoardView()
        case .normal:
            boardView = NormalBoardView()
        case .hard:
            boardView = HardBoardView()
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



//class BoardView: UIView {
//    lazy var scoreLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Score: 0"
//        label.textAlignment = .center
//        label.textColor = .systemRed
//        label.font = .preferredFont(forTextStyle: .subheadline)
//        return label
//    }()
//    
//    lazy var selectedModeView: NormalBoardView = {
//        let view = NormalBoardView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
////    // MARK: Line 1
//    lazy var button0: UIButton = {
//        configButton()
//    }()
//
//    lazy var button1: UIButton = {
//        configButton()
//    }()
//
//    lazy var button2: UIButton = {
//        configButton()
//    }()
//
//    lazy var button3: UIButton = {
//        configButton()
//    }()
//
//    lazy var hStack0: UIStackView = {
//        configStack(axis: .horizontal, arrangedSubviews: [button0, button1, button2, button3])
//    }()
//
//    // MARK: Line 2
//    lazy var button4: UIButton = {
//        configButton()
//    }()
//
//    lazy var button5: UIButton = {
//        configButton()
//    }()
//
//    lazy var button6: UIButton = {
//        configButton()
//    }()
//
//    lazy var button7: UIButton = {
//        configButton()
//    }()
//
//    lazy var hStack1: UIStackView = {
//        configStack(axis: .horizontal, arrangedSubviews: [button4, button5, button6, button7])
//    }()
//
//    // MARK: Line 3
//    lazy var button8: UIButton = {
//        configButton()
//    }()
//
//    lazy var button9: UIButton = {
//        configButton()
//    }()
//
//    lazy var button10: UIButton = {
//        configButton()
//    }()
//
//    lazy var button11: UIButton = {
//        configButton()
//    }()
//
//    lazy var hStack2: UIStackView = {
//        configStack(axis: .horizontal, arrangedSubviews: [button8, button9, button10, button11])
//    }()
//
//    lazy var vStack: UIStackView = {
//        configStack(axis: .vertical, arrangedSubviews: [hStack0, hStack1, hStack2])
//    }()
//    
//    lazy var newGameButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Começar Novo Jogo", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .systemPink
//        button.layer.cornerRadius = 20
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        return button
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc func didTapButton() {
//        print("DEBUG: Apertou Começar Novo Jogo")
//    }
//    
//    private func configButton() -> UIButton {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemRed
//        button.layer.cornerRadius = 10
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
//        button.layer.shadowOpacity = 0.3
//        button.layer.shadowRadius = 3.0
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        return button
//    }
//    
//    @objc func buttonTapped() {
//        print("DEBUG: Clicou no botão 0")
//        UIView.transition(with: self.button0, duration: 0.5, options: .transitionFlipFromRight) {
//            self.button0.setTitle("👀", for: .normal)
//            self.button0.titleLabel?.font = .boldSystemFont(ofSize: 40)
//            self.button0.backgroundColor = .white
//            self.button0.layer.borderWidth = 2
//            self.button0.layer.borderColor = UIColor.systemRed.cgColor
//        }
//    }
//    
//    private func configStack(axis: NSLayoutConstraint.Axis, arrangedSubviews views: [UIView]) -> UIStackView {
//        let stack = UIStackView(arrangedSubviews: views)
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = axis
//        stack.spacing = 20
//        stack.distribution = .fillEqually
//        return stack
//    }
//    
//    private func setupView() {
//        setHierarchy()
//        setConstraints()
//    }
//    
//    private func setHierarchy () {
//        backgroundColor = .white
//        addSubviews([scoreLabel, vStack, newGameButton])
//    }
//    
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//            scoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            
//            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
//            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
//            vStack.widthAnchor.constraint(equalToConstant: 350),
//            vStack.widthAnchor.constraint(lessThanOrEqualTo: vStack.widthAnchor, multiplier: 0.6),
//            vStack.heightAnchor.constraint(equalToConstant: 340),
//            
//            newGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            newGameButton.widthAnchor.constraint(equalToConstant: 250),
//            newGameButton.widthAnchor.constraint(lessThanOrEqualTo: newGameButton.widthAnchor, multiplier: 0.6),
//            newGameButton.heightAnchor.constraint(equalToConstant: 40),
//        ])
//    }
//}
