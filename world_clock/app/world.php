<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="refresh" content="1" > 
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>World Clock</title></head>

<body>
    <div class="w3-container">
        <h1 class="w3-center">Time around the world</h1>
        <div class="w3-container w3-center">
            <?php
            // cerner_2^5_2020
            $datetime = new DateTime();
            echo '<p>It is currently: ' . $datetime->format('Y-m-d H:i:s') . ' in ' . date_default_timezone_get() . '<p />';
            ?>
        </div>
        <table class="w3-table-all w3-card-4">            
            <?php
            $timezone_identifiers = DateTimeZone::listIdentifiers();
            echo '<tr><th>Time Zone</th><th>Time</th></tr>';
            foreach ($timezone_identifiers as &$zone) {
                $datetime->setTimeZone(new DateTimeZone($zone));
                $formatted = $datetime->format('Y-m-d H:i:s');
                echo '<tr><td>' . $zone . '</td><td>' . $formatted . '</tr>';
            }
            unset($zone);
            ?>
        </table>
    </div>
</body>

</html>