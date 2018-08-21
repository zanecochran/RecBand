PrintWriter output;


void dataHeader(){
  output = createWriter(filename); 

  // Data Header
  output.println("% 1. Title: " + title);  
  output.println("% 2. Sources: " + username);  
  output.println("@RELATION gestures");
    
  // Attributes Header
  for (int i = 0; i < windows; i++){
    output.println("@ATTRIBUTE XMeanWindow" + (i) + "  NUMERIC");  
    output.println("@ATTRIBUTE XSDWindow" + (i) + "   NUMERIC");  
    output.println("@ATTRIBUTE YMeanWindow" + (i) + "  NUMERIC");  
    output.println("@ATTRIBUTE YSDWindow" + (i) + "   NUMERIC");  
    output.println("@ATTRIBUTE ZMeanWindow" + (i) + "  NUMERIC");  
    output.println("@ATTRIBUTE ZSDWindow" + (i) + "   NUMERIC");  
  }
  
  // Class Header
  output.print("@ATTRIBUTE class        {");
  for (int i = 0; i < gestures.length; i++){
    if (i != 0){output.print("," + gestures[i]);}
    else{output.print(gestures[i]);}
  }
  output.println("}");
  
  // Data Header
  output.println("@DATA");
  
}