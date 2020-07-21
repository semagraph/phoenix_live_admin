defmodule Phoenix.AdminLive.HomeLive do
  use Phoenix.AdminLive.Web, :live_view

  @version_sections [
    {:elixir, "Elixir"},
    {:phoenix, "Phoenix"},
    {:dashboard, "Dashboard"}
  ]

  @impl true
  def mount(%{"model" => _} = params, session socket) do
    socket = assign_mount(socket, :home, params, session, true)

    {:ok, socket}
  end

  def mount(_params, _session, socket) do
    {:noreply, assign_params(socket, params)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, assign_params(socket, params)}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div class="">
      <table>
        <thead>
          <tr>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>user@slack.com</th>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end
end
