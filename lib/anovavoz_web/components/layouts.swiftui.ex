defmodule AnovavozWeb.Layouts.SwiftUI do
  use AnovavozNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
