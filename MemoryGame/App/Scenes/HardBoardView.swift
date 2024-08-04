//
//  HardBoardView.swift
//  MemoryGame
//
//  Created by Diggo Silva on 04/08/24.
//

import UIKit

class HardBoardView: UIView {
    // MARK: Line 1
    lazy var button0: UIButton = {
        createButton()
    }()
    
    lazy var button1: UIButton = {
        createButton()
    }()
    
    lazy var button2: UIButton = {
        createButton()
    }()
    
    lazy var button3: UIButton = {
        createButton()
    }()
    
    lazy var hStack0: UIStackView = {
        createStack(axis: .horizontal, arrangedSubviews: [button0, button1, button2, button3])
    }()
    
    // MARK: Line 2
    lazy var button4: UIButton = {
        createButton()
    }()
    
    lazy var button5: UIButton = {
        createButton()
    }()
    
    lazy var button6: UIButton = {
        createButton()
    }()
    
    lazy var button7: UIButton = {
        createButton()
    }()
    
    lazy var hStack1: UIStackView = {
        createStack(axis: .horizontal, arrangedSubviews: [button4, button5, button6, button7])
    }()
    
    // MARK: Line 3
    lazy var button8: UIButton = {
        createButton()
    }()
    
    lazy var button9: UIButton = {
        createButton()
    }()
    
    lazy var button10: UIButton = {
        createButton()
    }()
    
    lazy var button11: UIButton = {
        createButton()
    }()
    
    lazy var hStack2: UIStackView = {
        createStack(axis: .horizontal, arrangedSubviews: [button8, button9, button10, button11])
    }()
    
    // MARK: Line 4
    lazy var button12: UIButton = {
        createButton()
    }()
    
    lazy var button13: UIButton = {
        createButton()
    }()
    
    lazy var button14: UIButton = {
        createButton()
    }()
    
    lazy var button15: UIButton = {
        createButton()
    }()
    
    lazy var hStack3: UIStackView = {
        createStack(axis: .horizontal, arrangedSubviews: [button12, button13, button14, button15])
    }()
    
    // MARK: Line 5
    lazy var button16: UIButton = {
        createButton()
    }()
    
    lazy var button17: UIButton = {
        createButton()
    }()
    
    lazy var button18: UIButton = {
        createButton()
    }()
    
    lazy var button19: UIButton = {
        createButton()
    }()
    
    lazy var hStack4: UIStackView = {
        createStack(axis: .horizontal, arrangedSubviews: [button16, button17, button18, button19])
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hStack0, hStack1, hStack2, hStack3, hStack4])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 3.0
        return button
    }
    
    private func createStack(axis: NSLayoutConstraint.Axis, arrangedSubviews views: [UIView]) -> UIStackView {
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
        addSubviews([vStack])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStack.widthAnchor.constraint(equalToConstant: 350),
            vStack.widthAnchor.constraint(lessThanOrEqualTo: vStack.widthAnchor, multiplier: 0.6),
            vStack.heightAnchor.constraint(equalToConstant: 580),
        ])
    }
}
