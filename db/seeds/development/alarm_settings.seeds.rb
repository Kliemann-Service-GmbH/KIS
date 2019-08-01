$alarm_settings = AlarmSetting.create(
  [
    {
      central_device: $central_devices_mcs_4000,
      outputs: {
        "A1": "Blitzleuchte, GLT",
        "A2": "Blitzleuchte, Hupe, GLT",
        "A3": "",
        "A4": "",
        "Störung": "GLT"
      }
    }
  ]
)
