//
//  FeedCell.swift
//  RssNoticias
//
//  Created by Henrique Rossi on 03/08/22.
//

import UIKit

class FeedCell: UITableViewCell, ReusableCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    var item: RSSItem! {
        didSet {
            lblTitle.text = item.title
            lblDetail.text = item.description
        }
    }
}
