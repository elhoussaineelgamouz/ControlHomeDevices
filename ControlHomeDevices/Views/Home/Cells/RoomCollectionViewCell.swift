//
//  RoomCollectionViewCell.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "RoomCell"

    @IBOutlet weak var roomIconImage: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var roomNumberDevicesLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpViews()
    }

    func configure(with room: Room) {
        self.roomNameLabel.text = room.name
        self.roomIconImage.image = room.type.iconName
        self.roomNumberDevicesLabel.text = " 3 Devices"
    }

    private func setUpViews() {
        self.containerView.cornerRadius(8)
    }

}
