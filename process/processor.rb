require "fileutils"

Dir.glob("*.txt") do |f|
  record = File.read(f, :encoding => "BINARY").split("\r")
  next unless record[2]
  name = record[0]
  state, district = record[2].split(",")

  p state

  
  label = "#{name} #{district}".gsub(/[.\s]+/,"-") + ".pdf"
  FileUtils.mkdir_p(state)

  FileUtils.cp(f.sub(".txt",".pdf"), "#{state}/#{label}")
end
