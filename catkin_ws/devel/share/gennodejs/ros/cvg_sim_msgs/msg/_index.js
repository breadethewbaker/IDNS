
"use strict";

let RawMagnetic = require('./RawMagnetic.js');
let RawRC = require('./RawRC.js');
let YawrateCommand = require('./YawrateCommand.js');
let VelocityZCommand = require('./VelocityZCommand.js');
let ControllerState = require('./ControllerState.js');
let Altimeter = require('./Altimeter.js');
let Compass = require('./Compass.js');
let Supply = require('./Supply.js');
let ServoCommand = require('./ServoCommand.js');
let ThrustCommand = require('./ThrustCommand.js');
let HeadingCommand = require('./HeadingCommand.js');
let HeightCommand = require('./HeightCommand.js');
let PositionXYCommand = require('./PositionXYCommand.js');
let RC = require('./RC.js');
let VelocityXYCommand = require('./VelocityXYCommand.js');
let Altitude = require('./Altitude.js');
let MotorCommand = require('./MotorCommand.js');
let MotorPWM = require('./MotorPWM.js');
let AttitudeCommand = require('./AttitudeCommand.js');
let RuddersCommand = require('./RuddersCommand.js');
let MotorStatus = require('./MotorStatus.js');
let RawImu = require('./RawImu.js');

module.exports = {
  RawMagnetic: RawMagnetic,
  RawRC: RawRC,
  YawrateCommand: YawrateCommand,
  VelocityZCommand: VelocityZCommand,
  ControllerState: ControllerState,
  Altimeter: Altimeter,
  Compass: Compass,
  Supply: Supply,
  ServoCommand: ServoCommand,
  ThrustCommand: ThrustCommand,
  HeadingCommand: HeadingCommand,
  HeightCommand: HeightCommand,
  PositionXYCommand: PositionXYCommand,
  RC: RC,
  VelocityXYCommand: VelocityXYCommand,
  Altitude: Altitude,
  MotorCommand: MotorCommand,
  MotorPWM: MotorPWM,
  AttitudeCommand: AttitudeCommand,
  RuddersCommand: RuddersCommand,
  MotorStatus: MotorStatus,
  RawImu: RawImu,
};
