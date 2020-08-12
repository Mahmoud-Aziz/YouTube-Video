//
//  Model.swift
//  YoutubeVideo
//
//  Created by Mahmoud Aziz on 8/12/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        //create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get URLsession object
        let session = URLSession.shared
        
        //get a data task from the url session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there is any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                //parse the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                        //call the "videosFetched" method of the delegate
                            self.delegate?.videosFetched(response.items!)
                    }
                }
                dump(response)
                
            }
            catch {
                
            }
            
        }
        
        //kick of the task
        dataTask.resume()
        
        
    }
}

