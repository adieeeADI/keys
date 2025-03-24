CC calculator in NetBeans  

server java file==============================
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author ADITY
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    @WebMethod(operationName = "add")
    public int add(@WebParam(name = "first") int first, @WebParam(name
            = "second") int second) {
        int sum = first + second;
        return sum;
    }

    @WebMethod(operationName = "subtract")
    public int subtract(@WebParam(name = "first") int first, @WebParam(name
            = "second") int second) {
        int sub = first - second;
        return sub;
    }

    @WebMethod(operationName = "multiply")
    public int multiply(@WebParam(name = "first") int first, @WebParam(name
            = "second") int second) {
        int mult = first * second;
        return mult;
    }

    @WebMethod(operationName = "divide")
    public int divide(@WebParam(name = "first") int first, @WebParam(name
            = "second") int second) {
        int div = first / second;
        return div;
    }

}
===============================================
client index==============================================
<html>
<head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div>Please select any operation</div>
    <form name="fl" action="result.jsp">
        Enter num1: <input type="text" name="nl" value="" /><br>
        Enter num2: <input type="text" name="n2" value="" /><br>
        Add <input type="radio" name="calc" value="1" /><br>
        Subtract <input type="radio" name="calc" value="2" /><br>
        <input type="submit" value="calculate" name="cal" />
    </form>
</body>
</html>
client jsp file================================================
<%-- 
    Document   : result
    Created on : 23 Mar, 2025, 3:54:56 PM
    Author     : ADITY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
<%
try {
    String op;
    double result;
    cc_calc.CalcCC_Service service = new cc_calc.CalcCC_Service();
    cc_calc.CalcCC port = service.getCalcCCPort();
    // TODO initialize WS operation arguments here
    double num1 = Double.parseDouble(request.getParameter("nl"));
    double num2 = Double.parseDouble(request.getParameter("n2"));
    op = request.getParameter("calc");
    if (op.equals("1")) {
        result = port.add(num1, num2);
    } else {
        result = port.sub(num1, num2);
    }
    
    out.println("Result = " + result);
} catch (Exception ex) {
    // TODO handle custom exceptions here
}
%>
<%-- end web service invocation --%><br/>
    </body>
</html>
