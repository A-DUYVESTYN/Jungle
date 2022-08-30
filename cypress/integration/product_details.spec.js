/// <reference types="cypress" />
describe('Jungle app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')

  })
  it("User can click on a product on the homepage", () => {
    cy.get('article:first').click().should("be.visible")
    cy.get('section').should('have.class', 'products-show')
    
  });

})
