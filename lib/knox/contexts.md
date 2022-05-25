# Contexts

## Intro

In Phoenix, contexts often encapsulate data access and data validation. They often talk to a database or APIs. When in doubt, refer to phoenix generators
to generate a context and see what the good conventions are.

Naming things is hard. If you're stuck when trying to come up with a context name when the grouped functionality in your system isn't yet clear, you can simply use the plural form of the resource you're creating. For example, a Products context for managing products. As you grow your application and the parts of your system become clear, you can simply rename the context to a more refined one.

## Example

Generate a Catalog context with a product model

mix phx.gen.html Catalog Product products title:string \
description:string price:decimal views:integer

Web files

Will use the context Catalog

* creating lib/hello_web/controllers/product_controller.ex

* creating lib/hello_web/templates/product/edit.html.heex
* creating lib/hello_web/templates/product/form.html.heex
* creating lib/hello_web/templates/product/index.html.heex
* creating lib/hello_web/templates/product/new.html.heex
* creating lib/hello_web/templates/product/show.html.heex
* creating lib/hello_web/views/product_view.ex
* creating test/hello_web/controllers/product_controller_test.exs

Context files

Just a basic model Hello.Catalog.Product where the model, changeset and validations will live

* creating lib/hello/catalog/product.ex

Just a migration file to create products

* creating priv/repo/migrations/20210201185747_create_products.exs

Hello.Catalog which will be the context. There will be more documentation than code in here

* injecting lib/hello/catalog.ex

Test files

* creating test/hello/catalog_test.exs
* injecting test/hello/catalog_test.exs
* creating test/support/fixtures/catalog_fixtures.ex
* injecting test/support/fixtures/catalog_fixtures.ex

Add the resource to your browser scope in lib/hello_web/router.ex:

    `resources "/products", ProductController`

Remember to update your repository by running migrations:

    `$ mix ecto.migrate`

Say we want to add categories. This fits into the catalogue context so we will simply add a model category and associate it with products. Simply add functions to the context to interact with the new model.

Now we want an new context for Carting our products. We can create a new context ShoppingCart. This does not worry about the rules of our products and catalogue, but rather the basket and pricing of the user's cart. We may have ShoppingCart.CartItem and ShoppingCart.Cart in this context. CartItem will store references to the Product with the price and the quantity. We always try to decouple the code by defining DB rules like :delete_all, etc on the model itself which will clean up say on delete of a cart. Furthermore, try do decouple contexts from not depending on one another. This can be done by using postgres joins and preload data with associations.

