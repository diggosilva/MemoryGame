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
    }
    
    private func setNavBar() {
        title = "Jogo da Memória"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
    }

}
