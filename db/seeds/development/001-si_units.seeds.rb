SiUnit.destroy_all

$si_unit1 = SiUnit.create!({
  name: "SiUnit1"
})

$si_unit2 = SiUnit.create!({
  name: "SiUnit2"
})

$si_unit3 = SiUnit.create!({
  name: "SiUnit3"
})


$si_unit_empty = SiUnit.create!({
  name: "---"
})

$si_unit_ppm = SiUnit.create!({
  name: "ppm"
})

$si_unit_ueg = SiUnit.create!({
  name: "% UEG"
})

$si_unit_vol = SiUnit.create!({
  name: "Vol %"
})
