//
//  NetworkService.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation
import Alamofire
import UIKit
import AlamofireImage

class NetworkService {
    
    typealias CompletionHandler<T: Decodable, K: DataFromDto<T>> = (_ data: K?, _ error: Error?) -> ()
    
    func load<T: Codable, K: DataFromDto<T>>(
        url: String,
        typeCodable: T.Type,
        typeFromDto: K.Type,
        completionHandler: @escaping CompletionHandler<T, K>
    ) {
        AF.request(url).responseData{ (dataResponse) in
            switch dataResponse.result {
            case .success(let data):
                let decoder = JSONDecoder()
                let res = try! decoder.decode(T.self, from: data)
                let dataFromDto = K.init(dto: res)
                completionHandler(dataFromDto, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    typealias ImageCompletionHandler = (_ image: UIImage?, _ error: Error?) -> ()
    
    func loadImage(_ url: String, completionHandler: @escaping ImageCompletionHandler) {
        AF.request(url, method: .get).responseImage { response in
            switch response.result {
            case .success(let imageData):
                completionHandler(imageData, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
