//
//  HomeFactory.swift
//  ControlHomeDevices
//
//  Created by El houssaine El GAMOUZ on 27/12/2024.
//

import Combine
import UIKit

protocol HomeFactory {
    func makeModel(coordinator: HomeFactoryControllerCoordinator) -> UIViewController
    func makeRoomDetailsCoordinator(
        navigation: UINavigationController,
        roomItem: Room) -> Coordinator
    func makeDeviceDetailsCoordinator(
        navigation: UINavigationController,
        deviceItem: Device) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
    func makeRoomDetailsCoordinator(navigation: UINavigationController, roomItem: Room) -> Coordinator {
        let roomDetailsFactory = RoomDetailsFactoryImp()
        let roomdetailsCoordinator = RoomDetailsCoordinator(navigation: navigation, roomDetailsFactory: roomDetailsFactory, roomItem: roomItem)
        return roomdetailsCoordinator
    }

    func makeDeviceDetailsCoordinator(navigation: UINavigationController, deviceItem: Device) -> Coordinator {
        let deviceDetailsFactory = DeviceDetailsFactoryImp()
        let devicedetailsCoordinator = DeviceDetailsCoordinator(navigation: navigation, deviceDetailsFactory: deviceDetailsFactory, deviceItem: deviceItem)
        return devicedetailsCoordinator
    }

    func makeModel(coordinator: HomeFactoryControllerCoordinator) -> UIViewController {
        /* let apiClientService = ApiClientServiceImp()
         let moviesListRepository = MoviesListRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
         let loadMoviesListCase = homeListUseCaseImp(moviesListRepository: moviesListRepository)
         let state = PassthroughSubject<StateController, Never>()
         let homeViewModel = HomeViewModelIpm(state: state, loadMoviesListUseCase: loadMoviesListCase)
         // let moviesListController = MoviesListViewController(viewModel: moviesListViewModel, coordinator: coordinator)
         moviesListController.title = AppLocalized.appName
         return moviesListController*/
        let homeViewModel = HomeViewModel(coordinator: coordinator)
        let HomeViewVC = HomeViewController(viewModel: homeViewModel, coordinator: coordinator)
        return HomeViewVC
    }

    /*func makeMovieDetailsCoordinator(navigation: UINavigationController, movieItem: MovieItem) -> Coordinator {
     let movieDetailsFactory = MovieDetailsFactoryImp()
     let moviedetailsCoordinator = MovieDetailsCoordinator(navigation: navigation, movieDetailsFactory: movieDetailsFactory, movieItem: movieItem)
     return moviedetailsCoordinator
     }*/
}
