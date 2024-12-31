defmodule Anovavoz.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AnovavozWeb.Telemetry,
      Anovavoz.Repo,
      {DNSCluster, query: Application.get_env(:anovavoz, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Anovavoz.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Anovavoz.Finch},
      # Start a worker by calling: Anovavoz.Worker.start_link(arg)
      # {Anovavoz.Worker, arg},
      # Start to serve requests, typically the last entry
      AnovavozWeb.Endpoint,
      TwMerge.Cache
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Anovavoz.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AnovavozWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
