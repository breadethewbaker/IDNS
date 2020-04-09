; Auto-generated. Do not edit!


(cl:in-package ardrone_joy-msg)


;//! \htmlinclude AutoPilotCmd.msg.html

(cl:defclass <AutoPilotCmd> (roslisp-msg-protocol:ros-message)
  ((autopilot_breaker_state
    :reader autopilot_breaker_state
    :initarg :autopilot_breaker_state
    :type cl:boolean
    :initform cl:nil)
   (newpos
    :reader newpos
    :initarg :newpos
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (neworientation
    :reader neworientation
    :initarg :neworientation
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (no_of_points
    :reader no_of_points
    :initarg :no_of_points
    :type cl:fixnum
    :initform 0)
   (autopilot_mode
    :reader autopilot_mode
    :initarg :autopilot_mode
    :type cl:string
    :initform ""))
)

(cl:defclass AutoPilotCmd (<AutoPilotCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AutoPilotCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AutoPilotCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ardrone_joy-msg:<AutoPilotCmd> is deprecated: use ardrone_joy-msg:AutoPilotCmd instead.")))

(cl:ensure-generic-function 'autopilot_breaker_state-val :lambda-list '(m))
(cl:defmethod autopilot_breaker_state-val ((m <AutoPilotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-msg:autopilot_breaker_state-val is deprecated.  Use ardrone_joy-msg:autopilot_breaker_state instead.")
  (autopilot_breaker_state m))

(cl:ensure-generic-function 'newpos-val :lambda-list '(m))
(cl:defmethod newpos-val ((m <AutoPilotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-msg:newpos-val is deprecated.  Use ardrone_joy-msg:newpos instead.")
  (newpos m))

(cl:ensure-generic-function 'neworientation-val :lambda-list '(m))
(cl:defmethod neworientation-val ((m <AutoPilotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-msg:neworientation-val is deprecated.  Use ardrone_joy-msg:neworientation instead.")
  (neworientation m))

(cl:ensure-generic-function 'no_of_points-val :lambda-list '(m))
(cl:defmethod no_of_points-val ((m <AutoPilotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-msg:no_of_points-val is deprecated.  Use ardrone_joy-msg:no_of_points instead.")
  (no_of_points m))

(cl:ensure-generic-function 'autopilot_mode-val :lambda-list '(m))
(cl:defmethod autopilot_mode-val ((m <AutoPilotCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-msg:autopilot_mode-val is deprecated.  Use ardrone_joy-msg:autopilot_mode instead.")
  (autopilot_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AutoPilotCmd>) ostream)
  "Serializes a message object of type '<AutoPilotCmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'autopilot_breaker_state) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'newpos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'newpos))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'neworientation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'neworientation))
  (cl:let* ((signed (cl:slot-value msg 'no_of_points)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'autopilot_mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'autopilot_mode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AutoPilotCmd>) istream)
  "Deserializes a message object of type '<AutoPilotCmd>"
    (cl:setf (cl:slot-value msg 'autopilot_breaker_state) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'newpos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'newpos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'neworientation) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'neworientation)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'no_of_points) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'autopilot_mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'autopilot_mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AutoPilotCmd>)))
  "Returns string type for a message object of type '<AutoPilotCmd>"
  "ardrone_joy/AutoPilotCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AutoPilotCmd)))
  "Returns string type for a message object of type 'AutoPilotCmd"
  "ardrone_joy/AutoPilotCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AutoPilotCmd>)))
  "Returns md5sum for a message object of type '<AutoPilotCmd>"
  "55b6eb0541581563846f8e0c40c709a5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AutoPilotCmd)))
  "Returns md5sum for a message object of type 'AutoPilotCmd"
  "55b6eb0541581563846f8e0c40c709a5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AutoPilotCmd>)))
  "Returns full string definition for message of type '<AutoPilotCmd>"
  (cl:format cl:nil "bool autopilot_breaker_state~%float64[] newpos~%float64[] neworientation~%int8 no_of_points~%string autopilot_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AutoPilotCmd)))
  "Returns full string definition for message of type 'AutoPilotCmd"
  (cl:format cl:nil "bool autopilot_breaker_state~%float64[] newpos~%float64[] neworientation~%int8 no_of_points~%string autopilot_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AutoPilotCmd>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'newpos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'neworientation) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     4 (cl:length (cl:slot-value msg 'autopilot_mode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AutoPilotCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'AutoPilotCmd
    (cl:cons ':autopilot_breaker_state (autopilot_breaker_state msg))
    (cl:cons ':newpos (newpos msg))
    (cl:cons ':neworientation (neworientation msg))
    (cl:cons ':no_of_points (no_of_points msg))
    (cl:cons ':autopilot_mode (autopilot_mode msg))
))
