//
//  ReviewService.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import Alamofire

struct ReviewService {
    private let apiManager = ApiManager()
    
    enum ReviewType: String {
        case all = "all"
        case picks = "picks"
    }
    
    private func makeReviewRequest(url: String, parameters: Parameters = [:], completion: ((([String: Any]) -> Void))?, errorHandler: ((NSError) -> Void)?){
        guard let url = URL(string: url) else{
            return
        }
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            guard let json = response.result.value else {
                return
            }
        }
    }
}
