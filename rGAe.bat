Code & steps for pracs  (Only for pracs with code)
Pract 1 RSS web feed===============================================================================================================
1. File in htdocs -> xamp control panel ->start apache
2. Browser - > localhost/filename.php

code :
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RSS Feed Reader</title>
</head>
<body>
    <p>Choose a category</p>
    <form id="myForm" method="post">
        <select required name="rssurl">
            <option value="https://timesofindia.indiatimes.com/rssfeeds/1081479906.cms">Entertainment</option>
            <option value="https://timesofindia.indiatimes.com/rssfeeds/-2128672765.cms">Science</option>
            <option value="https://timesofindia.indiatimes.com/rssfeeds/2886704.cms">Life style</option>
        </select>
        <input type="submit" value="Load">
    </form>
    <?php 
    if(isset($_POST['rssurl'])){
        echo '<h1>Search Result for RSS url: </h1>' . $_POST['rssurl'] . '</h1>';
        $rssurl = $_POST['rssurl'];
        $rss = new DOMDocument();
        $rss->load($rssurl);
        $feed = array();
        foreach($rss->getElementsByTagName('item') as $node){
            $item = array(
                'title' => $node->getElementsByTagName('title')->item(0)->nodeValue,
                'desc' => $node->getElementsByTagName('description')->item(0)->nodeValue,
                'link' => $node->getElementsByTagName('link')->item(0)->nodeValue,
                'date' => $node->getElementsByTagName('pubDate')->item(0)->nodeValue
            );
            array_push($feed, $item);
        }
        $limit = 5;
        for($x = 0; $x < $limit; $x++){
            $title = str_replace('&', '&amp;', $feed[$x]['title']);
            $link = $feed[$x]['link'];
            $description = $feed[$x]['desc'];
            $date = date('l F d, Y', strtotime($feed[$x]['date']));
            echo '<p><strong><a href="' . $link . '" title="' . $title . '">' . $title . '</a></strong></p>';
            echo '<p>' . $description . '</p>';
            echo '<small><em>Posted on ' . $date . '</em></small>';
        }
    }
    ?>
</body>
</html>
========================================================================================================================
Practical 3 – Web Services 
1. For Service 
new project -> Java Web -> Web Application -> name it ->next next until finish -> project gets created ->right click on project -> new -> webservice -> go to .java file in Source Packages ->add to operations with return type doube and two parameters of type double -> change only the method logic (highlighted code) for both methods (don’t copy whole code- package name may defer) -> deploy project 
JAVAFILE=============================
package cc_pract_3;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
/**
 *
 * @author bhush
 */
@WebService(serviceName = "CC_practical_3")
public class CC_practical_3 {
    /**
     * Web service operation
     */
    @WebMethod(operationName = "add")
    public double add(@WebParam(name = "num1") double num1, @WebParam(name = "num2") double num2) {
        return num1+num2;
    }
    /**
     * Web service operation
     */
    @WebMethod(operationName = "sub")
    public double sub(@WebParam(name = "num1") double num1, @WebParam(name = "num2") double num2) {
        return num1-num2; 
}}

========================================

2. For Client 
new project -> Java Web -> Web Application -> name it ->next next until finish -> project gets created ->right click on project -> new -> 1) JSP 2) Webservice Client ->choose service project

client->webpages->index.html-> highlighted code 
=================================================================

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>please select an option</div>
        <form name="f1" action="result.jsp">
            Enter num1 : <input type="text" name="n1" value ="" /><br>
            Enter num2: <input type="text" name="n2" value=""/><br>
            Add  <input  type="radio" name="calc" value="1"/></br>  
            Subtract <input type="radio" name="calc" value="2"/></br>
            <input type="submit" value="calculate" name="cal" />
        </form>
    </body>
