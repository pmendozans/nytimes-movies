//
//  ReviewService.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ResourceType: String {
    case all = "all"
    case picks = "picks"
}

enum ReviewOrder: String {
    case title = "by-title"
    case publicationDate = "by-publication-date"
    case openingDate = "by-opening-date"
}

struct ReviewService {
    private let apiManager = ApiManager()
    private let parameterSerializer = ParametersSerializer()
    
    func getMovieReviews(byResourceType type: ResourceType, order: ReviewOrder, offset: Int, completion: ((JSON) -> Void)?, errorHandler: ((Error) -> Void)?){
        let parameters = parameterSerializer.getMovieReviewsParameters(offset: 0, order: .publicationDate, resourceType: .all)
        let url = "\(ApiManager().baseUrl)/svc/movies/v2/reviews/picks.json"
        makeReviewRequest(url: url, parameters: parameters, completion: { jsonResponse in
            completion?(jsonResponse)
        }, errorHandler: { error in
            errorHandler?(error)
        })
    }
    
    private func makeReviewRequest(url: String, parameters: Parameters, completion: ((JSON) -> Void)?, errorHandler: ((Error) -> Void)?){
        guard let url = URL(string: url) else{
            return
        }
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case.success(let value):
                print(value)
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                switch statusCode {
                case 200:
                    guard let rawJson = value as? [String: Any] else {
                        return
                    }
                    let json = JSON(rawJson)
                    completion?(json["results"])
                default:
                    print("Error in response")
                }
                
            case .failure(let error):
                print("Error")
                errorHandler?(error)
            }
        }
    }
}
