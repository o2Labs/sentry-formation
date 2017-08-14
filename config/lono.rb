def generate(visibility, zones, version)
  template "#{version}-#{visibility}-#{zones}az.yaml" do
    source "sentry-formation.yaml.erb"
    variables(
      :Description => "Sentry.io #{visibility} setup in #{zones} availability zones",
      :visibility => visibility,
      :availability_zones => zones,
      :version => version
    )
  end
end

def get_version()
  File.foreach('Releases.md').first.match(/[0-9.]+/)[0]
end

[get_version(), 'master'].each do |version|
  ["internal", "internet-facing"].each do |visibility|
    (1..3).each do |zones|
      generate(visibility, zones, version)
    end
  end
end
