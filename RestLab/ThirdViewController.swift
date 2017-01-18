//
//  ThirdViewController.swift
//  RestLab
//
//  Created by Admin on 01.01.17.
//  Copyright © 2017 Yaroslav. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController{
    
    var values:Array<Any>!
    
    //, UITableViewDelegate, UITableViewDataSource
  
    
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            else {
                return UITableViewCell()
        }
        
        let foods = values[indexPath.row]
        cell.textLabel?.text = (foods as AnyObject).name
        cell.detailTextLabel?.text = String(values.count)
        
        return cell
    }

    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        StreamDataService.instance.downloadStreamsForGame(game) {
            for stream in StreamDataService.instance.streams {
                stream.downloadStreamImage {
                    self.streamsTableView.reloadData()
                }
                
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        StreamDataService.instance.removeAllStreams()
    }
    */
  
    /*
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StreamDataService.instance.streams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = streamsTableView.dequeueReusableCell(withIdentifier: "StreamCell", for: indexPath ) as? StreamCell
        {
            
            let stream = StreamDataService.instance.streams[indexPath.row]
            cell.configureCell(stream)
            return cell
            
        } else {
            
            return StreamCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (streamsTableView.bounds.width / 16) * 9
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stream = StreamDataService.instance.streams[indexPath.row]
        
        openStream(stream)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
*/
}


