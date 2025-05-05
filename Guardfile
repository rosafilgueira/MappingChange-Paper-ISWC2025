# Rebuild HTML + PDF when content or styles change
guard :shell do
  watch(%r{^index\.md\.erb$})
  watch(%r{^content/.*\.(md|md\.erb)$})
  watch(%r{^styles/.*\.css$})
  watch(%r{^.*\.bib$})

  command = "bundle exec scholarmarkdown build && weasyprint output/index.html output/paper.pdf && open output/paper.pdf"

  callback(:run_on_modifications) do |_|
    puts "[Guard] 🔄 Rebuilding HTML and PDF..."
    system(command)
  end
end

# Serve files from output/ on http://localhost:3000
guard 'rack', port: 3000 do
  watch('config.ru')
end

