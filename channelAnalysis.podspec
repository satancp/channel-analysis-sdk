Pod::Spec.new do |spec|
  spec.name = "channelAnalysis"
  spec.version = "1.0.0"
  spec.summary = "Channel analysis framework"
  spec.homepage = "https://github.com/satancp/channel-analysis-sdk"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Chris" => 'zx603852402@gmail.com' }

  spec.platform = :ios, "9.3"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/satancp/channel-analysis-sdk.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "*"
end