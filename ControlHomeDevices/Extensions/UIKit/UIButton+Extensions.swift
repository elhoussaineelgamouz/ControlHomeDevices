//
//  UIButton+Extensions.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 28/12/2024.
//
import UIKit

extension UIButton {
    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
