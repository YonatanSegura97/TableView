//
//  CustomTableViewCell.swift
//  TableViewAndCollectionView
//
//  Created by Macbook on 11/12/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    
    @IBOutlet weak var mySecondLabel: UILabel!
    
    @IBOutlet weak var myImageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        
        mySecondLabel.numberOfLines = 0
        backgroundColor = .gray
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print(myFirstLabel.text ?? "")
    }
    
}
