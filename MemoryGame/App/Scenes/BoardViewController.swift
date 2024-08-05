//
//  BoardViewController.swift
//  MemoryGame
//
//  Created by Diggo Silva on 03/08/24.
//

import UIKit

class BoardViewController: UIViewController {
    
    let boardView = BoardView()
    
    override func loadView() {
        super.loadView()
        view = boardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "Veículos"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.systemRed]
    }
    
    private func setDelegatesAndDataSources() {
        boardView.selectedModeView.delegate = self
    }
    
}

extension BoardViewController: EasyBoardViewDelegate, NormalBoardViewDelegate, HardBoardViewDelegate {
    func buttonTapped() {
        print("DEBUG: Tocou nas cartas")
    }
}
