;; Auto-generated. Do not edit!


(when (boundp 'ardrone_joy::AutoPilotCmd)
  (if (not (find-package "ARDRONE_JOY"))
    (make-package "ARDRONE_JOY"))
  (shadow 'AutoPilotCmd (find-package "ARDRONE_JOY")))
(unless (find-package "ARDRONE_JOY::AUTOPILOTCMD")
  (make-package "ARDRONE_JOY::AUTOPILOTCMD"))

(in-package "ROS")
;;//! \htmlinclude AutoPilotCmd.msg.html


(defclass ardrone_joy::AutoPilotCmd
  :super ros::object
  :slots (_autopilot_breaker_state _newpos _neworientation _no_of_points _autopilot_mode ))

(defmethod ardrone_joy::AutoPilotCmd
  (:init
   (&key
    ((:autopilot_breaker_state __autopilot_breaker_state) nil)
    ((:newpos __newpos) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:neworientation __neworientation) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:no_of_points __no_of_points) 0)
    ((:autopilot_mode __autopilot_mode) "")
    )
   (send-super :init)
   (setq _autopilot_breaker_state __autopilot_breaker_state)
   (setq _newpos __newpos)
   (setq _neworientation __neworientation)
   (setq _no_of_points (round __no_of_points))
   (setq _autopilot_mode (string __autopilot_mode))
   self)
  (:autopilot_breaker_state
   (&optional __autopilot_breaker_state)
   (if __autopilot_breaker_state (setq _autopilot_breaker_state __autopilot_breaker_state)) _autopilot_breaker_state)
  (:newpos
   (&optional __newpos)
   (if __newpos (setq _newpos __newpos)) _newpos)
  (:neworientation
   (&optional __neworientation)
   (if __neworientation (setq _neworientation __neworientation)) _neworientation)
  (:no_of_points
   (&optional __no_of_points)
   (if __no_of_points (setq _no_of_points __no_of_points)) _no_of_points)
  (:autopilot_mode
   (&optional __autopilot_mode)
   (if __autopilot_mode (setq _autopilot_mode __autopilot_mode)) _autopilot_mode)
  (:serialization-length
   ()
   (+
    ;; bool _autopilot_breaker_state
    1
    ;; float64[] _newpos
    (* 8    (length _newpos)) 4
    ;; float64[] _neworientation
    (* 8    (length _neworientation)) 4
    ;; int8 _no_of_points
    1
    ;; string _autopilot_mode
    4 (length _autopilot_mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _autopilot_breaker_state
       (if _autopilot_breaker_state (write-byte -1 s) (write-byte 0 s))
     ;; float64[] _newpos
     (write-long (length _newpos) s)
     (dotimes (i (length _newpos))
       (sys::poke (elt _newpos i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _neworientation
     (write-long (length _neworientation) s)
     (dotimes (i (length _neworientation))
       (sys::poke (elt _neworientation i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int8 _no_of_points
       (write-byte _no_of_points s)
     ;; string _autopilot_mode
       (write-long (length _autopilot_mode) s) (princ _autopilot_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _autopilot_breaker_state
     (setq _autopilot_breaker_state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64[] _newpos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _newpos (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _newpos i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _neworientation
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _neworientation (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _neworientation i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int8 _no_of_points
     (setq _no_of_points (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _no_of_points 127) (setq _no_of_points (- _no_of_points 256)))
   ;; string _autopilot_mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _autopilot_mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ardrone_joy::AutoPilotCmd :md5sum-) "55b6eb0541581563846f8e0c40c709a5")
(setf (get ardrone_joy::AutoPilotCmd :datatype-) "ardrone_joy/AutoPilotCmd")
(setf (get ardrone_joy::AutoPilotCmd :definition-)
      "bool autopilot_breaker_state
float64[] newpos
float64[] neworientation
int8 no_of_points
string autopilot_mode

")



(provide :ardrone_joy/AutoPilotCmd "55b6eb0541581563846f8e0c40c709a5")


