//
//  Extensions.swift
//  MemoryGame
//
//  Created by Diggo Silva on 03/08/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach({ addSubview($0.self) })
    }
}

// Veículos
let easyModeVehicles: [String] =   ["🚗", "🚕", "🚙", "🚐", "🚓", "🚑"]
let normalModeVehicles: [String] = ["🚗", "🚕", "🚙", "🚐", "🚓", "🚑", "🚘", "🚚"]
let hardModeVehicles: [String] =   ["🚗", "🚕", "🚙", "🚐", "🚓", "🚑", "🚘", "🚚", "🚜", "🚛"]

// Animais
let easyModeAnimals: [String] =   ["🐶", "🐸", "🐭", "🐹", "🐰", "🦊"]
let normalModeAnimals: [String] = ["🐶", "🐸", "🐭", "🐹", "🐰", "🦊", "🐻", "🦁"]
let hardModeAnimals: [String] =   ["🐶", "🐸", "🐭", "🐹", "🐰", "🦊", "🐻", "🦁", "🐨", "🐯"]

// Comidas
let easyModeFoods: [String] =   ["🍎", "🍌", "🍉", "🍇", "🍓", "🍑"]
let normalModeFoods: [String] = ["🍎", "🍌", "🍉", "🍇", "🍓", "🍑", "🍍", "🍒"]
let hardModeFoods: [String] =   ["🍎", "🍌", "🍉", "🍇", "🍓", "🍑", "🍍", "🍒", "🥭", "🍋"]

// Smiles
let easyModeSmiles: [String] =   ["😊", "😂", "😍", "😎", "😢", "😡"]
let normalModeSmiles: [String] = ["😊", "😂", "😍", "😎", "😢", "😡", "😜", "😴"]
let hardModeSmiles: [String] =   ["😊", "😂", "😍", "😎", "😢", "😡", "😜", "😴", "😈", "🥳"]
