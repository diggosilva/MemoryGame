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
   
    private let cardBackColor = UIColor.systemRed
    
    private lazy var buttons: [UIButton] = [button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11]
    
    private var action: (() -> Void)?
    private var emojisShuffled = [String]()
    private var firstCard: UIButton?
    private var secondCard: UIButton?
    private var isProcessing = false
    private var matchs = 0
    private var card1 = 0
    private var card2 = 0

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
        emojisShuffled = (easyModeVehicles + easyModeVehicles).shuffled()
        for (index, button) in buttons.enumerated() {
            button.setTitle("", for: .normal)
        }
        print("DEBUG: \(emojisShuffled)")
    }
    
    @objc func buttonTapped(sender: UIButton) {
        guard !isProcessing, let index = buttons.firstIndex(of: sender) else { return }
        
        if sender.isEnabled {
            flipCard(sender, index: index)
        }
    }

    private func flipCard(_ button: UIButton, index: Int) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .curveEaseInOut]
        
        UIView.transition(with: button, duration: 0.6, options: transitionOptions, animations: {
            if button.title(for: .normal) == "" {
                // Revela o emoji
                button.setTitle(self.emojisShuffled[index], for: .normal)
                button.layer.borderWidth = 2
                button.layer.borderColor = self.cardBackColor.cgColor
                button.backgroundColor = .white
                button.titleLabel?.font = .systemFont(ofSize: 40)
                
                if self.firstCard == nil {
                    self.firstCard = button
                    self.card1 = index
                } else {
                    self.secondCard = button
                    self.card2 = index
                    self.isProcessing = true
                    self.compareMatch()
                }
            }
        }, completion: nil)
    }
    
    private func compareMatch() {
          if emojisShuffled[card1] == emojisShuffled[card2] {
              // Se as cartas são iguais, faz um zoom in e zoom out, e depois um fade out
              UIView.animate(withDuration: 0.2, animations: {
                  // Zoom In
                  self.firstCard?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                  self.secondCard?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
              }, completion: { _ in
                  UIView.animate(withDuration: 0.2, animations: {
                      // Zoom Out
                      self.firstCard?.transform = CGAffineTransform.identity
                      self.secondCard?.transform = CGAffineTransform.identity
                  }, completion: { _ in
                      UIView.animate(withDuration: 0.2, animations: {
                          // Fade Out
                          self.firstCard?.alpha = 0.0
                          self.secondCard?.alpha = 0.0
                      }, completion: { _ in
                          // Após o fade out, desabilita os botões e limpa o estado
                          self.matchs += 1
                          self.firstCard?.isEnabled = false
                          self.secondCard?.isEnabled = false
//                          self.resetCards()
                          print("DEBUG: É igual")
                      })
                  })
              })
          } else {
              // Se as cartas não são iguais, faz a virada das cartas de volta
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//                  self.flipBackCard()
                  print("DEBUG: NÃO é igual")
              }
          }
      }
    
    private func resetCards() {
        self.firstCard = nil
        self.secondCard = nil
        self.isProcessing = false
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
        button.backgroundColor = cardBackColor
        button.setTitle("", for: .normal)
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
