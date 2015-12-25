//
//  HTTPRequestManager.swift
//  DylanFrameWork
//
//  Created by Dylan on 15/12/23.
//  Copyright © 2015年 Dylan.Lee. All rights reserved.
//

import Alamofire

/// 请求成功
typealias SuccessBlock = (resp: Response<AnyObject, NSError>) -> ()

/// 请求失败
typealias FailureBlock = (errorMsg: String?) -> ()
typealias Couple = [String: AnyObject]
typealias UploadProgressBlock = (bytesWritten: UInt64, totalBytesWritten: UInt64, totalBytesExpectedToWrite: UInt64) -> ()

class HTTPRequestManager {
    
    // MARK: 网络请求GET方法
    class func GET(
        URLString: URL,
        params: Couple?,
        success: SuccessBlock,
        failure: FailureBlock
        )
    {
        HTTPRequest(
            .GET,
            URLString: URLString,
            parameters: params,
            success: success,
            failure: failure
        )
    }

    // MARK: 网络请求POST方法
    class func POST(
        URLString: URL,
        params: Couple?,
        success: SuccessBlock,
        failure: FailureBlock
        )
    {
        HTTPRequest(
            .POST,
            URLString: URLString,
            parameters: params,
            success: success,
            failure: failure
        )
    }
    
    // 上传文件
    
    // MARK: - 网络请求统一处理
    class func HTTPRequest(
        method: Method,
        URLString: URL,
        parameters:Couple?,
        success: SuccessBlock,
        failure: FailureBlock
        )
    {
        
        Alamofire.request(
            method,
            URLString.rawValue,
            parameters: parameters,
            encoding: .URLEncodedInURL,
            headers: nil
        ).responseJSON
            {   (response) -> Void in
                
                if response.result.isSuccess {
                    success(resp: response)
                } else {
                    failure(errorMsg: response.result.error?.description)
                }
            }
    }
    
    
    
    
}

