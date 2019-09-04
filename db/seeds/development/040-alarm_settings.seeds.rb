AlarmSetting.destroy_all

$alarm_setting1 = AlarmSetting.create!({
  central_device: $central_device1,
  outputs: {
    "A1": "Blitzleuchte, GLT",
    "A2": "Blitzleuchte, Hupe, GLT",
    "A3": "",
    "A4": "",
    "Störung": "GLT"
  }
})

$alarm_setting2 = AlarmSetting.create!({
  central_device: $central_device2,
  outputs: {
    "A1": "Blitzleuchte, GLT",
    "A2": "Blitzleuchte, Hupe, GLT",
    "A3": "",
    "A4": "",
    "Störung": "GLT"
  }
})

$alarm_setting3 = AlarmSetting.create!({
  central_device: $central_device3,
  outputs: {
    "A1": "Blitzleuchte, GLT",
    "A2": "Blitzleuchte, Hupe, GLT",
    "A3": "",
    "A4": "",
    "Störung": "GLT"
  }
})
