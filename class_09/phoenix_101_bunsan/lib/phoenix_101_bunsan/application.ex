defmodule Phoenix101Bunsan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Phoenix101Bunsan.Repo,
      # Start the Telemetry supervisor
      Phoenix101BunsanWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phoenix101Bunsan.PubSub},
      # Start the Endpoint (http/https)
      Phoenix101BunsanWeb.Endpoint
      # Start a worker by calling: Phoenix101Bunsan.Worker.start_link(arg)
      # {Phoenix101Bunsan.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phoenix101Bunsan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Phoenix101BunsanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
