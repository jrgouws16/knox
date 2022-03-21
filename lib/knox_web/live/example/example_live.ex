defmodule KnoxWeb.ExampleLive do
  @moduledoc """
  Basic LiveView to get things started.
  """

  use KnoxWeb, :surface_view

  alias SurfaceBulma.Button

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~F"""
    <Button size="large" color="primary">Large</Button>
    """
  end
end
