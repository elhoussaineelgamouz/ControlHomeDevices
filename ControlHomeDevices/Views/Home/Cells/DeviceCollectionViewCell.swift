//
//  DeviceCollectionViewCell.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "DeviceCell"

    @IBOutlet weak var roomIconImage: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var roomNumberDevicesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with device: Device) {

    }

}
