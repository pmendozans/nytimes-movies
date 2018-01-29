//
//  ParametersSerializer.swift
//  NyTimesMovies
//
//  Created by Pablo Ruiz on 1/29/18.
//  Copyright © 2018 nearsoft. All rights reserved.
//

import Foundation

struct ParametersSerializer {
    func getMovieReviewsParameters(offset: Int, order: ReviewOrder, resourceType: ResourceType) -> [String: Any] {
        let parameters = [
            "api-key": ApiManager().apiKey,
            "offset": offset,
            "order": order.rawValue,
        ]  as [String: Any]
        return parameters
    }
}
