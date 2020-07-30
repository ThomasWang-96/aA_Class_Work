require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @params = req.params
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise 'Double render' if already_built_response?
    res.redirect(url, status = 302)
    @already_built_response = true
    session.store_session(res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
      raise 'Double render' if already_built_response?
      res.write(content)
      @already_built_response = true
      res.content_type = content_type
      session.store_session(res) 
    end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = "#{self.class}".underscore
    dir_path = File.dirname(__FILE__) 
    path = File.join(dir_path, "..", 'views', controller_name, "#{template_name}.html.erb")
    content = File.read(path)
    template = ERB.new(content).result(binding)
    render_content(template, "text/html")
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    router = Router.new
    router.send(name)
    if !@alreadyalready_built_response
     render(name)
    end
  end
end

