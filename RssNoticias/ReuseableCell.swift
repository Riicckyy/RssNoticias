//
//  ReuseableCell.swift
//  RssNoticias
//
//  Created by Henrique Rossi on 03/08/22.
//

import Foundation
import UIKit

protocol ReusableCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension ReusableCell where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
