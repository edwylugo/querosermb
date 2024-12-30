//
//  DetailsViewController.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel: DetailsViewModelProtocol
    
    private let backButton = BackButton(translateMask: false).apply {
        $0.isHidden = true
    }
    
    private let stackView = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .vertical
        $0.spacing = 16
    }
    
    private let iconImageView = UIImageView(frame: .zero)
    
    let exchangeLabel = H6Label(translateMask: false).apply {
        $0.isHidden = true
    }
    
    let nameLabel = BodyOneLabel(translateMask: false).apply {
        $0.isHidden = true
    }
    
    private let volumeHrsLabel = SubtitleTwoLabel(translateMask: false).apply {
        $0.isHidden = true
        $0.text = "Hours"
    }
    
    private let valueVolumeHrsLabel = CaptionLabel(translateMask: false).apply {
        $0.isHidden = true
    }
    
    private let stackViewVer = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    private let stackViewHorTitles = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
    }
    
    private let volumeDayLabel = SubtitleTwoLabel(translateMask: false).apply {
        $0.textAlignment = .left
        $0.text = "Day"
        $0.isHidden = true
    }
        
    private let volumeMonthLabel = SubtitleTwoLabel(translateMask: false).apply {
        $0.textAlignment = .right
        $0.text = "Month"
        $0.isHidden = true
    }
    
    private let stackViewHorValues = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let valueVolumeDayLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .left
        $0.isHidden = true
    }

    private let valueVolumeMthLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .right
        $0.isHidden = true
    }
    
    private let stackViewHorData = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
    }
    
    private let dataStartLabel = SubtitleTwoLabel(translateMask: false).apply {
        $0.textAlignment = .left
        $0.text = "Start Date"
        $0.isHidden = true
    }
        
    private let dataEndLabel = SubtitleTwoLabel(translateMask: false).apply {
        $0.textAlignment = .right
        $0.text = "End Date"
        $0.isHidden = true
    }
    
    private let stackViewHorValuesData = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let valueDataStartLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .left
        $0.isHidden = true
    }

    private let valueDataEndLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .right
        $0.isHidden = true
    }
    
    private let stackViewHorQuota = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
    }
    
    private let dataQuoteStartLabel = SubtitleTwoLabel(translateMask: false).apply {
        $0.textAlignment = .left
        $0.text = "Start Date Quote"
        $0.isHidden = true
    }
        
    private let dataQuoteEndLabel = SubtitleTwoLabel(translateMask: false).apply {
        $0.textAlignment = .right
        $0.text = "End Date Quote"
        $0.isHidden = true
    }
    
    private let stackViewHorValuesQuote = UIStackView(translateMask: false).apply {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let valueDataQuoteStartLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .left
        $0.isHidden = true
    }

    private let valueDataQuoteEndLabel = CaptionLabel(translateMask: false).apply {
        $0.textAlignment = .right
        $0.isHidden = true
    }

    // MARK: - LifeCycle
    
    init(viewModel: DetailsViewModelProtocol) {
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
        
        viewModel.exchangesModelData.bind { exchanges in
            if !exchanges.isEmpty {
                self.backButton.isHidden = false
                
                self.iconImageView.setHeight(height: 150)
                self.iconImageView.contentMode = .center
                self.iconImageView.backgroundColor = .white
                
                DispatchQueue.main.async {
                    let url = URL(string: self.viewModel.imageUrl)
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
                
                self.exchangeLabel.isHidden = false
                self.exchangeLabel.configure(content: self.viewModel.setExchangeTitle())
                
                self.nameLabel.isHidden = false
                self.nameLabel.configure(content: self.viewModel.setNameTitle())
                
                self.volumeHrsLabel.isHidden = false
                self.valueVolumeHrsLabel.isHidden = false
                self.valueVolumeHrsLabel.configure(content: self.viewModel.setValueHours())
                
                self.volumeDayLabel.isHidden = false
                self.valueVolumeDayLabel.isHidden = false
                self.valueVolumeDayLabel.configure(content: self.viewModel.setValueDay())
                
                self.volumeMonthLabel.isHidden = false
                self.valueVolumeMthLabel.isHidden = false
                self.valueVolumeMthLabel.configure(content: self.viewModel.setValueMonth())
                
                self.dataStartLabel.isHidden = false
                self.valueDataStartLabel.isHidden = false
                self.valueDataStartLabel.configure(content: self.viewModel.setValueDataStart())
                
                self.dataEndLabel.isHidden = false
                self.valueDataEndLabel.isHidden = false
                self.valueDataEndLabel.configure(content: self.viewModel.setValueDataEnd())
                
                self.dataQuoteStartLabel.isHidden = false
                self.valueDataQuoteStartLabel.isHidden = false
                self.valueDataQuoteStartLabel.configure(content: self.viewModel.setValueDataStartQuote())
                
                self.dataQuoteEndLabel.isHidden = false
                self.valueDataQuoteEndLabel.isHidden = false
                self.valueDataQuoteEndLabel.configure(content: self.viewModel.setValueDataEndQuote())
                
            }
        }
    }
    
    // MARK: - Selectors
    
    @objc func backController() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - CodeView (Views and Constraints)

extension DetailsViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(backButton)
        view.addSubview(stackView)
        
        stackView.addArrangedSubviews([
            iconImageView,
            exchangeLabel,
            nameLabel,
            stackViewVer
        ])
        
        stackViewVer.addArrangedSubviews([
            volumeHrsLabel,
            valueVolumeHrsLabel,
            stackViewHorTitles,
            stackViewHorValues,
            stackViewHorData,
            stackViewHorValuesData,
            stackViewHorQuota,
            stackViewHorValuesQuote
        ])
        
        stackViewHorTitles.addArrangedSubviews([
            volumeDayLabel,
            volumeMonthLabel
        ])
        
        stackViewHorValues.addArrangedSubviews([
            valueVolumeDayLabel,
            valueVolumeMthLabel
        ])
        
        stackViewHorData.addArrangedSubviews([
            dataStartLabel,
            dataEndLabel
        ])
        
        stackViewHorValuesData.addArrangedSubviews([
            valueDataStartLabel,
            valueDataEndLabel
        ])
        
        stackViewHorQuota.addArrangedSubviews([
            dataQuoteStartLabel,
            dataQuoteEndLabel
        ])
        
        stackViewHorValuesQuote.addArrangedSubviews([
            valueDataQuoteStartLabel,
            valueDataQuoteEndLabel
        ])
    }
    
    func setupConstraints() {
        backButton.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            paddingLeft: 16
        )
        
        stackView.anchor(
            top: backButton.bottomAnchor,
            paddingTop: 8,
            leading: view.leadingAnchor,
            paddingLeft: 24,
            trailing: view.trailingAnchor,
            paddingRight: 24
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        backButton.addTarget(self, action: #selector(backController), for: .touchUpInside)
    }
}
