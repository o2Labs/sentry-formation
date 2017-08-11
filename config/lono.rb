template "sentry-formation-public-1az.yaml" do
  source "sentry-formation.yaml.erb"
  variables(
    :Description => "Sentry.io internet facing setup in only 1 availability zone",
    :visibility => "internet-facing",
    :availability_zones => 1,
  )
end

template "sentry-formation-public-2az.yaml" do
  source "sentry-formation.yaml.erb"
  variables(
    :Description => "Sentry.io internet facing setup across 2 availability zones",
    :visibility => "internet-facing",
    :availability_zones => 2,
  )
end

template "sentry-formation-public-3az.yaml" do
  source "sentry-formation.yaml.erb"
  variables(
    :Description => "Sentry.io internet facing setup across 3 availability zones",
    :visibility => "internet-facing",
    :availability_zones => 3,
  )
end
