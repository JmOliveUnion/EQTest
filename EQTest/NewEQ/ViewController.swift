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
    
    var pageNum: EQTutotroialPage = .pageOne
    
    
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
                let vc = NewEQDetailVC()
                vc.modalPresentationStyle = .fullScreen
                //                self.navigationController?.pushViewController(vc, animated: true)
                self.present(vc, animated: true)
                
            }
            .store(in: &cancellableBag)
        
        mainView.topLeftButton.tapPublisher
            .sink { _ in
                
                
                mainView.eqTutorial.isHidden = false
                mainView.eqScrollView.isScrollEnabled = false
            }
            .store(in: &cancellableBag)
        
        
        mainView.leftEarButton.tapPublisher
            .sink { _ in
                mainView.rightEarView.backgroundColor = .clear
                mainView.rightEarView.layer.borderColor = UIColor.red.cgColor
                mainView.rightEarView.layer.borderWidth = 1
                mainView.rightEarLabel.textColor = .red
                
                mainView.leftEarView.backgroundColor = .blue
                mainView.leftEarView.layer.borderWidth = 0
                mainView.leftEarLabel.textColor = .white
                
                mainView.chainButtonImage.image = UIImage(named: "chain_inactive")
            }
            .store(in: &cancellableBag)
        
        mainView.chainEarButton.tapPublisher
            .sink { _ in
                mainView.leftEarView.backgroundColor = .blue
                mainView.leftEarView.layer.borderWidth = 0
                mainView.leftEarLabel.textColor = .white
                
                mainView.rightEarView.backgroundColor = .red
                mainView.rightEarView.layer.borderWidth = 0
                mainView.rightEarLabel.textColor = .white
                
                mainView.chainButtonImage.image = UIImage(named: "chain_active")
            }
            .store(in: &cancellableBag)
        
        mainView.rightEarButton.tapPublisher
            .sink { _ in
                mainView.leftEarView.backgroundColor = .clear
                mainView.leftEarView.layer.borderColor = UIColor.blue.cgColor
                mainView.leftEarView.layer.borderWidth = 1
                mainView.leftEarLabel.textColor = .blue
                
                mainView.rightEarView.backgroundColor = .red
                mainView.rightEarView.layer.borderWidth = 0
                mainView.rightEarLabel.textColor = .white
                
                mainView.chainButtonImage.image = UIImage(named: "chain_inactive")

            }
            .store(in: &cancellableBag)
        
        mainView.eqTutorial.firstNextButton.tapPublisher
            .sink {[weak self] _ in
                
                print("Button Top Left")
                self?.incrementPage()
                self?.showingView()
            }
            .store(in: &cancellableBag)
        
        mainView.eqTutorial.backButton.tapPublisher
            .sink {[weak self] _ in
            
                self?.decrementPage()
                self?.showingView()
            }
            .store(in: &cancellableBag)
        
        mainView.eqTutorial.backButtonSecond.tapPublisher
            .sink {[weak self] _ in
                
                self?.decrementPage()
                self?.showingView()
            }
            .store(in: &cancellableBag)
        
        mainView.eqTutorial.nextButton.tapPublisher
            .sink {[weak self] _ in
                
                self?.incrementPage()
                self?.showingView()
            }
            .store(in: &cancellableBag)
        
        mainView.eqTutorial.nextButtonSecond.tapPublisher
            .sink {[weak self] _ in
                
                self?.incrementPage()
                self?.showingView()
            }
            .store(in: &cancellableBag)
        
        mainView.eqTutorial.topRightXbutton.tapPublisher
            .sink {[weak self] _ in
                [ mainView.eqTutorial.soundControlView, mainView.eqTutorial.presetStackTutorial, mainView.eqSliderStackView, mainView.eqTutorial].forEach {
                    $0.isHidden = true
                }
                
                mainView.eqScrollView.isScrollEnabled = true
                self?.pageNum = .pageOne
                self?.showingView()
                
                [mainView.bottomButtonStack].forEach {
                    $0.isHidden = false
                }
            }
            .store(in: &cancellableBag)
        
        
    }
    
    private func incrementPage() {
        if let nextPage = EQTutotroialPage(rawValue: pageNum.rawValue + 1) {
            pageNum = nextPage
        } else {
            pageNum = .pageOne
        }
    }
    
    private func decrementPage() {
        if let nextPage = EQTutotroialPage(rawValue: pageNum.rawValue - 1) {
            pageNum = nextPage
        } else {
            pageNum = .pageOne
        }
    }
    
    private func showingView() {
        
        guard let mainView = view as? NewEQView else {
            return assertionFailure("MainView does not Exist")
        }
        
        let tutorial = mainView.eqTutorial
        
        switch self.pageNum {
        case .pageOne:
            [tutorial.firstNextButton,tutorial.presetView, tutorial.dotView, mainView.eqSliderStackView].forEach {
                $0.isHidden = false
            }
            
            [ tutorial.buttonStack, tutorial.tutorialEQStack, tutorial.soundRangeView, mainView.bottomButtonStack].forEach {
                $0.isHidden = true
            }
        


        case .pageTwo:
            
            [ tutorial.buttonStack, tutorial.tutorialEQStack, tutorial.soundRangeView, tutorial.buttonStack].forEach {
                $0.isHidden = false
            }
            
            [ tutorial.firstNextButton, tutorial.presetView, tutorial.dotView, tutorial.presetStackTutorial, tutorial.soundControlView, mainView.eqSliderStackView].forEach {
                $0.isHidden = true
            }
          

        case .pageThree:
            [ tutorial.soundControlView, tutorial.presetStackTutorial, mainView.eqSliderStackView].forEach {
                $0.isHidden = false
            }
            
            [ tutorial.tutorialEQStack, tutorial.soundRangeView, tutorial.buttonStack].forEach {
                $0.isHidden = true
            }
            


        case .pageFour:
            [ tutorial.soundControlView, tutorial.presetStackTutorial, mainView.eqSliderStackView, mainView.eqTutorial].forEach {
                $0.isHidden = true
            }
            
       
         
            mainView.eqScrollView.isScrollEnabled = true
            pageNum = .pageOne
            showingView()
            
            [mainView.bottomButtonStack].forEach {
                $0.isHidden = false
            }

        }
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
