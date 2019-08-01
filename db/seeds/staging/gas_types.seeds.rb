$gas_type_empty = GasType.create({
      name: "---",
      chemical_formula: "---",
      description: """
Gastyp ohne Bezeichnung und Name, wird z.B. für den Leckagesonde Sensor Typen
verwendet.
      """
})
$gas_type_co = GasType.create({
      name: "Kohlenmonoxid",
      chemical_formula: "CO",
      description: """

      """
})
$gas_type_co2 = GasType.create({
      name: "Kohlendioxid",
      chemical_formula: "CO2",
      description: """

      """
})
$gas_type_no = GasType.create({
      name: "Stickstoffmonoxid",
      chemical_formula: "NO",
      description: """

      """
})
$gas_type_no2 = GasType.create({
      name: "Stickstoffdioxid",
      chemical_formula: "NO2",
      description: """

      """
})
$gas_type_hc = GasType.create({
      name: "Kohlenwasserstoffe",
      chemical_formula: "HC",
      description: """

      """
})
$gas_type_h2 = GasType.create({
      name: "Wasserstoff",
      chemical_formula: "H2",
      description: """

      """
})
$gas_type_ch4 = GasType.create({
      name: "Methan",
      chemical_formula: "CH4",
      description: """

      """
})
$gas_type_lpg = GasType.create({
      name: "Autogas",
      chemical_formula: "LPG",
      description: """
https://de.wikipedia.org/wiki/Autogas

Steht für 'Liquefied Petroleum Gas'
      """
})
