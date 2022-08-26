module Response
    def response_pagination(data, data_pagination, message)
      pagination = pagination_setup(data_pagination)
      response_hash = { code: 200, status: :success, message: message, data: data }.merge(pagination: pagination)
      render json: response_hash, status: 200
    end
  
    def response_success(message, data = nil, code = 200)
      render json: { code: code, status: 'success', message: message, data: data }, status: code
    end
  
    def pagination_setup(data)
      { 'current_page': data.current_page,
        'total_pages': data.total_pages,
        'next_page': data.next_page,
        'prev_page': data.prev_page,
        'first_page': data.first_page?,
        'last_page': data.last_page? }
    end

    def response_error(data, code = 502)
      render json: { code: 502, status: :error, message: data }, status: code
    end
end