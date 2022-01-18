//
//  dashboardCell.swift
//  Foreks
//
//  Created by Onur Başdaş on 18.01.2022.
//

import UIKit

class dashboardCell: UITableViewCell {
    
    static let identifier = "dashboardCell"
    static func nib() -> UINib {
        return UINib(nibName: "dashboardCell", bundle: nil)
    }
    
    @IBOutlet var lblCod: UILabel!
    @IBOutlet var lblGro: UILabel!
    @IBOutlet var lblTke: UILabel!
    @IBOutlet var lblDef: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
