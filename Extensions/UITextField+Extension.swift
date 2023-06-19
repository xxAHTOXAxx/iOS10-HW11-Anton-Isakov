//
//  Extensions.swift
//  iOS10-HW11-Anton Isakov
//
//  Created by Антон Исаков on 19.06.2023.
//

import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 6, width: 20, height: 20))
        iconView.image = image
        let iconContanerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 56, height: 30))
        iconContanerView.addSubview(iconView)
        leftView = iconContanerView
        leftViewMode = .always
    }
}
