defmodule AnovavozWeb.BrSenatorLive.SwiftUI do
  use AnovavozNative, [:render_component, format: :swiftui]

  def render(assigns, interface) do
    target = Map.get(interface, "target", "ios")
    assigns = assign(assigns, :target, target)

    ~LVN"""

    <VStack style="padding();" spacing={32}>
      <Grid alignment="leading" horizontalSpacing={16} verticalSpacing={16}>
        <.feature
          name="Você está acompanhando XX senadores"
          button_name="Acompanhar Senadores"
          icon="wand.and.sparkles"
          description="Você pode escolher até três senadores e acompanhar as votações no Senado e Congresso Nacional."
        />
        <.feature
          name="Deixar de Acompanhar Senador"
          icon="mappin.and.ellipse"
          button_name="Deixar de Acompanhar Senadores"
          description="Caso quiser deixar de acompanhar um senador."
          style="foregroundStyle(.red);"
        />
        <.feature
          name="Lista de Senadores que Acompanho"
          icon="chart.line.uptrend.xyaxis"
          button_name="Listar Senadores"
          description="Você pode ver a sua lista de senadores."
          style="foregroundStyle(.purple);"
        />
      </Grid>
      <Spacer />
    </VStack>
    """
  end

  attr :icon, :string
  attr :name, :string
  attr :description, :string
  attr :button_name, :string
  attr :rest, :global

  def feature(assigns) do
    ~LVN"""
    <GridRow>
      <Group style="foregroundStyle(.tint); font(.largeTitle); symbolRenderingMode(.hierarchical);">
        <Image
          systemName={@icon}
          {@rest}
        />
      </Group>
      <VStack alignment="leading" style="font(.subheadline);">
        <Text style="bold();"><%= @name %></Text>
        <Text style="foregroundStyle(.secondary);"><%= @description %></Text>
        <Button style="buttonStyle(.borderedProminent); controlSize(.large);">
          <Text style="frame(maxWidth: .infinity);"><%= @button_name %></Text>
        </Button>
        <Spacer />
      </VStack>
    </GridRow>
    """
  end
end
