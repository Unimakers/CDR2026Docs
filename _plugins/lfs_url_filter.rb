module Jekyll
  module LFSURLFilter
    def lfs_url(path)
      if path.start_with?('/')
        owner = ENV['REPO_OWNER'] || 'Unimakers'
        repo = ENV['REPO_NAME'] || 'CDR2026Docs'
        branch = ENV['REPO_BRANCH'] || 'main'
        "https://media.githubusercontent.com/media/#{owner}/#{repo}/refs/heads/#{branch}#{path}"
      else
        path
      end
    end
  end
end
Liquid::Template.register_filter(Jekyll::LFSURLFilter)