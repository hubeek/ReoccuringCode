import UIKit


import Foundation

class DownloadOperation : Operation {
    
    private var task : URLSessionDownloadTask!
    
    enum OperationState : Int {
        case ready
        case executing
        case finished
    }
    
    // default state is ready (when the operation is created)
    private var state : OperationState = .ready {
        willSet {
            self.willChangeValue(forKey: "isExecuting")
            self.willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            self.didChangeValue(forKey: "isExecuting")
            self.didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isReady: Bool { return state == .ready }
    override var isExecuting: Bool { return state == .executing }
    override var isFinished: Bool { return state == .finished }
    
    init(session: URLSession, downloadTaskURL: URL, completionHandler: ((URL?, URLResponse?, Error?) -> Void)?) {
        super.init()
        
        // use weak self to prevent retain cycle
        task = session.downloadTask(with: downloadTaskURL, completionHandler: { [weak self] (localURL, response, error) in
            
            /*
             if there is a custom completionHandler defined,
             pass the result gotten in downloadTask's completionHandler to the
             custom completionHandler
             */
            if let completionHandler = completionHandler {
                // localURL is the temporary URL the downloaded file is located
                completionHandler(localURL, response, error)
            }
            
            /*
             set the operation state to finished once
             the download task is completed or have error
             */
            self?.state = .finished
        })
    }
    
    override func start() {
        /*
         if the operation or queue got cancelled even
         before the operation has started, set the
         operation state to finished and return
         */
        if(self.isCancelled) {
            state = .finished
            return
        }
        
        // set the state to executing
        state = .executing
        
        print("downloading \(self.task.originalRequest?.url?.absoluteString ?? "")")
        
        // start the downloading
        self.task.resume()
    }
    
    override func cancel() {
        super.cancel()
        
        // cancel the downloading
        self.task.cancel()
    }
}

var session : URLSession!
var queue : OperationQueue!

session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
queue = OperationQueue()
queue.maxConcurrentOperationCount = 1
let completionOperation = BlockOperation {
    print("finished download all")
    
}

let urls = [
    URL(string: "https://github.com/fluffyes/AppStoreCard/archive/master.zip")!,
    URL(string: "https://github.com/fluffyes/currentLocation/archive/master.zip")!,
    URL(string: "https://github.com/fluffyes/DispatchQueue/archive/master.zip")!,
    URL(string: "https://github.com/fluffyes/dynamicFont/archive/master.zip")!,
    URL(string: "https://github.com/fluffyes/telegrammy/archive/master.zip")!
]

for (index, url) in urls.enumerated() {
    let operation = DownloadOperation(session: session, downloadTaskURL: url, completionHandler: { (localURL, urlResponse, error) in
        
        if error == nil {
            DispatchQueue.main.async {
                print( "\(index + 1) / \(urls.count) files downloaded")
            }
        }
    })
    
    completionOperation.addDependency(operation)
    queue.addOperation(operation)
}
queue.addOperation(completionOperation)

