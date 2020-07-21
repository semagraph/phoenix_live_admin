defmodule Phoenix.LiveAdmin.Router do
  @moduledoc """
  Provides LiveView routing for LiveAdmin.
  """

  @doc """
  Defines a LiveAdmin route.

  It expects the `path` the dashboard will be mounted at.

  ## Examples
  
    defmodule MyAppWeb.Router do
      use Phoenix.Router
      import Phoenix.LiveAdmin.Router

      scope "/", MyAppWeb do
        pipe_through [:browser]
        live_admin "/admin"
      end
    end
  """

  defmacro live_admin(path, opts \\ []) do
    quote bind_quoted: binding() do
      scope path, alias: false, as: false do
        import Phoenix.LiveView.Router, only: [live: 4]

        opts = Phoenix.LiveAdmin.Router.__options__(opts)
        live "/", Phoenix.LiveAdmin.HomeLive, :home, opts
        live "/:model/home", Phoenix.LiveAdmin.HomeLive, :home, opts

        # Catch-all for URL generation
        live "/:model/:page", Phoenix.LiveAdmin.HomeLive, :page, :opts
      end
    end
  end

  @doc false
  def __options__(options) do
    live_socket_path = Keyword.get(options, :live_socket_path, "/live")

    [
      session: {__MODULE__, :__session__, []},
      private: %{live_socket_path: live_socket_path},
      layout: {Phoenix.LiveAdmin.LayoutView, :dash},
      as: :live_admin
    ]
  end
end
