//
//  ViewController.swift
//  newXibView
//
//  Created by Egor Devyatov on 29.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var xibView: XibView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // выведем все параметры экрана нашего устройства
        // printSafeAreaInsets()
        printAllScreenParameters()
        // каждый поворот экрана будет происходить выяснение TraitCollection какое положение девайс
        printTraitCollection()
    }
    
    
//    private func printSafeAreaInsets() {
//        let bottom = view.safeAreaInsets.bottom
//        let left = view.safeAreaInsets.left
//        let right = view.safeAreaInsets.right
//        let top = view.safeAreaInsets.top
//
//        print("Safe area Верх = \(top)")
//        print("Safe area Низ = \(bottom)")
//        print("Safe area Слева = \(left)")
//        print("Safe area Справа = \(right)")
//
//    }
    
    private func printAllScreenParameters() {
        let height = UIScreen.main.bounds.size.height
        let scale = UIScreen.main.scale
        let aspectRatio = UIScreen.main.currentMode?.pixelAspectRatio
        let size = UIScreen.main.currentMode?.size

        print("Высота UIScreen = \(height)")
        print("Текущий режим(Aspect Ratio): \(String(describing: aspectRatio))")
        print("Size = \(String(describing: size))")
        print("Scale factor = \(scale)")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        printTraitCollection()
    }
}

