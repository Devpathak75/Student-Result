<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
<title>Result</title>

<link rel="stylesheet" href="css/style.css">

<style>

/* Screen background (same stylish) */
body {
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
}

/* ONLY print/PDF background white */
@media print {
    body {
        background: white !important;
    }
}

</style>

</head>

<!-- ===== HEADER START ===== -->
<div class="no-print"
style="
    width:100%;
    background:#003366;
    color:white;
    text-align:center;
    padding:18px 0;
    border-bottom:3px solid #002244;
    font-family: Arial, sans-serif;
">
    <h2 style="margin:5px 0 0 0;">Result Portal</h2>
</div>
<!-- ===== HEADER END ===== -->

<body>

<div class="page">
<div class="result-box">

<!-- RESULT HEADER -->
<div style="
    width:100%;
    display:flex;
    align-items:center;
    justify-content:space-between;
    margin-bottom:15px;
">

    <div style="text-align:center; flex:1;">
        <h2 style="margin:3px 0; color:blue;">
            Student Result
        </h2>
        <h3 style="color:red; margin:6px 0;">
            RESULT :- Semester - 5
        </h3>
    </div>

</div>

<%
ResultSet rs = (ResultSet) request.getAttribute("rs");
%>

<table class="info" style="width:100%; border-collapse:collapse; margin-top:10px;">
<tr>
    <td style="border:1px solid black; padding:6px;"><b>PRN :</b></td>
    <td style="border:1px solid black; padding:6px;">
        <%=rs.getString("enrollment_no")%>
    </td>

    <td style="border:1px solid black; padding:6px;"><b>ID No :</b></td>
    <td style="border:1px solid black; padding:6px;">
        <%=rs.getString("enrollment_no")%>
    </td>
</tr>

<tr>
    <td style="border:1px solid black; padding:6px;"><b>Student Name :</b></td>
    <td style="border:1px solid black; padding:6px;">
        <%=rs.getString("name")%>
    </td>

    <td style="border:1px solid black; padding:6px;"><b>ABC ID :</b></td>
    <td style="border:1px solid black; padding:6px;">
        <%=rs.getString("abc_id")%>
    </td>
</tr>

<tr>
    <td style="border:1px solid black; padding:6px;"><b>Degree :</b></td>
    <td style="border:1px solid black; padding:6px;">
         <%=rs.getString("degree")%>
    </td>

    <td style="border:1px solid black; padding:6px;"><b>Mother Name :</b></td>
    <td style="border:1px solid black; padding:6px;">
        <%=rs.getString("mother_name")%>
    </td>
</tr>
</table>

<table class="marks">
<tr>
<th>Sem</th>
<th>Course Code</th>
<th>Course Name</th>
<th>Type</th>
<th>Credits</th>
<th>Grade</th>
<th>GP</th>
<th>Result</th>
</tr>

<%
int totalGP = 0;
int totalCredits = 0;

String[] subjects = {
"Operating System","Computer Networks","Data Science",
"OS Lab","DS Lab","Machine Learning",
"Machine Learning Lab","Software Testing","tensor flow"
};

for(int i=1;i<=9;i++){

    int m = rs.getInt("subject" + i);

    int gp = 0;
    String grade = "";
    String result = "";

    if (m >= 91) { grade="O"; gp=10; result="Outstanding"; }
    else if (m >= 81) { grade="A+"; gp=9; result="Excellent"; }
    else if (m >= 71) { grade="A"; gp=8; result="Very Good"; }
    else if (m >= 61) { grade="B+"; gp=7; result="Good"; }
    else if (m >= 51) { grade="B"; gp=6; result="Above Average"; }
    else if (m >= 41) { grade="C"; gp=5; result="Average"; }
    else if (m >= 31) { grade="F"; gp=0; result="Fail"; }

    totalGP += gp * 4;
    totalCredits += 4;
%>

<tr>
<td>5</td>
<td>23183<%=i%></td>
<td><%=subjects[i-1]%></td>
<td>TH</td>
<td>4</td>
<td><%=grade%></td>
<td><%=gp%></td>
<td><%=result%></td>
</tr>

<% } %>

</table>

<div class="sgpa">
<b>SGPA :</b> <%= String.format("%.2f",(double)totalGP/totalCredits) %><br>
<b>Total Credit Earned :</b> <%= totalCredits %>
</div>

<table class="grade">
<tr><th>Grade</th><th>Point</th><th>Performance</th><th>Percentage</th></tr>
<tr><td>O</td><td>10</td><td>Outstanding</td><td>(m >= 91)</td></tr>
<tr><td>A+</td><td>9</td><td>Excellent</td><td>(m >= 81)</td></tr>
<tr><td>A</td><td>8</td><td>Very Good</td><td>(m >= 71)</td></tr>
<tr><td>B+</td><td>7</td><td>Good</td><td>(m >= 61)</td></tr>
<tr><td>B</td><td>6</td><td>Above Avg</td><td>(m >= 51)</td></tr>
<tr><td>C</td><td>5</td><td>Average</td><td>(m >= 41)</td></tr>
<tr><td>F</td><td>0</td><td>Fail</td><td>(m >= 31)</td></tr>
</table>

<p class="note">
Disclaimer: The results published online are provisional.
Final marksheet issued by institute will be treated as final.
</p>

<div class="print">
<button onclick="window.print()" style="color:red;">Print Result</button>
</div>

</div>
</div>

<div class="no-print"
 style="
    width: 100%;
    padding: 25px 0;
    background:#000000;
    color: #e5e7eb;
    text-align: center;
">
</div>

</body>
</html>