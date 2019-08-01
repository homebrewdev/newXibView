//
//  Traits.swift
//  newXibView
//
//  Created by Egor Devyatov on 01.08.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

let traitCollection = UITraitCollection()

// функция выявления SizeClass
func sizeClassText(sizeClass: UIUserInterfaceSizeClass) -> String {
    switch sizeClass{
    case .compact:
        return "Compact"
    case .regular:
        return "Regular"
    default:
        return "Unspecified"
    }
}

// функция выявления Device
func deviceText(deviceType: UIUserInterfaceIdiom ) -> String {
    switch deviceType{
    case .phone:
        return "iPhone"
    case .pad:
        return "iPad"
    case .carPlay:
        return "Car Play" // у нас в ЦВТ точно пока таких девайсов нет ) но все же
    case .tv:
        return "Apple TV"
    default:
        return "Unspecified"
    }
}

// выводим в консоль все
func printTraitCollection() {
    
    print("Device: " + deviceText(deviceType: traitCollection.userInterfaceIdiom))
    print("Height: " + sizeClassText(sizeClass: traitCollection.verticalSizeClass))
    print("Width: " + sizeClassText(sizeClass: traitCollection.horizontalSizeClass))
}

