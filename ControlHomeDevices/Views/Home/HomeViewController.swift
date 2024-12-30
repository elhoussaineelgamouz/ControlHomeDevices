//
//  HomeViewController.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Combine


protocol HomeFactoryControllerCoordinator: AnyObject {
    func didSelectItemRoomCell(roomItem: Room)
    func didSelectItemDeviceCell(deviceItem: Device)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var smartLamHomeImage: UIImageView!
    @IBOutlet weak var roomsCollectionView: UICollectionView!
    @IBOutlet weak var devicesCollectionView: UICollectionView!

    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private var viewModel: HomeViewModel?


    init(viewModel: HomeViewModel, coordinator: HomeFactoryControllerCoordinator) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindCollectionsView()
    }


    private func setupViews() {
        self.devicesCollectionView.register(UINib(nibName: "DeviceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DeviceCollectionViewCell.reuseIdentifier)

        self.roomsCollectionView.register(UINib(nibName: "RoomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RoomCollectionViewCell.reuseIdentifier)


        let customLayout = UICollectionViewFlowLayout()
        customLayout.minimumLineSpacing = 10
        customLayout.minimumInteritemSpacing = 10
        customLayout.scrollDirection = .horizontal
        self.roomsCollectionView.collectionViewLayout = customLayout
        self.devicesCollectionView.collectionViewLayout = customLayout

        self.smartLamHomeImage.image = .smartLamp
        self.view.backgroundColor = .background
    }

    private func bindCollectionsView() {

        viewModel?.rooms
            .bind(to: roomsCollectionView.rx.items(cellIdentifier: RoomCollectionViewCell.reuseIdentifier, cellType: RoomCollectionViewCell.self)) { index, room, cell in
                cell.configure(with: room)
            }
            .disposed(by: disposeBag)

        viewModel?.devices
            .bind(to: devicesCollectionView.rx.items(cellIdentifier: DeviceCollectionViewCell.reuseIdentifier, cellType: DeviceCollectionViewCell.self)) { index, device, cell in
                cell.configure(with: device)
            }
            .disposed(by: disposeBag)

        // Handle selection events
        roomsCollectionView.rx.modelSelected(Room.self)
            .subscribe(onNext: { room in
                self.viewModel?.showRoomDetails(roomItem: room)
            })
            .disposed(by: disposeBag)

        devicesCollectionView.rx.modelSelected(Device.self)
            .subscribe(onNext: { device in
                self.viewModel?.showDeviceDetails(deviceItem: device)
            })
            .disposed(by: disposeBag)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeightWidth = collectionView.frame.height
        return CGSize(width: cellHeightWidth, height: cellHeightWidth)
    }
}
