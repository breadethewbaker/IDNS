;; Auto-generated. Do not edit!


(when (boundp 'ardrone_joy::GoToPose)
  (if (not (find-package "ARDRONE_JOY"))
    (make-package "ARDRONE_JOY"))
  (shadow 'GoToPose (find-package "ARDRONE_JOY")))
(unless (find-package "ARDRONE_JOY::GOTOPOSE")
  (make-package "ARDRONE_JOY::GOTOPOSE"))
(unless (find-package "ARDRONE_JOY::GOTOPOSEREQUEST")
  (make-package "ARDRONE_JOY::GOTOPOSEREQUEST"))
(unless (find-package "ARDRONE_JOY::GOTOPOSERESPONSE")
  (make-package "ARDRONE_JOY::GOTOPOSERESPONSE"))

(in-package "ROS")





(defclass ardrone_joy::GoToPoseRequest
  :super ros::object
  :slots (_x _y _z _phi1 _phi2 _phi3 ))

(defmethod ardrone_joy::GoToPoseRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:phi1 __phi1) 0.0)
    ((:phi2 __phi2) 0.0)
    ((:phi3 __phi3) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _phi1 (float __phi1))
   (setq _phi2 (float __phi2))
   (setq _phi3 (float __phi3))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:phi1
   (&optional __phi1)
   (if __phi1 (setq _phi1 __phi1)) _phi1)
  (:phi2
   (&optional __phi2)
   (if __phi2 (setq _phi2 __phi2)) _phi2)
  (:phi3
   (&optional __phi3)
   (if __phi3 (setq _phi3 __phi3)) _phi3)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _phi1
    8
    ;; float64 _phi2
    8
    ;; float64 _phi3
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _phi1
       (sys::poke _phi1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _phi2
       (sys::poke _phi2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _phi3
       (sys::poke _phi3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _phi1
     (setq _phi1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _phi2
     (setq _phi2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _phi3
     (setq _phi3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ardrone_joy::GoToPoseResponse
  :super ros::object
  :slots (_success ))

(defmethod ardrone_joy::GoToPoseResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ardrone_joy::GoToPose
  :super ros::object
  :slots ())

(setf (get ardrone_joy::GoToPose :md5sum-) "f8f1e7d035fd434dffbcb388b3e668a1")
(setf (get ardrone_joy::GoToPose :datatype-) "ardrone_joy/GoToPose")
(setf (get ardrone_joy::GoToPose :request) ardrone_joy::GoToPoseRequest)
(setf (get ardrone_joy::GoToPose :response) ardrone_joy::GoToPoseResponse)

(defmethod ardrone_joy::GoToPoseRequest
  (:response () (instance ardrone_joy::GoToPoseResponse :init)))

(setf (get ardrone_joy::GoToPoseRequest :md5sum-) "f8f1e7d035fd434dffbcb388b3e668a1")
(setf (get ardrone_joy::GoToPoseRequest :datatype-) "ardrone_joy/GoToPoseRequest")
(setf (get ardrone_joy::GoToPoseRequest :definition-)
      "float64 x
float64 y
float64 z
float64 phi1
float64 phi2
float64 phi3
---
bool success
")

(setf (get ardrone_joy::GoToPoseResponse :md5sum-) "f8f1e7d035fd434dffbcb388b3e668a1")
(setf (get ardrone_joy::GoToPoseResponse :datatype-) "ardrone_joy/GoToPoseResponse")
(setf (get ardrone_joy::GoToPoseResponse :definition-)
      "float64 x
float64 y
float64 z
float64 phi1
float64 phi2
float64 phi3
---
bool success
")



(provide :ardrone_joy/GoToPose "f8f1e7d035fd434dffbcb388b3e668a1")


