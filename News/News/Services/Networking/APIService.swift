//
//  APIService.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Mapple Labs. All rights reserved.
//
import UIKit
import Alamofire

// MARK: - APIService
final class APIService {

    class var shared: APIService {
        struct Static {
            static let instance : APIService = APIService()
        }
        return Static.instance
    }
    
    enum GetFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    // MARK: - getFeeds
    typealias GetFeedsResult = Result<[Feed]?, GetFailureReason>
    typealias GetFeedsCompletion = (_ result: GetFeedsResult) -> Void
    
    func getFeeds(completion: @escaping GetFeedsCompletion) {
        Alamofire.request(APILink.API.feedList)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard response.result.isSuccess else  {
                        completion(.failure(nil))
                        return
                    }
                    if let data = response.data {
                        do {
                            let jsonDecoder = JSONDecoder()
                            let feedArray = try jsonDecoder.decode(FeedList.self, from: data)
                            completion(.success(payload: feedArray.items))
                        } catch _ {
                            completion(.failure(nil))
                        }
                    } else {
                        completion(.failure(nil))
                    }
                    
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
    // MARK: - getdetailAFeed
    typealias GetDetailAFeedResult = Result<FeedDetail?, GetFailureReason>
    typealias GetDetailAFeedCompletion = (_ result: GetDetailAFeedResult) -> Void
    func getdetailAFeed(completion: @escaping GetDetailAFeedCompletion) {
        Alamofire.request(APILink.API.detailAFeed)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard response.result.isSuccess else  {
                        completion(.failure(nil))
                        return
                    }
                    if let data = response.data {
                        do {
                            let jsonDecoder = JSONDecoder()
                            let feedDetail = try jsonDecoder.decode(FeedDetail.self, from: data)
                            completion(.success(payload: feedDetail))
                        } catch _ {
                            completion(.failure(nil))
                        }
                    } else {
                        completion(.failure(nil))
                    }
                    
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
}

enum Result<T, U: Error> {
    case success(payload: T)
    case failure(U?)
}
