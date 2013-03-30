module HttpParamsGet

  def buildgetrequest(domain, path, params)
    path_section="#{path}?"

    all_params=params.collect { |k,v| 
      "#{k}=#{CGI::escape(v.to_s)}".delete "@"
    }

    joined_params=all_params.join('&')

	return domain.concat(path_section.concat(joined_params))
  end
end