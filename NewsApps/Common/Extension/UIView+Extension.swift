//
//  UIView+Extension.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import UIKit

extension UIView {
    public func setupSubviews(_ views: [UIView]) {
        for item in views {
            addSubview(item)
        }
    }
}
