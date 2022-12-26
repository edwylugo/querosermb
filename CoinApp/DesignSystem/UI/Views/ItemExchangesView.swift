//
//  ItemExchangesView.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit
import Kingfisher

class ItemExchangesView: UIView {

    // MARK: - Properties
    
    private let stackView = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .vertical
    }

    private let containerView = UIView(translateMask: false).apply {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .white
    }
    
    private let iconImageView = LogoImageView(frame: .zero)
    
    private let exchangeIdLabel = TooltipLabel(translateMask: false)
    
    private let nameLabel = CaptionLabel(translateMask: false)
    
    private let volumeHrsLabel = FieldLabel(translateMask: false).apply {
        $0.text = "Hours"
    }
    
    private let valueVolumeHrsLabel = CaptionLabel(translateMask: false)
    
    private let stackViewVer = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .vertical
        $0.spacing = 4
    }
    
    private let stackViewHorTitles = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
    }
    
    private let volumeDayLabel = FieldLabel(translateMask: false).apply {
        $0.textAlignment = .left
        $0.text = "Day"
    }
        
    private let volumeMonthLabel = FieldLabel(translateMask: false).apply {
        $0.textAlignment = .right
        $0.text = "Month"
    }
    
    private let valueVolumeDayLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .left
    }

    private let valueVolumeMthLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .right
    }
    
    private let stackViewHorValues = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - CodeView

extension ItemExchangesView: CodeView {
    func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(exchangeIdLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(volumeHrsLabel)
        containerView.addSubview(valueVolumeHrsLabel)
        containerView.addSubview(stackViewVer)
        
        stackViewVer.addArrangedSubviews([stackViewHorTitles, stackViewHorValues])
        stackViewHorTitles.addArrangedSubviews([volumeDayLabel, volumeMonthLabel])
        stackViewHorValues.addArrangedSubviews([valueVolumeDayLabel, valueVolumeMthLabel])
    }
    
    func setupConstraints() {
        stackView.anchor(
            top: topAnchor,
            paddingTop: 12,
            leading: leadingAnchor,
            paddingLeft: 24,
            bottom: bottomAnchor,
            paddingBottom: 12,
            trailing: trailingAnchor,
            paddingRight: 24
        )
        
        containerView.anchor(
            top: stackView.topAnchor,
            leading: stackView.leadingAnchor,
            bottom: stackView.bottomAnchor,
            trailing: stackView.trailingAnchor
        )
        
        iconImageView.anchor(
            top: containerView.topAnchor,
            paddingTop: 16,
            leading: containerView.leadingAnchor,
            paddingLeft: 16
        )
        
        exchangeIdLabel.anchor(
            top: iconImageView.bottomAnchor,
            paddingTop: 4,
            leading: containerView.leadingAnchor,
            paddingLeft: 16,
            trailing: containerView.trailingAnchor,
            paddingRight: 16
        )
        
        nameLabel.anchor(
            top: exchangeIdLabel.bottomAnchor,
            paddingTop: 4,
            leading: containerView.leadingAnchor,
            paddingLeft: 16,
            trailing: containerView.trailingAnchor,
            paddingRight: 16
        )
        
        volumeHrsLabel.anchor(
            top: nameLabel.bottomAnchor,
            paddingTop: 16,
            leading: containerView.leadingAnchor,
            paddingLeft: 16,
            trailing: containerView.trailingAnchor,
            paddingRight: 16
        )
        
        valueVolumeHrsLabel.anchor(
            top: volumeHrsLabel.bottomAnchor,
            paddingTop: 4,
            leading: containerView.leadingAnchor,
            paddingLeft: 16,
            trailing: containerView.trailingAnchor,
            paddingRight: 16
        )
        
        stackViewVer.anchor(
            top: valueVolumeHrsLabel.bottomAnchor,
            paddingTop: 24,
            leading: containerView.leadingAnchor,
            paddingLeft: 16,
            bottom: bottomAnchor,
            paddingBottom: 24,
            trailing: containerView.trailingAnchor,
            paddingRight: 16
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}

// MARK: - Configurable

extension ItemExchangesView: Configurable {
    typealias Configuration = ItemExchangesViewContent
    
    struct ItemExchangesViewContent{
        let imageUrl: String
        let exchangeText: TooltipLabel.Configuration
        let nameText: CaptionLabel.Configuration
        let valueVolumeHrsText: CaptionLabel.Configuration
        let valueVolumeDayText: CaptionLabel.Configuration
        let valueVolumeMthText: CaptionLabel.Configuration
        
        init(imageUrl: String,
             exchangeText: TooltipLabel.Configuration,
             nameText: CaptionLabel.Configuration,
             valueVolumeHrsText: CaptionLabel.Configuration,
             valueVolumeDayText: CaptionLabel.Configuration,
             valueVolumeMthText: CaptionLabel.Configuration
        ) {
            self.imageUrl = imageUrl
            self.exchangeText = exchangeText
            self.nameText = nameText
            self.valueVolumeHrsText = valueVolumeHrsText
            self.valueVolumeDayText = valueVolumeDayText
            self.valueVolumeMthText = valueVolumeMthText
        }
    }
    
    func configure(content: ItemExchangesViewContent) {
        self.iconImageView.setDimension(width: 24, height: 24)
        
        DispatchQueue.main.async {
            let url = URL(string: content.imageUrl)
            let processor = DownsamplingImageProcessor(size: self.iconImageView.bounds.size)
                         |> RoundCornerImageProcessor(cornerRadius: 0)
            self.iconImageView.kf.indicatorType = .activity
            self.iconImageView.kf.setImage(
                with: url,
                placeholder: Images.logo.withRenderingMode(.alwaysOriginal),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(_):
                    break
                case .failure(_):
                    break
                }
            }
        }
        
        self.nameLabel.configure(content: content.nameText)
        self.exchangeIdLabel.configure(content: content.exchangeText)
        self.valueVolumeHrsLabel.configure(content: content.valueVolumeHrsText)
        self.valueVolumeDayLabel.configure(content: content.valueVolumeDayText)
        self.valueVolumeMthLabel.configure(content: content.valueVolumeMthText)
    }
}
