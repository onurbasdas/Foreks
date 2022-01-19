//
//  dashboardCell.swift
//  Foreks
//
//  Created by Onur Başdaş on 18.01.2022.
//

import UIKit

class DashboardCell: UITableViewCell {
    
    static let identifier = "DashboardCell"
    static func nib() -> UINib {
        return UINib(nibName: "DashboardCell", bundle: nil)
    }
    
    @IBOutlet var statusIcon: UIImageView!
    @IBOutlet var lblCode: UILabel!
    @IBOutlet var lblClock: UILabel!
    @IBOutlet var lblFirst: UILabel!
    @IBOutlet var lblSecond: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(code: MainDefaults, data: L) {
        lblCode.text = code.cod
        lblClock.text = data.clo
        lblFirst.text = data.las
        lblSecond.text = "%\(data.pdd)"
        if data.pdd.uppercased().contains("-") == true {
            lblSecond.textColor = .systemRed
            statusIcon.image = UIImage(systemName: "chevron.down")
            statusIcon.tintColor = .systemRed
        } else {
            lblSecond.textColor = .systemGreen
            statusIcon.image = UIImage(systemName: "chevron.up")
            statusIcon.tintColor = .systemGreen
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
