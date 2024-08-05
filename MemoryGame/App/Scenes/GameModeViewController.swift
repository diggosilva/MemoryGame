//
//  GameModeViewController.swift
//  MemoryGame
//
//  Created by Diggo Silva on 02/08/24.
//

import UIKit

class GameModeViewController: UIViewController {
    
    let gameModeView = GameModeView()
    
    override func loadView() {
        super.loadView()
        view = gameModeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "Jogo da Memória"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
    }
    
    private func setDelegatesAndDataSources() {
        gameModeView.delegate = self
    }
    
}

extension GameModeViewController: GameModeViewDelegate {
    func easyButtonTapped() {
        let boardVC = BoardViewController()
        boardVC.boardView.difficult = .easy
        navigationController?.pushViewController(boardVC, animated: true)
    }
    
    func normalButtonTapped() {
        let boardVC = BoardViewController()
        boardVC.boardView.difficult = .normal
        navigationController?.pushViewController(boardVC, animated: true)
    }
    
    func hardButtonTapped() {
        let boardVC = BoardViewController()
        boardVC.boardView.difficult = .hard
        navigationController?.pushViewController(boardVC, animated: true)
    }
}
