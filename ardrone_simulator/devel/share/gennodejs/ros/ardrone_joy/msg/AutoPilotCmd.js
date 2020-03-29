// Auto-generated. Do not edit!

// (in-package ardrone_joy.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class AutoPilotCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.autopilot_breaker_state = null;
      this.newpos = null;
      this.neworientation = null;
      this.no_of_points = null;
      this.autopilot_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('autopilot_breaker_state')) {
        this.autopilot_breaker_state = initObj.autopilot_breaker_state
      }
      else {
        this.autopilot_breaker_state = false;
      }
      if (initObj.hasOwnProperty('newpos')) {
        this.newpos = initObj.newpos
      }
      else {
        this.newpos = [];
      }
      if (initObj.hasOwnProperty('neworientation')) {
        this.neworientation = initObj.neworientation
      }
      else {
        this.neworientation = [];
      }
      if (initObj.hasOwnProperty('no_of_points')) {
        this.no_of_points = initObj.no_of_points
      }
      else {
        this.no_of_points = 0;
      }
      if (initObj.hasOwnProperty('autopilot_mode')) {
        this.autopilot_mode = initObj.autopilot_mode
      }
      else {
        this.autopilot_mode = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AutoPilotCmd
    // Serialize message field [autopilot_breaker_state]
    bufferOffset = _serializer.bool(obj.autopilot_breaker_state, buffer, bufferOffset);
    // Serialize message field [newpos]
    bufferOffset = _arraySerializer.float64(obj.newpos, buffer, bufferOffset, null);
    // Serialize message field [neworientation]
    bufferOffset = _arraySerializer.float64(obj.neworientation, buffer, bufferOffset, null);
    // Serialize message field [no_of_points]
    bufferOffset = _serializer.int8(obj.no_of_points, buffer, bufferOffset);
    // Serialize message field [autopilot_mode]
    bufferOffset = _serializer.string(obj.autopilot_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AutoPilotCmd
    let len;
    let data = new AutoPilotCmd(null);
    // Deserialize message field [autopilot_breaker_state]
    data.autopilot_breaker_state = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [newpos]
    data.newpos = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [neworientation]
    data.neworientation = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [no_of_points]
    data.no_of_points = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [autopilot_mode]
    data.autopilot_mode = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.newpos.length;
    length += 8 * object.neworientation.length;
    length += object.autopilot_mode.length;
    return length + 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ardrone_joy/AutoPilotCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '55b6eb0541581563846f8e0c40c709a5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool autopilot_breaker_state
    float64[] newpos
    float64[] neworientation
    int8 no_of_points
    string autopilot_mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AutoPilotCmd(null);
    if (msg.autopilot_breaker_state !== undefined) {
      resolved.autopilot_breaker_state = msg.autopilot_breaker_state;
    }
    else {
      resolved.autopilot_breaker_state = false
    }

    if (msg.newpos !== undefined) {
      resolved.newpos = msg.newpos;
    }
    else {
      resolved.newpos = []
    }

    if (msg.neworientation !== undefined) {
      resolved.neworientation = msg.neworientation;
    }
    else {
      resolved.neworientation = []
    }

    if (msg.no_of_points !== undefined) {
      resolved.no_of_points = msg.no_of_points;
    }
    else {
      resolved.no_of_points = 0
    }

    if (msg.autopilot_mode !== undefined) {
      resolved.autopilot_mode = msg.autopilot_mode;
    }
    else {
      resolved.autopilot_mode = ''
    }

    return resolved;
    }
};

module.exports = AutoPilotCmd;
