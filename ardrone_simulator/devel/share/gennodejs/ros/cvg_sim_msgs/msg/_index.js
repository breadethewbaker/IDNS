
"use strict";

let Compass = require('./Compass.js');
let RawMagnetic = require('./RawMagnetic.js');
let Supply = require('./Supply.js');
let Altitude = require('./Altitude.js');
let HeightCommand = require('./HeightCommand.js');
let MotorStatus = require('./MotorStatus.js');
let AttitudeCommand = require('./AttitudeCommand.js');
let RawRC = require('./RawRC.js');
let ThrustCommand = require('./ThrustCommand.js');
let ControllerState = require('./ControllerState.js');
let RC = require('./RC.js');
let HeadingCommand = require('./HeadingCommand.js');
let VelocityXYCommand = require('./VelocityXYCommand.js');
let RuddersCommand = require('./RuddersCommand.js');
let MotorPWM = require('./MotorPWM.js');
let ServoCommand = require('./ServoCommand.js');
let Altimeter = require('./Altimeter.js');
let PositionXYCommand = require('./PositionXYCommand.js');
let YawrateCommand = require('./YawrateCommand.js');
let RawImu = require('./RawImu.js');
let VelocityZCommand = require('./VelocityZCommand.js');
let MotorCommand = require('./MotorCommand.js');

module.exports = {
  Compass: Compass,
  RawMagnetic: RawMagnetic,
  Supply: Supply,
  Altitude: Altitude,
  HeightCommand: HeightCommand,
  MotorStatus: MotorStatus,
  AttitudeCommand: AttitudeCommand,
  RawRC: RawRC,
  ThrustCommand: ThrustCommand,
  ControllerState: ControllerState,
  RC: RC,
  HeadingCommand: HeadingCommand,
  VelocityXYCommand: VelocityXYCommand,
  RuddersCommand: RuddersCommand,
  MotorPWM: MotorPWM,
  ServoCommand: ServoCommand,
  Altimeter: Altimeter,
  PositionXYCommand: PositionXYCommand,
  YawrateCommand: YawrateCommand,
  RawImu: RawImu,
  VelocityZCommand: VelocityZCommand,
  MotorCommand: MotorCommand,
};
