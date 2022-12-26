//
//  ItemTableViewCell.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    // MARK:  - Private Properties
    
    private var itemExchangesView = ItemExchangesView(translateMask: false)
    
    // MARK:  - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: Configurable -> CodeView

extension ItemTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(itemExchangesView)
    }
    
    func setupConstraints() {
        itemExchangesView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .main
    }
}

// MARK: Configurable -> Populate Data ViewModel

extension ItemTableViewCell: Configurable {
    typealias Configuration = ItemTableViewCellContent
    
    struct ItemTableViewCellContent {
        let itemExchangesView: ItemExchangesView.Configuration
        
        init(
            itemExchangesView: ItemExchangesView.Configuration
        ) {
            self.itemExchangesView = itemExchangesView
        }
    }
    
    func configure(content: ItemTableViewCellContent) {
        itemExchangesView.configure(content: content.itemExchangesView)
    }
}
