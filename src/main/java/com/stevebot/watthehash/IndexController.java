package com.stevebot.watthehash;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController
{

  @RequestMapping(value="index.html", method=RequestMethod.GET)
  public @ResponseBody String handleDefault(){
      return "Hello";
  }
}
