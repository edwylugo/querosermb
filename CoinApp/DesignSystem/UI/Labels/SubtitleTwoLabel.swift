//
//  SubtitleTwoLabel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

final class SubtitleTwoLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .roboto(type: .medium, size: .subtitle2)
        textColor = .titleLabel()
        numberOfLines = 0
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configurable -> Populate Data ViewModel

extension SubtitleTwoLabel: Configurable {
    typealias Configuration = SubtitleTwoLabelContent
    
    struct SubtitleTwoLabelContent {
        let subtitleTwoText: String
        let textAlignment: NSTextAlignment
        let textColor: UIColor

        init(subtitleTwoText: String, textAlignment: NSTextAlignment, textColor: UIColor) {
            self.subtitleTwoText = subtitleTwoText
            self.textAlignment = textAlignment
            self.textColor = textColor
        }
    }
    
    func configure(content: SubtitleTwoLabelContent) {
        text = content.subtitleTwoText
        textAlignment = content.textAlignment
        textColor = content.textColor
     }
}

