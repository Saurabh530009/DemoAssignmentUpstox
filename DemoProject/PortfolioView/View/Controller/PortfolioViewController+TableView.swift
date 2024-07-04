//
//  ViewController+TableView.swift
//  DemoProject
//
//  Created by Saurabh  Verma on 11/06/24.
//

import UIKit

// MARK: - Setup TableView
extension PortfolioViewController {
    func setupTableView() {
        self.view.addSubview(tableView)
        // Setup constraints for tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: seperatorLineView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45)
        ])
        // Configure separator insets to start from the left edge
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.separatorColor = .lightGray
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cellName: UserHoldingTableViewCell.className())
    }
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension PortfolioViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getUserHoldingTableIVewCell(tableView: tableView, cellForRowAt: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
extension PortfolioViewController {
    private func getUserHoldingTableIVewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserHoldingTableViewCell.className(), for: indexPath) as? UserHoldingTableViewCell else { return UITableViewCell() }
        let cellData = viewModel.getCellData(forIndex: indexPath.row)
        cell.setupData(cellData: cellData)
        return cell
    }
}
