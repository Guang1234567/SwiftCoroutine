//
//  CoFuturePublisher.swift
//  SwiftCoroutine
//
//  Created by Alex Belozierov on 15.03.2020.
//  Copyright © 2020 Alex Belozierov. All rights reserved.
//

#if canImport(Combine)
#if OPENCOMBINE_COMPATIBILITY_TEST
import Combine
#else
import OpenCombine
#endif

@available(OSX 10.15, iOS 13.0, *)
final class CoFuturePublisher<Output, Future: CoFuture<Output>> {
    
    typealias Failure = Error
    
    let future: Future
    
    @inlinable init(future: Future) {
        self.future = future
    }
    
}

@available(OSX 10.15, iOS 13.0, *)
extension CoFuturePublisher: Publisher {
    
    @inlinable func receive<S: Subscriber>(subscriber: S) where Failure == S.Failure, Output == S.Input {
        let subscription = CoSubscription(subscriber: subscriber, future: future)
        subscriber.receive(subscription: subscription)
    }
    
}

//@available(OSX 10.15, iOS 13.0, *)
//final class CoFutureSubject<T>: CoFuturePublisher<T, CoPromise<T>> {}
//
//@available(OSX 10.15, iOS 13.0, *)
//extension CoFutureSubject: Subject {
//
//    @inlinable func send(_ value: Output) {
//        future.success(value)
//    }
//
//    @inlinable func send(completion: Subscribers.Completion<Failure>) {
//        switch completion {
//        case .finished: future.cancel()
//        case .failure(let error): future.complete(with: .failure(error))
//        }
//    }
//
//    @inlinable func send(subscription: Subscription) {
//        subscription.request(.max(1))
//    }
//
//}
#endif
