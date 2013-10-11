# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end

guard 'rspec', after_all_pass: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch('config/routes.rb')

  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    [
      "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/acceptance/#{m[1]}_spec.rb",
      (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" :
                        "spec/requests/#{m[1].singularize}_pages_spec.rb")
    ]
  end
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  watch(%r{^app/views/(.+)/.*\.(erb|haml)$}) do |m|
    [
      "spec/features/#{m[1]}_spec.rb",
      (m[1][/_pages/] ? "spec/requests/#{m[1]}_spec.rb" :
                        "spec/requests/#{m[1].singularize}_pages_spec.rb")
    ]
  end

  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do
   |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
 end
end


guard 'spork', rspec_env: { RAILS_ENV: 'test' },
               cucumber: false,
               test_unit: false  do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end
