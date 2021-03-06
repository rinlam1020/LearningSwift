import Foundation
import RxSwift

example(of: "ignoreElements") {
    let subject = PublishSubject<String>()
    let bag = DisposeBag()
    
    subject
        .ignoreElements()
        .subscribe({ (event) in
        print(event)
    }).disposed(by: bag)
    
    subject.onNext("Manh")
    subject.onNext("Pham")
}

example(of: "elementAt") {
    let subject = PublishSubject<String>()
    let bag = DisposeBag()
    
    subject
        .elementAt(2)
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
    
    subject.onNext("Manh")
    subject.onNext("Pham")
    subject.onNext("Van")
}

example(of: "filter") {
    let bag = DisposeBag()
    
    Observable.of(1, 2, 3, 4 , 5, 6)
        .filter({ $0 % 2 == 0 })
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
}

example(of: "skip") {
    let bag = DisposeBag()
    
    Observable.of(1, 2, 3, 4 , 5, 6)
        .skip(3)
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
}

example(of: "skipWhile") {
    let bag = DisposeBag()
    
    Observable.of(1, 2, 3, 4 , 5, 6)
        .skipWhile({ $0 % 2 != 0 })
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
}

example(of: "skipUntil") {
    let bag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .skipUntil(trigger)
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
    
    subject.onNext("Manh")
    subject.onNext("Pham")
    trigger.onNext("Test")
    subject.onNext("Ngan")
    subject.onNext("Ngan")
}

example(of: "take") {
    let bag = DisposeBag()
    
    Observable
        .of(1, 2, 3, 4, 5, 6)
        .take(2)
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
}

example(of: "takeWhile") {
    let bag = DisposeBag()
    
    Observable.of(1, 2, 3, 4 , 5, 6)
        .takeWhile({ $0 % 2 != 0 })
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
}

example(of: "takeUntil") {
    let bag = DisposeBag()
    
    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()
    
    subject
        .takeUntil(trigger)
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
    
    subject.onNext("Manh")
    subject.onNext("Pham")
    trigger.onNext("Test")
    subject.onNext("Ngan")
    subject.onNext("Ngan")
}

example(of: "distincUntilChanged") {
    let bag = DisposeBag()
    
    Observable.of(1, 1, 2, 3, 4, 4, 5, 6)
        .distinctUntilChanged()
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
}

example(of: "distinctUntilChanged(_:)") {
    let bag = DisposeBag()
    
    Observable.of(1, 1, 2, 3, 4, 4, 5, 6)
        .distinctUntilChanged({ (value1, value2) -> Bool in
            value1 == value2
        })
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: bag)
}

/*:
 Copyright (c) 2019 Razeware LLC

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 distribute, sublicense, create a derivative work, and/or sell copies of the
 Software in any work that is designed, intended, or marketed for pedagogical or
 instructional purposes related to programming, coding, application development,
 or information technology.  Permission for such use, copying, modification,
 merger, publication, distribution, sublicensing, creation of derivative works,
 or sale is expressly withheld.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
