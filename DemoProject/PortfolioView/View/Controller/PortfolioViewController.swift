//
//  PortfolioViewController.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 10/06/24.
//

import UIKit

class PortfolioViewController: UIViewController {
    let customNavView = PortfolioNavView()
    let segmentedControl = PortfolioSegmentedControl()
    let seperatorLineView = UIView()
    let tableView = UITableView()
    let profitLossBottomView = ProfitLossBottomView()
    let investmentDetailsView = InvestmentDetailsView()
    var activityIndicator: UIActivityIndicatorView?
    
    lazy var viewModel = PortfolioViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavView()
        setupTopSafeArea()
        setupSegmentedControl()
        setupSeperatorView()
        setupTableView()
        setupProfitLossBottomView()
        setupBottomSafeArea()
        setupActivityIndicator()
        startActivityIndicator()
        viewModel.fetchData { [weak self] in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                stopActivityIndicator()
                updateSubViewsData()
            }
        }
    }
    private func setupNavView() {
        view.addSubview(customNavView)
        customNavView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints for the custom navigation view
        NSLayoutConstraint.activate([
            customNavView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Configure the custom navigation view
        customNavView.setProfileBtn(UIImage(systemName: "person.circle"), target: self, action: #selector(leftButtonTapped))
        customNavView.setTitle("Portfolio")
        customNavView.setSearchBtn(UIImage(systemName: "magnifyingglass"), target: self, action: #selector(rightButton1Tapped))
        customNavView.setArrowBtn(UIImage(systemName: "arrow.up.arrow.down"), target: self, action: #selector(rightButton2Tapped))
    }
    
    @objc private func leftButtonTapped() {
        // Handle left button tap
        debugPrint("Left button tapped")
    }
    
    @objc private func rightButton1Tapped() {
        // Handle right button 1 tap
        debugPrint("Right button 1 tapped")
    }
    
    @objc private func rightButton2Tapped() {
        // Handle right button 2 tap
        debugPrint("Right button 2 tapped")
    }
}
// MARK: - Setup Top SafeArea
extension PortfolioViewController {
    private func setupTopSafeArea() {
        /// Set the background color of the safe area above the custom navigation view
        let topSafeAreaView = UIView()
        topSafeAreaView.translatesAutoresizingMaskIntoConstraints = false
        topSafeAreaView.backgroundColor = .blue
        view.addSubview(topSafeAreaView)
        
        NSLayoutConstraint.activate([
            topSafeAreaView.topAnchor.constraint(equalTo: view.topAnchor),
            topSafeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSafeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSafeAreaView.bottomAnchor.constraint(equalTo: customNavView.topAnchor)
        ])
    }
}
// MARK: - Setup Bottom SafeArea
extension PortfolioViewController {
    private func setupBottomSafeArea() {
        /// Add bottom safe area view
        let bottomSafeAreaView = UIView()
        bottomSafeAreaView.translatesAutoresizingMaskIntoConstraints = false
        bottomSafeAreaView.backgroundColor = UIColor(hexString: "#EAECEF")
        view.addSubview(bottomSafeAreaView)
        
        NSLayoutConstraint.activate([
            bottomSafeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSafeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSafeAreaView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSafeAreaView.topAnchor.constraint(equalTo: profitLossBottomView.bottomAnchor)
        ])
    }
}
// MARK: - setup Segment Control
extension PortfolioViewController {
    private func setupSegmentedControl() {
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints for the custom segmented control
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: customNavView.bottomAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        segmentedControl.setLeftBtnTitle(title: "POSITIONS")
        segmentedControl.setRightBtnTitle(title: "HOLDINGS")
        segmentedControl.delegate = self
        segmentedControl.backgroundColor = .clear
    }
}
// MARK: - CustomSegmentedControlDelegate
extension PortfolioViewController: PortfolioSegmentedControlDelegate {
    func didChangeSegment(to index: Int) {
        switch index {
        case 0:
            print("First segment selected")
        case 1:
            print("Second segment selected")
        default:
            break
        }
    }
}
// MARK: - Setup seperator view
extension PortfolioViewController {
    private func setupSeperatorView() {
        // Configure the line view
        seperatorLineView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the line view as a subview of the segmented control view
        segmentedControl.addSubview(seperatorLineView)
        
        // Add constraints to position the line view below the segmented control
        NSLayoutConstraint.activate([
            seperatorLineView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            seperatorLineView.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor),
            seperatorLineView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor),
            seperatorLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        seperatorLineView.backgroundColor = UIColor.gray
    }
}

// MARK: - Setup BottomView
extension PortfolioViewController {
    private func setupProfitLossBottomView() {
        view.addSubview(profitLossBottomView)
        view.addSubview(investmentDetailsView)
        
        profitLossBottomView.translatesAutoresizingMaskIntoConstraints = false
        investmentDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        profitLossBottomView.backgroundColor = UIColor(hexString: "#EAECEF")
        profitLossBottomView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
        
        
        investmentDetailsView.backgroundColor = UIColor(hexString: "#EAECEF")
        investmentDetailsView.alpha = 0
        investmentDetailsView.layer.borderColor = UIColor(hexString: "#989DA5")?.cgColor
        investmentDetailsView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
        
        // Constraints for ProfitLossBottomView
        NSLayoutConstraint.activate([
            profitLossBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profitLossBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profitLossBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profitLossBottomView.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        // Constraints for LabelContainerView
        NSLayoutConstraint.activate([
            investmentDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            investmentDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            investmentDetailsView.bottomAnchor.constraint(equalTo: profitLossBottomView.topAnchor),
            investmentDetailsView.heightAnchor.constraint(equalToConstant: 115)
        ])
        
        // Add target to button in bottom view
        profitLossBottomView.chevronBtn.addTarget(self, action: #selector(profitLossBottomButtonTapped), for: .touchUpInside)
    }
    
    @objc private func profitLossBottomButtonTapped() {
        viewModel.chevronBtnTapped.toggle()
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self else { return }
            self.investmentDetailsView.alpha = self.viewModel.chevronBtnTapped ? 1 : 0
            self.handleProfitLossViewRadius()
            self.view.layoutIfNeeded()
        }
    }
    func handleProfitLossViewRadius() {
        profitLossBottomView.roundCorners(corners: [.topLeft, .topRight], radius: viewModel.chevronBtnTapped ? 0 : 8)
    }
}
