//
//  ViewController.swift
//  EQTest
//
//  Created by 김민종 on 6/26/24.
//

import UIKit
import Combine

class ViewController: UIViewController, VerticalSliderDelegate {
    var cancellableBag = Set<AnyCancellable>()

    func trackingContinue(channel: Int) {
        print("")
    }
    
    func trackingEnd() {
        print("")

    }
    
    
    override func loadView() {
        super.loadView()
        view = NewEQView(frame: view.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        
    }
    
    func bind() {
        guard let mainView = view as? NewEQView else {
            return assertionFailure("MainView is not Exist")
        }
        
        mainView.selectButton.tapPublisher
            .sink { _ in
                print("Button Tapped")
                let vc = NewEQDetailVC()
                vc.modalPresentationStyle = .fullScreen
//                self.navigationController?.pushViewController(vc, animated: true)
                self.present(vc, animated: true)
                
            }
            .store(in: &cancellableBag)
        
        mainView.topLeftButton.tapPublisher
            .sink { _ in
                
                print("Button Top Left")

                mainView.eqTutorial.isHidden = false
                mainView.eqScrollView.isScrollEnabled = false
            }
            .store(in: &cancellableBag)
    }


}



extension UIButton {
    var tapPublisher: AnyPublisher<Void, Never> {
        return controlPublisher(for: .touchUpInside)
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    var tapPublisherTouchDown: AnyPublisher<Void, Never> {
        return controlPublisher(for: .touchDown)
            .map { _ in }
            .eraseToAnyPublisher()
    }
}

extension UIControl {
    
    func controlPublisher(for event: UIControl.Event) -> EventPublisher {
        return UIControl.EventPublisher(control: self, event: event)
    }
    
    struct EventPublisher: Publisher {
        typealias Output = UIControl
        typealias Failure = Never
        
        let control: UIControl
        let event: UIControl.Event
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, UIControl == S.Input {
            let subscription = EventSubscription(control: control, subscriber: subscriber, event: event)
            subscriber.receive(subscription: subscription)
        }
    }
    
    fileprivate class EventSubscription<S: Subscriber>: Subscription where Never == S.Failure, UIControl == S.Input {
        
        let control: UIControl
        let event: UIControl.Event
        var subscriber: S?
        
        init(control: UIControl, subscriber: S, event: UIControl.Event) {
            self.control = control
            self.subscriber = subscriber
            self.event = event
            
            control.addTarget(self, action: #selector(didOccurEvent), for: event)
        }
        
        func request(_ demand: Subscribers.Demand) {}
        
        func cancel() {
            subscriber = nil
            control.removeTarget(self, action: #selector(didOccurEvent), for: event)
        }
        
        @objc func didOccurEvent() {
            _ = subscriber?.receive(control)
        }
    }
}
