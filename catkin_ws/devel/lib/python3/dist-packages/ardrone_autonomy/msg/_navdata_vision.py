# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ardrone_autonomy/navdata_vision.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg
import ardrone_autonomy.msg

class navdata_vision(genpy.Message):
  _md5sum = "55dd9a6c13917332d6d39025ed1318ab"
  _type = "ardrone_autonomy/navdata_vision"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header
float64 drone_time
uint16 tag
uint16 size
uint32 vision_state
int32 vision_misc
float32 vision_phi_trim
float32 vision_phi_ref_prop
float32 vision_theta_trim
float32 vision_theta_ref_prop
int32 new_raw_picture
float32 theta_capture
float32 phi_capture
float32 psi_capture
int32 altitude_capture
uint32 time_capture
vector31 body_v
float32 delta_phi
float32 delta_theta
float32 delta_psi
uint32 gold_defined
uint32 gold_reset
float32 gold_x
float32 gold_y

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: ardrone_autonomy/vector31
float32 x
float32 y
float32 z"""
  __slots__ = ['header','drone_time','tag','size','vision_state','vision_misc','vision_phi_trim','vision_phi_ref_prop','vision_theta_trim','vision_theta_ref_prop','new_raw_picture','theta_capture','phi_capture','psi_capture','altitude_capture','time_capture','body_v','delta_phi','delta_theta','delta_psi','gold_defined','gold_reset','gold_x','gold_y']
  _slot_types = ['std_msgs/Header','float64','uint16','uint16','uint32','int32','float32','float32','float32','float32','int32','float32','float32','float32','int32','uint32','ardrone_autonomy/vector31','float32','float32','float32','uint32','uint32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,drone_time,tag,size,vision_state,vision_misc,vision_phi_trim,vision_phi_ref_prop,vision_theta_trim,vision_theta_ref_prop,new_raw_picture,theta_capture,phi_capture,psi_capture,altitude_capture,time_capture,body_v,delta_phi,delta_theta,delta_psi,gold_defined,gold_reset,gold_x,gold_y

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(navdata_vision, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.drone_time is None:
        self.drone_time = 0.
      if self.tag is None:
        self.tag = 0
      if self.size is None:
        self.size = 0
      if self.vision_state is None:
        self.vision_state = 0
      if self.vision_misc is None:
        self.vision_misc = 0
      if self.vision_phi_trim is None:
        self.vision_phi_trim = 0.
      if self.vision_phi_ref_prop is None:
        self.vision_phi_ref_prop = 0.
      if self.vision_theta_trim is None:
        self.vision_theta_trim = 0.
      if self.vision_theta_ref_prop is None:
        self.vision_theta_ref_prop = 0.
      if self.new_raw_picture is None:
        self.new_raw_picture = 0
      if self.theta_capture is None:
        self.theta_capture = 0.
      if self.phi_capture is None:
        self.phi_capture = 0.
      if self.psi_capture is None:
        self.psi_capture = 0.
      if self.altitude_capture is None:
        self.altitude_capture = 0
      if self.time_capture is None:
        self.time_capture = 0
      if self.body_v is None:
        self.body_v = ardrone_autonomy.msg.vector31()
      if self.delta_phi is None:
        self.delta_phi = 0.
      if self.delta_theta is None:
        self.delta_theta = 0.
      if self.delta_psi is None:
        self.delta_psi = 0.
      if self.gold_defined is None:
        self.gold_defined = 0
      if self.gold_reset is None:
        self.gold_reset = 0
      if self.gold_x is None:
        self.gold_x = 0.
      if self.gold_y is None:
        self.gold_y = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.drone_time = 0.
      self.tag = 0
      self.size = 0
      self.vision_state = 0
      self.vision_misc = 0
      self.vision_phi_trim = 0.
      self.vision_phi_ref_prop = 0.
      self.vision_theta_trim = 0.
      self.vision_theta_ref_prop = 0.
      self.new_raw_picture = 0
      self.theta_capture = 0.
      self.phi_capture = 0.
      self.psi_capture = 0.
      self.altitude_capture = 0
      self.time_capture = 0
      self.body_v = ardrone_autonomy.msg.vector31()
      self.delta_phi = 0.
      self.delta_theta = 0.
      self.delta_psi = 0.
      self.gold_defined = 0
      self.gold_reset = 0
      self.gold_x = 0.
      self.gold_y = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_d2HIi4fi3fiI6f2I2f().pack(_x.drone_time, _x.tag, _x.size, _x.vision_state, _x.vision_misc, _x.vision_phi_trim, _x.vision_phi_ref_prop, _x.vision_theta_trim, _x.vision_theta_ref_prop, _x.new_raw_picture, _x.theta_capture, _x.phi_capture, _x.psi_capture, _x.altitude_capture, _x.time_capture, _x.body_v.x, _x.body_v.y, _x.body_v.z, _x.delta_phi, _x.delta_theta, _x.delta_psi, _x.gold_defined, _x.gold_reset, _x.gold_x, _x.gold_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.body_v is None:
        self.body_v = ardrone_autonomy.msg.vector31()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 100
      (_x.drone_time, _x.tag, _x.size, _x.vision_state, _x.vision_misc, _x.vision_phi_trim, _x.vision_phi_ref_prop, _x.vision_theta_trim, _x.vision_theta_ref_prop, _x.new_raw_picture, _x.theta_capture, _x.phi_capture, _x.psi_capture, _x.altitude_capture, _x.time_capture, _x.body_v.x, _x.body_v.y, _x.body_v.z, _x.delta_phi, _x.delta_theta, _x.delta_psi, _x.gold_defined, _x.gold_reset, _x.gold_x, _x.gold_y,) = _get_struct_d2HIi4fi3fiI6f2I2f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_d2HIi4fi3fiI6f2I2f().pack(_x.drone_time, _x.tag, _x.size, _x.vision_state, _x.vision_misc, _x.vision_phi_trim, _x.vision_phi_ref_prop, _x.vision_theta_trim, _x.vision_theta_ref_prop, _x.new_raw_picture, _x.theta_capture, _x.phi_capture, _x.psi_capture, _x.altitude_capture, _x.time_capture, _x.body_v.x, _x.body_v.y, _x.body_v.z, _x.delta_phi, _x.delta_theta, _x.delta_psi, _x.gold_defined, _x.gold_reset, _x.gold_x, _x.gold_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.body_v is None:
        self.body_v = ardrone_autonomy.msg.vector31()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 100
      (_x.drone_time, _x.tag, _x.size, _x.vision_state, _x.vision_misc, _x.vision_phi_trim, _x.vision_phi_ref_prop, _x.vision_theta_trim, _x.vision_theta_ref_prop, _x.new_raw_picture, _x.theta_capture, _x.phi_capture, _x.psi_capture, _x.altitude_capture, _x.time_capture, _x.body_v.x, _x.body_v.y, _x.body_v.z, _x.delta_phi, _x.delta_theta, _x.delta_psi, _x.gold_defined, _x.gold_reset, _x.gold_x, _x.gold_y,) = _get_struct_d2HIi4fi3fiI6f2I2f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_d2HIi4fi3fiI6f2I2f = None
def _get_struct_d2HIi4fi3fiI6f2I2f():
    global _struct_d2HIi4fi3fiI6f2I2f
    if _struct_d2HIi4fi3fiI6f2I2f is None:
        _struct_d2HIi4fi3fiI6f2I2f = struct.Struct("<d2HIi4fi3fiI6f2I2f")
    return _struct_d2HIi4fi3fiI6f2I2f
