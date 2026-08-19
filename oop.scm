;; Base class
(define-class (Point x y)
  ((get-x) x)
  ((get-y) y)
  ((describe) (list 'Point x y)))

;; Derived class extending Point
(define-class (NamedPoint name x y)
  (extends Point x y)
  ((get-name) name)
  ;; Override describe method
  ((describe) (list 'NamedPoint name x y)))

;; Instantiation
(define p (NamedPoint "Origin" 0 0))

(send p 'get-name)   ; Returns: "Origin"                     (subclass method)
(send p 'get-x)      ; Returns: 0                        (inherited from Point)
(send p 'get-y)      ; Returns: 0                        (inherited from Point)
(send p 'describe)   ; Returns: (NamedPoint "Origin" 0 0)    (overridden method)
