(in-package #:lift)

(defgeneric do-test (testsuite test-case-name result))

(defgeneric testsuite-setup (testsuite result)
  (:documentation "Setup at the testsuite-level"))

(defgeneric testsuite-expects-error (testsuite)
  (:documentation 
   "Returns whether or not the testsuite as a whole expects an error."))
  
(defgeneric testsuite-expects-failure (testsuite)
  (:documentation 
   "Returns whether or not the testsuite as a whole expects to fail."))

(defgeneric testsuite-teardown (testsuite result)
  (:documentation "Cleanup at the testsuite level."))

(defgeneric setup-test (testsuite)
  (:documentation "Setup for a test-case. By default it does nothing."))

(defgeneric test-case-teardown (testsuite result)
  (:documentation "Tear-down a test-case. By default it does nothing.")
  (:method-combination progn :most-specific-first))

(defgeneric testsuite-methods (testsuite)
  (:documentation "Returns a list of the test methods defined for test. I.e.,
the methods that should be run to do the tests for this test."))

(defgeneric testsuite-p (thing)
  (:documentation "Determine whether or not `thing` is a testsuite. Thing can be a symbol naming a suite, a subclass of `test-mixin` or an instance of a test suite. Returns nil if `thing` is not a testsuite and the symbol naming the suite if it is."))

(defgeneric testsuite-name->gf (case name)
  (:documentation ""))

(defgeneric testsuite-name->method (class name)
  (:documentation ""))

(defgeneric flet-test-function (testsuite function-name &rest args)
  (:documentation ""))

(defgeneric equality-test (testsuite)
  (:documentation ""))

;;?? probably just defuns (since they are hard to specialize on in any case)
;;?? or change signature to take testsuite instead of suite-name
(defgeneric skip-test-case (result suite-name test-case-name))
(defgeneric skip-testsuite (result suite-name))

(defgeneric describe-test-result (result stream &key &allow-other-keys)
  )

(defgeneric write-profile-information (testsuite))

(defgeneric block-handler (name value)
  (:documentation "")
  (:method ((name t) (value t))
           (error "Unknown clause: ~A" name)))

