//
//  MainTableViewController.swift
//  CurrencyAppTableView
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit
import TinyConstraints

protocol MainTableViewProtocol: AnyObject {
    
    func updateView(with items: [Main])
    func reloadData()
    
}

class MainTableViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MainTableViewPresenterProtocol!
    
    private let errorView: ErrorView = {
        let errorView = ErrorView()
        errorView.isHidden = true
        
        return errorView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.estimatedSectionHeaderHeight = 64.0
        tableView.contentInset = .init(top: 16.0, left: 0.0, bottom: 24.0, right: 0.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self)
        tableView.register(MainTableHeaderView.self, forHeaderFooterViewReuseIdentifier: MainTableHeaderView.reuseId)
        tableView.isHidden = true
        
        return tableView
    }()
    
    private var items: [Main] = []
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        embedSubviews()
        setSubviewsConstraints()
        
        errorView.reloadButtonDidTap = { [weak self] in
            self?.presenter.fetchData()
        }
        
        presenter.viewDidLoad()
    }

}

//MARK: - Protocol Methods

extension MainTableViewController: MainTableViewProtocol {
    
    func updateView(with items: [Main]) {
        self.items = items
        
        DispatchQueue.main.async {
            self.tableView.isHidden = items.isEmpty
            self.errorView.isHidden = !items.isEmpty
            self.reloadData()
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

//MARK: - TableView DataSource Methods

extension MainTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let item = items[indexPath.row]
        cell.configure(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainTableHeaderView.reuseId) as? MainTableHeaderView else {
            return nil
        }
                
        let date = items.first?.date
        
        if let date = date {
            view.configure(date: date)
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - Private Methods

extension MainTableViewController {
    
    private func embedSubviews() {
        view.addSubview(tableView)
    }
    
    private func setSubviewsConstraints() {
        tableView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        tableView.bottomToSuperview()
    }
    
}
