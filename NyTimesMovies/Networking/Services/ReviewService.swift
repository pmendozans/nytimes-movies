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
        let validOffset = offset * 20
        let parameters = parameterSerializer.getMovieReviewsParameters(offset: validOffset, order: .publicationDate, resourceType: .all)
        let urlString = "\(ApiManager().baseUrl)/svc/movies/v2/reviews/picks.json"
        makeReviewRequest(urlString: urlString, parameters: parameters, completion: { jsonResponse in
            completion?(jsonResponse)
        }, errorHandler: { error in
            errorHandler?(error)
        })
    }
    
    private func makeReviewRequest(urlString: String, parameters: Parameters, completion: ((JSON) -> Void)?, errorHandler: ((NSError) -> Void)?){
        guard let url = URL(string: urlString) else{
            return
        }
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case.success(let value):
                let genericError = NSError(domain: "", code: 0, userInfo: nil)
                guard let statusCode = response.response?.statusCode else {
                    errorHandler?(genericError)
                    return
                }
                switch statusCode {
                case 200:
                    guard let rawJson = value as? [String: Any] else {
                        errorHandler?(genericError)
                        return
                    }
                    guard let resultsJson = rawJson["results"] as? [[String: Any]] else {
                        errorHandler?(genericError)
                        return
                    }
                    completion?(JSON(resultsJson))
                default:
                    print("Error in response")
                }
                
            case .failure(let error):
                errorHandler?(error as NSError)
            }
        }
    }
}
