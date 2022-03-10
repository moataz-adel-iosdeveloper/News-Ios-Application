//
//  DownloadImage.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 09/03/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func DownloadImage(_ URLString: String, placeHolder: String? , cornerRadius : CGFloat?) {
        
        let url = URL(string: URLString)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        |> RoundCornerImageProcessor(cornerRadius: cornerRadius != nil ? cornerRadius! : CGFloat(0.0))
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: placeHolder != nil ? UIImage(named: placeHolder!) : nil,
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
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