</html>
JSP FILE==========================================================================
result.jsp -> drag and  drop any one function from webservice references -> add or replace highlighted code (don’t copy whole package name issue) -> run index.html

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%-- start web service invocation --%><hr/>
    <%
    try {
        String op;
        double result;
    pract3.CCPractical3_Service service = new pract3.CCPractical3_Service();
    pract3.CCPractical3 port = service.getCCPractical3Port();
     // TODO initialize WS operation arguments here
    double num1 = Double.parseDouble(request.getParameter("n1"));
    double num2 = Double.parseDouble(request.getParameter("n2"));
        op = request.getParameter("calc");
        if (op.equals("1")){
            result = port.add(num1,num2);}
        else { result = port.sub(num1, num2);}
    out.println("Result = "+result);
    } catch (Exception ex) {
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>


======================================================================================

Practical 4 -  google app engine 

Run eclipse from extracted folder



# if workspace could not be created Error -> ok -> choose -> browse to any directory from pc ->launch 
# Eclipse->file->new-> google app engine standard Java Project
# Give any project name and java package -> com.GAE  , everything else keep default -> Finish

HelloAppEngine.java

package com.GAE;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
    name = "HelloAppEngine",
    urlPatterns = {"/hello"}
)
public class HelloAppEngine extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) 
      throws IOException {

    String numberStr = request.getParameter("number");
    String operation = request.getParameter("operation"); // Check operation (factorial, prime, palindrome)
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");

    if (numberStr != null && operation != null) {
      try {
        int number = Integer.parseInt(numberStr);

        if (operation.equals("factorial")) {
          // Calculate factorial
          long factorial = 1;
          if (number < 0) {
            response.getWriter().print("Factorial is not defined for negative numbers.\r\n");
          } else {
            for (int i = 1; i <= number; i++) {
              factorial *= i;
            }
            response.getWriter().print("Factorial of " + number + " is: " + factorial + "\r\n");
          }
        } else if (operation.equals("prime")) {
          // Check if number is prime
          boolean isPrime = isPrime(number);
          if (isPrime) {
            response.getWriter().print(number + " is a prime number.\r\n");
          } else {
            response.getWriter().print(number + " is not a prime number.\r\n");
          }
        } else if (operation.equals("palindrome")) {
          // Check if number is palindrome
          boolean isPalindrome = isPalindrome(number);
          if (isPalindrome) {
            response.getWriter().print(number + " is a palindrome number.\r\n");
          } else {
            response.getWriter().print(number + " is not a palindrome number.\r\n");
          }
        } else {
          response.getWriter().print("Invalid operation. Please choose either 'factorial', 'prime', or 'palindrome'.\r\n");
        }

      } catch (NumberFormatException e) {
        response.getWriter().print("Invalid input! Please provide a valid number.\r\n");
      }
    } else {
      response.getWriter().print("Please provide a number and choose an operation ('factorial', 'prime', or 'palindrome').\r\n");
    }
  }

  // Method to check if a number is prime
  private boolean isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= Math.sqrt(number); i++) {
      if (number % i == 0) {
        return false; // Divisible, so not prime
      }
    }
    return true; // Prime
  }

  // Method to check if a number is a palindrome
  private boolean isPalindrome(int number) {
    int original = number;
    int reversed = 0;
    while (number > 0) {
      int digit = number % 10;
      reversed = reversed * 10 + digit;
      number /= 10;
    }
    return original == reversed;
  }
}
=====================================================================
Index.html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <title>Hello App Engine</title>
  </head>

  <body>
    <h1>Hello App Engine!</h1>

    <table>
      <tr>
        <td colspan="2" style="font-weight:bold;">Available Servlets:</td>        
      </tr>
      <tr>
        <td><a href='/hello'>The servlet</a></td>
      </tr>
    </table>

    <h2>Enter a number to calculate its:</h2>

    <form id="numberForm" action="/hello" method="get">
      <label for="number">Number:</label>
      <input type="text" id="number" name="number" required>

      <br><br>

      <label>Choose operation:</label>
      <input type="radio" id="factorial" name="operation" value="factorial" checked>
      <label for="factorial">Factorial</label>
      <input type="radio" id="prime" name="operation" value="prime">
      <label for="prime">Prime Check</label>
      <input type="radio" id="palindrome" name="operation" value="palindrome">
      <label for="palindrome">Palindrome Check</label>

      <br><br>

      <input type="submit" value="Submit">
    </form>

    <h3>Result:</h3>
    <pre id="result"></pre>

    <script>
      
      document.querySelector('#numberForm').onsubmit = function(event) {
        event.preventDefault();

        const number = document.querySelector('#number').value;
        const operation = document.querySelector('input[name="operation"]:checked').value;
        fetch(`/hello?number=${number}&operation=${operation}`)
          .then(response => response.text())
          .then(data => {
            document.querySelector('#result').textContent = data;
          })
          .catch(error => {
            document.querySelector('#result').textContent = "Error: " + error;
          });
      };
    </script>
  </body>
</html> 
===========================
QuickAccess -> Servers 
Next -> configure resources (available to configure) the resource you want (current project)

Right click on this -> start-> it will start
