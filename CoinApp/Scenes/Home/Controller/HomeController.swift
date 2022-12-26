//
//  HomeController.swift
//  CoinApp
//
//  Created by Edwy Lugo on 25/12/22.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: HomeViewModelProtocol
    private let tableView = UITableView(translateMask: false).apply {
        $0.separatorStyle = .none
        $0.backgroundColor = .main
    }
    
    // MARK: - LifeCycle
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindigs()
    }
    
    // MARK: - Handler
    
    func setupBindigs() {
        viewModel.isLoading.bind { isLoading in
            if isLoading {
                CoinAppLoading.shared.show()
            } else {
                CoinAppLoading.shared.hide()
            }
        }
        
        viewModel.exchangesModelDataWithImage.bind { exchanges in
            if !exchanges.isEmpty {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - CodeView (Views and Constraints)

extension HomeController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .main
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: Identifiers.ItemTableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.exchangesModelDataWithImage.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ItemTableViewCell, for: indexPath) as? ItemTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ItemTableViewCell, for: indexPath)
            return cell
        }
        
        cell.configure(
            content: ItemTableViewCell.Configuration(
                itemExchangesView: ItemExchangesView.Configuration(
                    imageUrl: viewModel.exchangesModelDataWithImage.value[indexPath.row].icons,
                    exchangeText: TooltipLabel.Configuration(
                        captionText: viewModel.exchangesModelDataWithImage.value[indexPath.row].exchangeID,
                        textAlignment: .left,
                        textColor: .subtileLabel()
                    ),
                    nameText: CaptionLabel.Configuration(
                        captionText: "\(viewModel.exchangesModelDataWithImage.value[indexPath.row].name)",
                        textAlignment: .left,
                        textColor: .titleLabel()
                    ), valueVolumeHrsText: CaptionLabel.Configuration(
                        captionText: "$ \(viewModel.exchangesModelDataWithImage.value[indexPath.row].volume1HrsUsd)",
                        textAlignment: .left,
                        textColor: .titleLabel()
                    ), valueVolumeDayText: CaptionLabel.Configuration(
                        captionText: "$ \(viewModel.exchangesModelDataWithImage.value[indexPath.row].volume1DayUsd)",
                        textAlignment: .left,
                        textColor: .titleLabel()
                    ), valueVolumeMthText: CaptionLabel.Configuration(
                        captionText: "$ \(viewModel.exchangesModelDataWithImage.value[indexPath.row].volume1MthUsd)",
                        textAlignment: .right,
                        textColor: .titleLabel()
                    )
                )
            )
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exchange = viewModel.exchangesModelDataWithImage.value[indexPath.row]
        viewModel.shouldDetailsExchange(exchange_id: exchange.exchangeID, imageUrl: exchange.icons)
    }
}
