//
//  SplashViewController.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import UIKit
import InterfaceAdapters

class SplashScreenVC: UIViewController {
    
    // MARK: Properties
    
    private let viewModel: SplashScreenVM
    private lazy var rootView = SplashScreenView.RootView()
    
    // MARK: Lifecycle
    
    init(viewModel: SplashScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onViewDidLoad()
    }
    
}
