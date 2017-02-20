#|
@doc
  coords
@end
|#

(defmodule coords
  (export (main 1)))

;;; API functions

(defun main
  ([`(,lat ,lon ,max)]
   (let ((coords (gen-random-coords lat lon max)))
     (io:format "~p~n" `(,coords))))
  ([_] (usage)))

;;; Internal functions

(defun usage ()
  (io:format "usage: coords lat lon max~n" '()))

(defun gen-random-coords (lat lon max)
  (lists:map (lambda (_) (random-coord lat lon))
             (lists:seq 1 (erlang:list_to_integer max))))

(defun random-coord (lat lon)
  (let* ((r (/ 100 111300))
         (y0 (erlang:list_to_float lat))
         (x0 (erlang:list_to_float lon))
         (u (random:uniform))
         (v (random:uniform))
         (w (* r (math:sqrt u)))
         (t (* 2 (math:pi) v))
         (x (* w (math:cos t)))
         (y1 (* w (math:sin t)))
         (x1 (/ x (math:cos y0))))
    `#(,(+ y0 y1) ,(+ x0 x1))))
