namespace 'build' do

  desc "build core require file"
  task :core do
    libs = []
    Dir.chdir('lib/core/facets') do
      libs = Dir['**/*'].select{ |f| File.file?(f) }
      #libs += `grep -R '#\s*:facets:\s*extra' *`.split("\n")
      #libs += `grep -R '#\s*:facets:\s*standard' *`.split("\n")
      #libs.map{ |l| l.split(':')[0] }
    end
    File.open('lib/core/facets.rb', 'w') do |f|
      f << "# Generated #{Time.now}\n"
      libs.each do |l|
        f << "require 'facets/#{l}'\n"
      end
    end
    puts "Updated lib/core/facets.rb"
  end

end
