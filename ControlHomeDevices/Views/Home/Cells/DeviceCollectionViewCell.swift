//
//  DeviceCollectionViewCell.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "DeviceCell"

    @IBOutlet weak var deviceIconImage: UIImageView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceNumberDevicesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with device: Device) {
        deviceNameLabel.text = device.name
    }

}
