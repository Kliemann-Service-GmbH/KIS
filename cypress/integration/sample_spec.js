describe('The Welcome Page', function() {
  beforeEach(function() {

  })

  it('On welcome searchs the customer!', function() {
    cy.visit('/')

    cy.get('input#q.input').type(1)

    cy.get('input[type=submit]').click()

    cy.screenshot()
  })


  it('it has a customers page',function() {
      cy.visit('/customers')

      cy.get('input#q.input').type(1)

      cy.get('input[type=submit]').click()

      cy.screenshot()
  })

  it('it has a service_objects page',function() {
      cy.visit('/service_objects')

      cy.get('input#q.input').type(1)

      cy.get('input[type=submit]').click()

      cy.screenshot()
  })

  it('it has a central_devices page',function() {
    cy.visit('/central_devices')

    cy.get('input#q.input').type(1)

    cy.get('input[type=submit]').click()

          cy.screenshot()
  })

  it('it has a addresses page',function() {
    cy.visit('/addresses')

    cy.get('input#q.input').type(1)

    cy.get('input[type=submit]').click()

    cy.screenshot()
  })

  it('it has a service_protocols page',function() {
      cy.visit('/service_protocols')

      cy.get('input#q.input').type(1)

      cy.get('input[type=submit]').click()

      cy.screenshot()
  })
})
