//
//  RouterScreenProtocol.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

protocol RouterScreenProtocol: RouterNavigationViewScreenProtocol & RouterNavigationStackScreenProtocol & RouterSheetScreenProtocol {
    var routeType: RouterScreenPresentationType { get }
}

enum RouterScreenPresentationType {
    case sheet
    case fullScreenCover
    case navigationLink
    
    case navigationDestination
}

