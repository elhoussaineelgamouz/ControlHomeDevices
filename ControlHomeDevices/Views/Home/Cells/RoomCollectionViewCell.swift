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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with room: Room) {
        roomNameLabel.text = room.name
        //roomNumberDevicesLabel.text = "\(room.devices.count) device(s) connected"
    }

}
