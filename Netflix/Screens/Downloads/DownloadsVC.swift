//
//  DownloadsVC.swift
//  Netflix
//
//  Created by Ahmed Yasein on 8/19/22.
//  Copyright © 2022 Ahmed Yasein. All rights reserved.
//

import UIKit
import Lottie
class DownloadsVC: UIViewController {
    
    private var titles: [MovieItem] = [MovieItem]()

    private  let downloadedTableView: UITableView = {
         let tableView = UITableView()
          tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
          return tableView
      }()
    override func viewDidLoad() {
        
        title = "Download"
        view.addSubview(downloadedTableView)
        navigationController?.navigationBar.prefersLargeTitles = true
        downloadedTableView.delegate = self
        downloadedTableView.dataSource = self
        fetchLocalStorageForDownload()
        NotificationCenter.default.addObserver(forName: NSNotification.Name("downloaded"), object: nil, queue: nil) { _ in
                   self.fetchLocalStorageForDownload()
               }
}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.downloadedTableView.frame = view.bounds
    }
    
    private func fetchLocalStorageForDownload() {

           
           DataPersistenceManager.shared.fetchingTitlesFromDataBase { [weak self] result in
               switch result {
               case .success(let titles):
                   self?.titles = titles
                   DispatchQueue.main.async {
                       self?.downloadedTableView .reloadData()
                   }
               case .failure(let error):
                   print(error.localizedDescription)
               }
           }
       }
}
extension DownloadsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         titles.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else {
             return UITableViewCell()
         }
        let movie = Title(adult: nil, backdropPath: nil, genreIds: nil, id: Int(titles[indexPath.row].id), originalLanguage: nil, originalTitle: titles[indexPath.row].originalTitle, originalName: titles[indexPath.row].originalName, overview: nil, popularity: nil, posterPath: titles[indexPath.row].posterPath, releaseDate: nil, title: nil, votAverage: nil, video: nil, voteCount: nil)
         cell.configure(with: movie)
         return cell
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 120
     }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            
            DataPersistenceManager.shared.deleteTitleWith(model: titles[indexPath.row]) { [weak self] result in
                switch result {
                case .success():
                    print("Deleted fromt the database")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.titles.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            break;
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
          
          let movie = titles[indexPath.row]
          
          guard  let titleName = movie.originalName ?? movie.originalTitle else {
              return
          }
          APICaller.shared().getMoviesFromYoutube(quary: titleName) {[weak self] (error, videoElement) in
              if let error = error {
                  print(error.localizedDescription)
              } else if let videoElement = videoElement {
                  DispatchQueue.main.async {
                      let moviePreviewVC = MoviePreviewVC()
                      moviePreviewVC.configure(movie: MoviePreviewModel(title: titleName, youtubeVideo: videoElement, overview: movie.overview ?? ""))
                      self?.navigationController?.pushViewController(moviePreviewVC, animated: true   )
                  }
                  
              }
          }
      }
    
    
    
}
