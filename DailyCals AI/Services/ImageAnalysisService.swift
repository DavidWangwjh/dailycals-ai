//
//  ImageAnalysisService.swift
//  DailyCals AI
//
//  Created by David Wang on 1/25/25.
//

import Foundation
import UIKit

let API_KEY: String = ""

struct TopLevelResponse: Codable {
    let choices: [Choice]
    
    struct Choice: Codable {
        let message: Message
        
        struct Message: Codable {
            let content: String?
        }
    }
}

struct ImageAnalysisService {
    static func analyzeFood(image: UIImage, completion: @escaping (Result<Food, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to JPEG data")
            return
        }
        
        let base64Image = imageData.base64EncodedString()
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(API_KEY)", forHTTPHeaderField: "Authorization")
        
        let requestBody: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                [
                    "role": "user",
                    "content": [
                        [
                            "type": "image_url",
                            "image_url": [
                                "url": "data:image/png;base64,\(base64Image)"
                            ]
                        ]
                    ]
                ]
            ],
            "response_format": [
                "type": "json_schema",
                "json_schema": [
                    "name": "food_analyzer",
                    "strict": true,
                    "schema": [
                        "type": "object",
                        "properties": [
                            "title": ["type": "string"],
                            "image_description": ["type": "string"],
                            "ingredients": [
                                "type": "array",
                                "items": [
                                    "type": "object",
                                    "properties": [
                                        "title": ["type": "string"],
                                        "calories_per_gram": ["type": "number"],
                                        "total_gram": ["type": "number"],
                                        "total_calories": ["type": "number"]
                                    ],
                                    "required": ["title", "calories_per_gram", "total_gram", "total_calories"],
                                    "additionalProperties": false
                                ]
                            ],
                            "total_calories": ["type": "number"]
                        ],
                        "required": ["title", "image_description", "ingredients", "total_calories"],
                        "additionalProperties": false
                    ]
                ]
            ],
            "temperature": 1,
            "max_completion_tokens": 2048,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            print("Request Body: \(String(data: request.httpBody!, encoding: .utf8) ?? "Invalid JSON")")
        } catch {
            print("Failed to serialize request body: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network request failed: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received from network request")
                return
            }
            
            print("Raw Response: \(String(data: data, encoding: .utf8) ?? "Invalid response data")")
            
            do {
                // Decode the top-level response to extract the content
                let topLevelResponse = try JSONDecoder().decode(TopLevelResponse.self, from: data)
                if let content = topLevelResponse.choices.first?.message.content {
                    // Decode the content string into FoodAnalysisResult
                    if let contentData = content.data(using: .utf8) {
                        let result = try JSONDecoder().decode(Food.self, from: contentData)
                        print("AI analysis successful: \(result)")
                        completion(.success(result))
                    } else {
                        print("Failed to convert content to Data")
                        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert content to Data"])))
                    }
                } else {
                    print("No content found in response")
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No content found in response"])))
                }
            } catch {
                print("Failed to decode response: \(error)")
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
