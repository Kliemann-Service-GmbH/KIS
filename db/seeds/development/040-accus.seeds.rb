after "development:030-central_devices" do
  Accu.destroy_all

  $accu1 = Accu.create!({
    central_device: $central_device1,
    application_date: Time.now,
    livetime: 2.years.from_now
  })

  $accu2 = Accu.create!({
    central_device: $central_device1,
    application_date: 2.years.from_now,
    livetime: Time.now
  })

  $accu3 = Accu.create!({
    central_device: $central_device1,
    application_date: 5.years.from_now,
    livetime: 3.years.from_now
  })
end
