; Auto-generated. Do not edit!


(cl:in-package ardrone_joy-srv)


;//! \htmlinclude GoToPose-request.msg.html

(cl:defclass <GoToPose-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (phi1
    :reader phi1
    :initarg :phi1
    :type cl:float
    :initform 0.0)
   (phi2
    :reader phi2
    :initarg :phi2
    :type cl:float
    :initform 0.0)
   (phi3
    :reader phi3
    :initarg :phi3
    :type cl:float
    :initform 0.0))
)

(cl:defclass GoToPose-request (<GoToPose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToPose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToPose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ardrone_joy-srv:<GoToPose-request> is deprecated: use ardrone_joy-srv:GoToPose-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <GoToPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-srv:x-val is deprecated.  Use ardrone_joy-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <GoToPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-srv:y-val is deprecated.  Use ardrone_joy-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <GoToPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-srv:z-val is deprecated.  Use ardrone_joy-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'phi1-val :lambda-list '(m))
(cl:defmethod phi1-val ((m <GoToPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-srv:phi1-val is deprecated.  Use ardrone_joy-srv:phi1 instead.")
  (phi1 m))

(cl:ensure-generic-function 'phi2-val :lambda-list '(m))
(cl:defmethod phi2-val ((m <GoToPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-srv:phi2-val is deprecated.  Use ardrone_joy-srv:phi2 instead.")
  (phi2 m))

(cl:ensure-generic-function 'phi3-val :lambda-list '(m))
(cl:defmethod phi3-val ((m <GoToPose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-srv:phi3-val is deprecated.  Use ardrone_joy-srv:phi3 instead.")
  (phi3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToPose-request>) ostream)
  "Serializes a message object of type '<GoToPose-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'phi1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'phi2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'phi3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToPose-request>) istream)
  "Deserializes a message object of type '<GoToPose-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'phi1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'phi2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'phi3) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToPose-request>)))
  "Returns string type for a service object of type '<GoToPose-request>"
  "ardrone_joy/GoToPoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPose-request)))
  "Returns string type for a service object of type 'GoToPose-request"
  "ardrone_joy/GoToPoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToPose-request>)))
  "Returns md5sum for a message object of type '<GoToPose-request>"
  "f8f1e7d035fd434dffbcb388b3e668a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToPose-request)))
  "Returns md5sum for a message object of type 'GoToPose-request"
  "f8f1e7d035fd434dffbcb388b3e668a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToPose-request>)))
  "Returns full string definition for message of type '<GoToPose-request>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%float64 phi1~%float64 phi2~%float64 phi3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToPose-request)))
  "Returns full string definition for message of type 'GoToPose-request"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%float64 phi1~%float64 phi2~%float64 phi3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToPose-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToPose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToPose-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':phi1 (phi1 msg))
    (cl:cons ':phi2 (phi2 msg))
    (cl:cons ':phi3 (phi3 msg))
))
;//! \htmlinclude GoToPose-response.msg.html

(cl:defclass <GoToPose-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GoToPose-response (<GoToPose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToPose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToPose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ardrone_joy-srv:<GoToPose-response> is deprecated: use ardrone_joy-srv:GoToPose-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GoToPose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ardrone_joy-srv:success-val is deprecated.  Use ardrone_joy-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToPose-response>) ostream)
  "Serializes a message object of type '<GoToPose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToPose-response>) istream)
  "Deserializes a message object of type '<GoToPose-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToPose-response>)))
  "Returns string type for a service object of type '<GoToPose-response>"
  "ardrone_joy/GoToPoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPose-response)))
  "Returns string type for a service object of type 'GoToPose-response"
  "ardrone_joy/GoToPoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToPose-response>)))
  "Returns md5sum for a message object of type '<GoToPose-response>"
  "f8f1e7d035fd434dffbcb388b3e668a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToPose-response)))
  "Returns md5sum for a message object of type 'GoToPose-response"
  "f8f1e7d035fd434dffbcb388b3e668a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToPose-response>)))
  "Returns full string definition for message of type '<GoToPose-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToPose-response)))
  "Returns full string definition for message of type 'GoToPose-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToPose-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToPose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToPose-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GoToPose)))
  'GoToPose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GoToPose)))
  'GoToPose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPose)))
  "Returns string type for a service object of type '<GoToPose>"
  "ardrone_joy/GoToPose")