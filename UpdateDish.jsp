<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Dish Details</title>
    <style>
        /* Your existing CSS code */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #495057;
        }
        select, input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }
        select:focus, input[type="text"]:focus, input[type="number"]:focus, textarea:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.25);
        }
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        .radio-group {
            display: flex;
            justify-content: space-between;
        }
        .radio-group label {
            margin-right: 20px;
        }
        .update-button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .update-button:hover {
            background-color: #218838;
            box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.2);
        }
        .form-group.hidden {
            display: none;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Update Dish Details</h2>
    <form id="updateDishForm" action="/FoodSphere/UpdateDish" method="post">
        <!-- Select Dish -->
        <div class="form-group">
            <label for="dishSelect">Select Dish</label>
            <select id="dishSelect" name="dishSelect" required>
                <option value="" disabled selected>Select a dish</option>
                <!-- Options will be populated dynamically -->
                <option value="chicken Burger">chicken Burger</option>
                <option value="2">Pizza</option>
                <option value="3">Salad</option>
            </select>
        </div>

        <!-- Select Detail to Update -->
        <div class="form-group">
            <label for="updateFieldSelect">Select Detail to Update</label>
            <select id="updateFieldSelect" name="updateFieldSelect" required>
                <option value="" disabled selected>Select a detail</option>
                <option value="dishname">Dish Name</option>
                <option value="description">Description</option>
                <option value="price">Price</option>
                <option value="category">Category</option>
                <option value="availstatus">Availability Status</option>
                <option value="imageurl">Image URL</option>
                <option value="veg_or_nonveg">Veg/Non-Veg Status</option>
            </select>
        </div>

        <!-- Input for New Value -->
        <div class="form-group hidden" id="newValueGroup">
            <label for="newValue">Enter New Value</label>
            <input type="text" id="newValue" name="newValue">
        </div>

        <!-- Category Selection Box -->
        <div class="form-group hidden" id="categorySelectGroup">
            <label for="categorySelect">Select Category</label>
            <select id="categorySelect" name="categorySelect">
                <option value="" disabled selected>Select a category</option>
                <option value="Appetizer">Appetizer</option>
                <option value="Main Course">Main Course</option>
                <option value="Dessert">Dessert</option>
                <option value="Beverage">Beverage</option>
            </select>
        </div>

        <!-- Veg/Non-Veg Radio Buttons -->
        <div class="form-group hidden" id="vegStatusGroup">
            <label>Veg/Non-Veg Status</label>
            <div class="radio-group">
                <label><input type="radio" name="vegStatus" value="Vegetarian"> Veg</label>
                <label><input type="radio" name="vegStatus" value="Non-Vegetarian"> Non-Veg</label>
            </div>
        </div>

        <!-- Update Button -->
        <button type="submit" class="update-button">Update Dish</button>
    </form>
</div>

<script>
    const updateFieldSelect = document.getElementById('updateFieldSelect');
    const newValueGroup = document.getElementById('newValueGroup');
    const newValueInput = document.getElementById('newValue');
    const categorySelectGroup = document.getElementById('categorySelectGroup');
    const vegStatusGroup = document.getElementById('vegStatusGroup');

    updateFieldSelect.addEventListener('change', function () {
        // Hide all dynamic input fields
        newValueGroup.classList.add('hidden');
        newValueInput.removeAttribute('required');
        categorySelectGroup.classList.add('hidden');
        vegStatusGroup.classList.add('hidden');

        const selectedField = updateFieldSelect.value;

        if (selectedField === 'price') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'number';
            newValueInput.placeholder = 'Enter new price';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'description') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new description';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'dishname') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new name';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'availstatus') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new availability status';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'imageurl') {
            newValueGroup.classList.remove('hidden');
            newValueInput.type = 'text';
            newValueInput.placeholder = 'Enter new image URL';
            newValueInput.setAttribute('required', 'true');
        } else if (selectedField === 'category') {
            categorySelectGroup.classList.remove('hidden');
        } else if (selectedField === 'veg_or_nonveg') {
            vegStatusGroup.classList.remove('hidden');
        }
    });
</script>

</body>
</html>
