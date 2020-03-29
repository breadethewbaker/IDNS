
(cl:in-package :asdf)

(defsystem "ardrone_joy-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AutoPilotCmd" :depends-on ("_package_AutoPilotCmd"))
    (:file "_package_AutoPilotCmd" :depends-on ("_package"))
    (:file "IntList" :depends-on ("_package_IntList"))
    (:file "_package_IntList" :depends-on ("_package"))
  ))