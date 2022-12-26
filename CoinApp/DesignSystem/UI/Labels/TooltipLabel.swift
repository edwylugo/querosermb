//
//  TooltipLabel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

final class TooltipLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .roboto(type: .regular, size: .tooltip)
        textColor = .subtileLabel()
        numberOfLines = 0
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Configurable -> Populate Data ViewModel

extension TooltipLabel: Configurable {
    typealias Configuration = TooltipLabelContent
    
    struct TooltipLabelContent {
        let captionText: String
        let textAlignment: NSTextAlignment
        let textColor: UIColor

        init(captionText: String, textAlignment: NSTextAlignment, textColor: UIColor) {
            self.captionText = captionText
            self.textAlignment = textAlignment
            self.textColor = textColor
        }
    }
    
    func configure(content: TooltipLabelContent) {
        text = content.captionText
        textAlignment = content.textAlignment
        textColor = content.textColor
     }
}
