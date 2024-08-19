<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Remove Dish</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #fff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color:green;
            margin-bottom: 20px;
            text-shadow: -2px 2px 2px yellowgreen
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            position: absolute;
            top: 50%;
            left: 10px;
            padding: 0 5px;
            background-color: white;
            color: #666;
            transition: 0.3s;
            pointer-events: none;
            transform: translateY(-50%);
        }

        select {
            width: 100%;
            padding: 12px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.3s;
            background-color: transparent;
            appearance: none;
        }

        select:focus {
            border-color: #dc3545;
        }

        select:focus + label,
        select:not(:placeholder-shown) + label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: #dc3545;
            background-color: white;
            padding: 0 5px;
        }

        button[type="submit"],
        button[type="reset"] {
            width: 100%;
            padding: 10px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        button[type="submit"]:hover {
            background-color: #c82333;
        }

        .confirmation-message {
            color: #dc3545;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }
        select{
            box-shadow: -2px 2px 2px gray;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Remove Dish</h2>
        <form action="/FoodSphere/RemoveDish" method="POST" id="removeDishForm">
            <div class="form-group">
                <select id="dishname" name="dishname" required>
                    <option value="" disabled selected>Select Dish</option>
                    <!-- Options should be dynamically populated from the database -->
                    <option value="chicken dum biryani">chicken Dum Biryani</option>
                    <option value="panner Biryani">Panner biryani</option>
                    <option value="Dish 3">burger</option>
                </select>
                <label for="dishname">Dish Name</label>
            </div>
            <button type="submit">Remove Dish</button>
            <div class="confirmation-message">
                This action cannot be undone.
            </div>
        </form>
    </div>

    <script>
        document.getElementById('removeDishForm').addEventListener('submit', function(event) {
            if (!confirm('Are you sure you want to remove this dish? This action cannot be undone.')) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>