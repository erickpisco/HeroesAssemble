//
//  HeroCell.swift
//  HeroesAssemble
//
//  Created by erick pisco on 17/05/19.
//  Copyright © 2019 erick pisco. All rights reserved.
//

import UIKit
import Kingfisher

class HeroCell: UITableViewCell {
    
    @IBOutlet weak var heroThambnail: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepareCell(with hero: Hero) {
        
        if let url = URL(string: hero.thumbnail.urlcomplete) {
            
        } else {
            
        }
    }

}
