(ns anag.util)

(def not-nil? (complement nil?))

;; mystr: string, mychars: string
;; returns true if any one of 'mychars' is in 'mystr'
(defn string-includes [mystr mychars]
  (some not-nil? (map #(clojure.string/index-of mystr %) (char-array mychars))))

 