//
//  EventDetailsCell.swift
//  Moves
//
//  Created by Devon Adams on 7/3/19.
//  Copyright © 2019 Devon Adams. All rights reserved.
//

import UIKit

class EventDetailsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let partyTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
}
