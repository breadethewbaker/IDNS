// Auto-generated. Do not edit!

// (in-package ardrone_joy.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GoToPoseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.phi1 = null;
      this.phi2 = null;
      this.phi3 = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('phi1')) {
        this.phi1 = initObj.phi1
      }
      else {
        this.phi1 = 0.0;
      }
      if (initObj.hasOwnProperty('phi2')) {
        this.phi2 = initObj.phi2
      }
      else {
        this.phi2 = 0.0;
      }
      if (initObj.hasOwnProperty('phi3')) {
        this.phi3 = initObj.phi3
      }
      else {
        this.phi3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoToPoseRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [phi1]
    bufferOffset = _serializer.float64(obj.phi1, buffer, bufferOffset);
    // Serialize message field [phi2]
    bufferOffset = _serializer.float64(obj.phi2, buffer, bufferOffset);
    // Serialize message field [phi3]
    bufferOffset = _serializer.float64(obj.phi3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoToPoseRequest
    let len;
    let data = new GoToPoseRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [phi1]
    data.phi1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [phi2]
    data.phi2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [phi3]
    data.phi3 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ardrone_joy/GoToPoseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '25bee84ee6ee3ba4b50689a3eecbd1d1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 z
    float64 phi1
    float64 phi2
    float64 phi3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoToPoseRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.phi1 !== undefined) {
      resolved.phi1 = msg.phi1;
    }
    else {
      resolved.phi1 = 0.0
    }

    if (msg.phi2 !== undefined) {
      resolved.phi2 = msg.phi2;
    }
    else {
      resolved.phi2 = 0.0
    }

    if (msg.phi3 !== undefined) {
      resolved.phi3 = msg.phi3;
    }
    else {
      resolved.phi3 = 0.0
    }

    return resolved;
    }
};

class GoToPoseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoToPoseResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoToPoseResponse
    let len;
    let data = new GoToPoseResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ardrone_joy/GoToPoseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoToPoseResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: GoToPoseRequest,
  Response: GoToPoseResponse,
  md5sum() { return 'f8f1e7d035fd434dffbcb388b3e668a1'; },
  datatype() { return 'ardrone_joy/GoToPose'; }
};
