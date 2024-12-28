//
//  DeviceDetailsFactory.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import UIKit
import Combine

protocol DeviceDetailsFactory {
    func makeModule(coordinator: DeviceDetailsViewControllerCoordinator, deviceItem: Device) -> UIViewController
}

struct DeviceDetailsFactoryImp: DeviceDetailsFactory {
    func makeModule(coordinator: DeviceDetailsViewControllerCoordinator, deviceItem: Device) -> UIViewController {
        /*let apiClientService = ApiClientServiceImp()
         guard let movieId = movieItem.id else {
         return UIViewController()
         }
         let movieDetailsRepository = MovieDetailsRepositoryImp(apiClientService: apiClientService, urlList: "\(Endpoint.baseMovieDetailsUrl.replacingOccurrences(of: "{movie_id}", with: String(movieId)))")
         let loadMovieDetailsCase = LoadMovieDetailsUseCaseImp(movieDetailsRepository: movieDetailsRepository)
         let state = PassthroughSubject<StateController, Never>()
         let movieDetailsViewModel = MovieDetailsViewModelIpm(state: state, loadMovieDetailsUseCase: loadMovieDetailsCase)
         let controller = MovieDetailsViewController(viewModel: movieDetailsViewModel)*/
        return UIViewController()
    }
}
