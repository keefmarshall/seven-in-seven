(ns anag.core
  (:require [clojure.string :as str]
            [clojure.java.io :as io])
  (:use [anag.util]))

(def allhighchars "àáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ")
(def usedhighchars "àáâãäåçèéêëìíîïñòóôõöøùúûü")

(def highcharmap 
  {\à \a 
   \á \a
   \â \a
   \ã \a
   \ä \a
   \å \a
   \ç \c
   \è \e
   \é \e
   \ê \e
   \ë \e
   \ì \i
   \í \i
   \î \i
   \ï \i
   \ñ \n
   \ò \o
   \ó \o
   \ô \o
   \õ \o
   \ö \o
   \ø \o
   \ù \u
   \ú \u
   \û \u
   \ü \u})

(defn sortString [mystr] 
  (str/triml
    (apply str 
           (sort
             (filter #(Character/isLetter %)
               (replace highcharmap
                 (char-array 
                   (str/lower-case mystr)))))))
)

;; same as sortString but clearer?
(defn sortString2 [mystr]
  (->> mystr
    (str/lower-case) 
    (char-array) 
    (replace highcharmap) 
    (filter #(Character/isLetter %)) 
    (sort) 
    (apply str)
    (str/triml)
  )
)


(defn sortedStringsFromFile [filename]
  (with-open [rdr (io/reader filename)]
         (doseq [line (line-seq rdr)]
            (println (str (sortString line) "=" line))))
)

(defn writeSortedStringsFromFile [infile outfile]
  (with-open [rdr (io/reader infile)
              wrt (io/writer outfile)]
         (doseq [line (line-seq rdr)]
            (.write wrt (str (sortString line) "=" line "\n"))))
)

(defn findAnagrams [instr wordfile]
  (let [input (sortString instr)]
    (with-open [rdr (io/reader wordfile)]
      (doseq [anag 
        (filter #(.startsWith % (str input "=")) (line-seq rdr))]
           (println (nth (.split anag "=") 1)))))
)

;; In theory, should return a big map, keyed on 'sorted string'
;; works, but overflows on the full file.
(defn collate [myseq]
  (if (empty? myseq) 
    nil
    (merge-with list 
                (apply hash-map (.split (first myseq) "="))
                (collate (rest myseq))))
;;    (concat (.split (first myseq) "=") (collate (rest myseq))))
;;(.split (first myseq) "=")
)

;; Does the same as above, but with tail-recursion.
;; Almost works, but incorrectly nests list where there's more than two matches
(defn collate2 [myseq]
  (loop [s myseq, acc {}]
         (if (empty? s)
           acc
           (recur (rest s) 
                  (merge-with list 
;;                  (merge-with concat
                              acc
                              (apply hash-map (.split (first s) "="))))))
)

(defn loadAnagrams [wordfile]
  (with-open [rdr (io/reader wordfile)]
   (collate2 (line-seq rdr)))
)
