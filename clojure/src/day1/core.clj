(ns day1.core)

;; run "lein repl" from  shell in project root
;; user=> (load-file "src/day1/core.clj")
;; user=> (day1.core/big "hello" 4)


;; Implement a function called (big st n) that returns true if a string st is
;; longer than n characters.
(defn big [st n] (> (count st) n))

;; Write a function called (collection-type col) that returns :list, :map, 
;; or :vector based on the type of collection col.

;; NB this is pretty crude, I assume there's something like Java's 'instanceof'
;; that I could use to be more comprehensive in case there are subclasses of
;; core collections. Hmm, I guess Clojure doesn't really have native subclasses
;;
;; NB also '() returns a specialised EmptyList type different to e.g. '(1 2)
(defn collection-type [col] 
  (let [typemap { 
                 (type {}) :map, 
                 (type '()) :list, 
                 (type '(1 2)) :list, 
                 (type []) :vector 
                 } ]
    (typemap (type col)))
)


;; shorthand:
(defn collection-type1 [col] 
  ({ 
    (type {}) :map, 
    (type '()) :list, 
    (type '(1 2)) :list, 
    (type []) :vector 
    } (type col))
)
