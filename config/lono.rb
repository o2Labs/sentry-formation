(1..3).each do |zones|
  template "sentry-formation-public-#{zones}az.yaml" do
    source "sentry-formation.yaml.erb"
    variables(
        :Description => "Sentry.io internet facing setup in #{zones} availability zones",
        :visibility => "internet-facing",
        :availability_zones => zones,
    )
  end
end

(1..3).each do |zones|
  template "sentry-formation-internal-#{zones}az.yaml" do
    source "sentry-formation.yaml.erb"
    variables(
      :Description => "Sentry.io internal setup in #{zones} availability zones",
      :visibility => "internal",
      :availability_zones => zones,
    )
  end
end
