
(cl:in-package :asdf)

(defsystem "ardrone_joy-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GoToPose" :depends-on ("_package_GoToPose"))
    (:file "_package_GoToPose" :depends-on ("_package"))
  ))