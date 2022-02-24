defmodule KnoxWeb.ExampleLive do
  use KnoxWeb, :surface_view

  alias MyAppWeb.Components.ExampleComponent

  def render(assigns) do
    ~F"""
    <Button>Button</Button>

    <ExampleComponent>
      Hi there!
    </ExampleComponent>
    """
  end
end