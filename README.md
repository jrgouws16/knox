# Knox

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.setup`
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Phoenix request lifecycle

Requests goes through

* KnoxWeb.Endpoint (Phoenix.Endpoint) - the initial path that all requests go through. If you want something to happen on all requests, it goes to the endpoint.
* KnoxWeb.Router (Phoenix.Router) - the router is responsible for dispatching verb/path to controllers. The router also allows us to scope functionality. For example, some pages in your application may require user authentication, others may not. The router is also the last plug in the Endpoint
* Controller (Phoenix.Controller) - the job of the controller is to retrieve request information, talk to your business domain, and prepare data for the presentation layer.
* View (Phoenix.View) - the view handles the structured data from the controller and converts it to a presentation to be shown to users.

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
