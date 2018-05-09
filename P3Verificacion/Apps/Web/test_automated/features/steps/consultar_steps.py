from aloe import step, world
from nose.tools import assert_equal, assert_true
from selenium.webdriver.common.by import By

@step('Abro el servidor')
def step_impl(step):
    world.driver.get("http://127.0.0.1:8000/Practica/contador")

@step('Relleno el campo de texto con "([^"]*)"')
def step_impl(step, search_term):
    world.driver.find_element(By.NAME, "mensaje").send_keys(search_term)

@step('Pulso el boton de "([^"]*)"')
def step_impl(step, button):
    world.driver.find_element(By.NAME, button).click()

@step('Y veo el resultado "([^"]*)"')
def step_impl(step, search_result):
    resultado = world.driver.find_element(By.NAME, "resultado").text
    assert_true(resultado, search_result)

@step('Y veo que se ha borrado el texto')
def step_impl(step):
    mensaje = world.driver.find_element(By.NAME, "mensaje").text
    assert not mensaje

@step('Y veo que no hace nada')
def step_impl(step):
    mensaje = world.driver.find_element(By.NAME, "mensaje").text
    assert not mensaje

@step('Y no hay resultado')
def step_impl(step):
    mensaje = world.driver.find_element(By.NAME, "mensaje").text
    assert not mensaje