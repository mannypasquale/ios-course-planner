//
//  CourseItemTableViewCell.swift
//  ProjectSkelton2
//
//  Created by Manny Pasquale on 2018-02-28.
//  Copyright © 2018 Manny Pasquale. All rights reserved.
//

import UIKit

class CourseItemTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var courseID: UILabel!
    @IBOutlet weak var courseNameStaticLabel: UILabel!
    @IBOutlet weak var courseIDStaticLabel: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
