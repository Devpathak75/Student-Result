<!DOCTYPE html>
<html>
<head>
    <title>Student Result Portal</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Arial, sans-serif;
    }

    body {
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
        height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* Header */
    .header {
        width: 100%;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        color: #fff;
        text-align: center;
        padding: 20px;
        font-size: 22px;
        font-weight: bold;
        letter-spacing: 1px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.3);
    }

    /* Center Layout */
    .page {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* Result Box */
    .result-box {
        width: 380px;
        padding: 35px;
        border-radius: 20px;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(15px);
        box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        text-align: center;
        color: #fff;
        animation: fadeIn 0.7s ease-in-out;
    }

    /* Title */
    .title {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #ffffff;
    }

    /* Input */
    input[type="text"] {
        width: 100%;
        padding: 12px;
        font-size: 15px;
        border: none;
        border-radius: 8px;
        outline: none;
        margin-top: 10px;
        background: rgba(255,255,255,0.2);
        color: white;
        transition: 0.3s;
    }

    input[type="text"]::placeholder {
        color: #ddd;
    }

    input[type="text"]:focus {
        background: rgba(255,255,255,0.3);
        box-shadow: 0 0 10px rgba(255,255,255,0.4);
    }

    /* Button */
    input[type="submit"] {
        margin-top: 25px;
        padding: 12px;
        width: 100%;
        font-size: 16px;
        font-weight: bold;
        background: linear-gradient(to right, #00c6ff, #0072ff);
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0,0,0,0.4);
    }

    /* Label */
    label {
        font-size: 15px;
        font-weight: 500;
        color: #f1f1f1;
    }

    /* Footer */
    .footer {
        text-align: center;
        padding: 10px;
        background: rgba(0,0,0,0.3);
        color: #ccc;
        font-size: 13px;
    }

    /* Animation */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

</style>

</head>

<body>

<div class="header">
    Student Result Portal
</div>

<div class="page">
    <div class="result-box">

        <div class="title">Check Your Result</div>

        <form action="ResultServlet" method="get">

            <label>Enter Enrollment Number</label>

            <input type="text" name="enroll"
                   placeholder="e.g. 122024091"
                   required>

            <input type="submit" value="Get Result">

        </form>

    </div>
</div>


</body>
</html>