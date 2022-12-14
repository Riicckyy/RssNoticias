//
//  Spinner.swift
//  RssNoticias
//
//  Created by Henrique Rossi on 03/08/22.
//

import Foundation
import UIKit

final class Spinner {
    
    fileprivate static var activityIndicator: UIActivityIndicatorView?
    
    public static func start(from view: UIView) {
        
        guard Spinner.activityIndicator == nil else { return }
        
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.backgroundColor = UIColor.white
        spinner.color = .gray
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        
        addConstraints(to: view, with: spinner)
        
        Spinner.activityIndicator = spinner
        Spinner.activityIndicator?.startAnimating()
    }
    
    public static func stop() {
        Spinner.activityIndicator?.stopAnimating()
        Spinner.activityIndicator?.removeFromSuperview()
        Spinner.activityIndicator = nil
    }
    
    fileprivate static func addConstraints(to view: UIView, with spinner: UIActivityIndicatorView) {
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
