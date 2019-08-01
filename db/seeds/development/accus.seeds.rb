$accus = Accu.create(
  [
    {
      central_device: $central_device_avl,
      application_date: DateTime.parse("01.06.2019"),
      livetime: 2.years.since(DateTime.parse("01.06.2019"))
    }
  ]
)
