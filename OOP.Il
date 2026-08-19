;; Define a GraphNode class using your macro
(define-class (GraphNode id label)
  ((get-id) id)
  ((get-label) label)
  ((format-edge target-id) 
   (list 'edge id target-id)))

;; Instantiation and method invocation
(define node1 (GraphNode 1 "Alpha"))

(send node1 'get-id)             ; Returns: 1
(send node1 'get-label)          ; Returns: "Alpha"
(send node1 'format-edge 2)      ; Returns: (edge 1 2)
