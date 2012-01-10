## History

---

### 2012-01-10 / 0.0.2

xl-alexandria 0.0.2 リリース!

  * parse-body が interactive 式も取り出せるようになりました (by @bowbow99)。

    ```lisp
    (ansify:destructuring-bind (defun name lambda-list &rest body)
        '(defun foobar-region (start end)
          "foobar region"
          (interactive "*r")
          (delete-region start end)
          (insert "foobar"))
      (alexandria:parse-body body :documentation t :interactive t))
    ;=> ((delete-region start end) (insert "foobar"))
    ;   nil
    ;   "foobar region"
    ;   (interactive "*r")
    ```

  * symbolicate が動作していなかったのを修正

    ```lisp
    (alexandria:symbolicate "prefix-" :foo)
    ;=> prefix-foo
    ```

  * upstream の変更を取り込み ([3eacfac87b2...77b219a8361](https://github.com/miyamuko/xl-alexandria/compare/3eacfac87b27654f7ca9eeaf1ce40344b8136b03...77b219a8361b9549aeb8941afc945fa2e3c84eb9))


---

### 2011-10-29 / 0.0.1

xl-alexandria 0.0.1 リリース!
