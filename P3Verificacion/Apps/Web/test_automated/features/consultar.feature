Feature: Consultar
  Scenario: Test Normal
    Given Abro el servidor
    When Relleno el campo de texto con "Hola me llamo juan"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('juan', 1), ('llamo', 1), ('hola', 1)]"

  Scenario: Test mayusculas
    Given Abro el servidor
    When Relleno el campo de texto con "HOLA ME LLAMO JUAN"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('juan', 1), ('llamo', 1), ('hola', 1)]"

  Scenario: Test mayusculas con minusculas
    Given Abro el servidor
    When Relleno el campo de texto con "HoLa Me LlAmo JuaN"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('juan', 1), ('llamo', 1), ('hola', 1)]"

  Scenario: Test contar palabras
    Given Abro el servidor
    When Relleno el campo de texto con "hola me llamo juan hola"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('hola', 2), ('juan', 1), ('llamo', 1)]"

  Scenario: Test contar palabras mayusculas con minusculas
    Given Abro el servidor
    When Relleno el campo de texto con "HoLa hOlA mE LlaMo JuAn"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('hola', 2), ('juan', 1), ('llamo', 1)]"
Scenario: Test articulos
    Given Abro el servidor
    When Relleno el campo de texto con "El perro perro de mi primo es de color marron"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('perro', 2), ('marron', 1), ('color', 1), ('es', 1), ('primo', 1)]"

  Scenario: Test preposiciones
    Given Abro el servidor
    When Relleno el campo de texto con "El coche coche se dirige hacia el colegio"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('coche', 2), ('colegio', 1), ('dirige', 1)]"

  Scenario: Test pronombres
    Given Abro el servidor
    When Relleno el campo de texto con "Aquellos chicos juegan al futbol, mientras que esos chicos a las canicas"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('chicos', 2), ('canicas', 1), ('mientras', 1), ('futbol', 1), ('juegan', 1)]"

  Scenario: Test puntuacion
    Given Abro el servidor
    When Relleno el campo de texto con "Los chicos de mi clase estudian ingles, los chicos de segundo frances, y los chicos de tercero italiano."
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('chicos', 3), ('italiano', 1), ('tercero', 1), ('frances', 1), ('segundo', 1), ('ingles', 1), ('estudian', 1), ('clase', 1)]"

  Scenario: Test espacio al principio
    Given Abro el servidor
    When Relleno el campo de texto con " La prueba de que el texto empiece por un espacio espacio"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('espacio', 2), ('empiece', 1), ('texto', 1), ('prueba', 1)]"

  Scenario: Test espacio al final
    Given Abro el servidor
    When Relleno el campo de texto con "La prueba de que el texto termine por un espacio espacio "
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('espacio', 2), ('termine', 1), ('texto', 1), ('prueba', 1)]"
Scenario: Test mas de un espacio entre palabras
    Given Abro el servidor
    When Relleno el campo de texto con "La prueba    de         que  el    texto    tenga  mas de un           espacio                espacio"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('espacio', 2), ('tenga', 1), ('texto', 1), ('prueba', 1)]"

  Scenario: Test caracteres raros
    Given Abro el servidor
    When Relleno el campo de texto con "El * texto tiene carateres raros"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('raros', 1), ('carateres', 1), ('tiene', 1), ('texto', 1)]"

  Scenario: Test caracteres raros mayusculas con minusculas
    Given Abro el servidor
    When Relleno el campo de texto con "TiEnE .carateres    raROS  "
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado "[('raros', 1), ('carateres', 1), ('tiene', 1), ('texto', 1)]"

  Scenario: Test vacio
    Given Abro el servidor
    When Relleno el campo de texto con ""
    Then Pulso el boton de "ejecutar"
    And Y no hay resultado

  Scenario: Test stopword
    Given Abro el servidor
    When Relleno el campo de texto con "pero"
    Then Pulso el boton de "ejecutar"
    And Y veo el resultado ""

  Scenario: Pulsar reset
    Given Abro el servidor
    When Relleno el campo de texto con "Hola mundo"
    Then Pulso el boton de "resetear"
    And Y veo que se ha borrado el texto

  Scenario: Pulsar ejecutar sin texto
    Given Abro el servidor
    Then Pulso el boton de "ejecutar"
    And Y veo que no hace nada