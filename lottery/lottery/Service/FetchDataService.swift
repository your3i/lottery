//
//  FetchDataService.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation
import Combine

class FetchDataService {

    static let shared = FetchDataService()

    private init() { }

    func fetch() -> AnyPublisher<[Loto], APIError> {
        let url = URL(string: "https://opensheet.elk.sh/1_QkrmNRrlC-yvkONKk2oCPSLZXo-QsnautsSqlWqhtQ/loto7")!
        return APIClient.shared.fetch(url: url)
    }
}
