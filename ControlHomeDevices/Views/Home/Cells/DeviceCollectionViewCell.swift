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
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpViews()
    }

    func configure(with device: Device) {
        self.deviceNameLabel.text = device.name
        self.deviceIconImage.image = device.type.iconName
    }

    private func setUpViews() {
        containerView.cornerRadius(8)
    }

}
