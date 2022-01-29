//
//  UIView+Layoutable.swift
//  
//
//  Created by maylee on 2022/01/29.
//

import Foundation
import UIKit

extension UIView: Layoutable {}

public extension Layoutable where Self: UIView {
    
    @discardableResult
    func callAsFunction(@LayoutBuilder _ content: () -> Layoutable) -> Layoutable {
        self
    }
    
}
