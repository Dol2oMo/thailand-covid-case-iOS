//
//  CovidService.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case invalidSerialization
    case badHTTPResponse
    case error(NSError)
    case noData
}

protocol CovidServiceRepository {
    func getCovidCase(completion: @escaping (Result<CovidModel, ServiceError>) -> ())
}

class CovidService: CovidServiceRepository  {

    static let shared = CovidService()

    private let baseUrl = "https://static.easysunday.com/covid-19/getTodayCases.json"
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
        
    private init() {}

    func getCovidCase(completion: @escaping (Result<CovidModel, ServiceError>) -> ()) {

        guard let url = URL(string: baseUrl) else {
            completion(.failure(.invalidURL))

            return
        }
        
        executeDataTaskAndDecode(with: url) { (result: Result<CovidModel, ServiceError>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func executeDataTaskAndDecode<D: Decodable>(with url: URL, completion: @escaping (Result<D, ServiceError>) -> ()) {

        urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.error(error as NSError)))

                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                completion(.failure(.badHTTPResponse))

                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))

                return
            }
            
            do {
                let model = try self.jsonDecoder.decode(D.self, from: data)
                completion(.success(model))
            } catch let error as NSError{
                print(error.localizedDescription)
                completion(.failure(.invalidSerialization))
            }
        }.resume()
    }
}
