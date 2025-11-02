<?php
// Safe test page: echoes sanitized parameter
echo "Test page - param: " . htmlspecialchars($_GET["id"] ?? "");
