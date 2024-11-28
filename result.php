<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>試合結果確認</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            padding: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>試合結果確認フォーム</h1>
    <form action="" method="POST">
        <label for="team">チーム名:</label>
        <input type="text" id="team" name="team" placeholder="例: 日本" required>
        <br><br>
        <label for="date">試合日付:</label>
        <input type="date" id="date" name="date">
        <br><br>
        <button type="submit">検索</button>
    </form>

    <?php
    // データベース接続情報
    $servername = "localhost"; // サーバー名
    $username = "root";       // ユーザー名
    $password = "1234";           // パスワード
    $dbname = "board";        // データベース名

    // データベース接続
    $conn = new mysqli($servername, $username, $password, $dbname);

    // 接続エラーチェック
    if ($conn->connect_error) {
        die("データベース接続失敗: " . $conn->connect_error);
    }

    // フォームが送信された場合
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $team = $_POST['team'];
        $date = $_POST['date'];

        // 基本SQL
        $sql = "SELECT * FROM games WHERE (home LIKE ? OR away LIKE ?)";
        $params = ["%$team%", "%$team%"];

        // 日付が入力された場合、条件を追加
        if (!empty($date)) {
            $sql .= " AND date = ?";
            $params[] = $date;
        }

        // SQLクエリを準備して実行
        $stmt = $conn->prepare($sql);
        $stmt->bind_param(str_repeat("s", count($params)), ...$params);
        $stmt->execute();
        $result = $stmt->get_result();

        // 結果を表示
        if ($result->num_rows > 0) {
            echo "<h2>検索結果</h2>";
            echo "<table>";
            echo "<tr>
                    <th>日付</th>
                    <th>ホームチーム</th>
                    <th>アウェイチーム</th>
                    <th>ホーム得点</th>
                    <th>アウェイ得点</th>
                    <th>PK (ホーム)</th>
                    <th>PK (アウェイ)</th>
                  </tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row['date'], ENT_QUOTES, 'UTF-8') . "</td>";
                echo "<td>" . htmlspecialchars($row['home'], ENT_QUOTES, 'UTF-8') . "</td>";
                echo "<td>" . htmlspecialchars($row['away'], ENT_QUOTES, 'UTF-8') . "</td>";
                echo "<td>" . htmlspecialchars($row['home_score'], ENT_QUOTES, 'UTF-8') . "</td>";
                echo "<td>" . htmlspecialchars($row['away_score'], ENT_QUOTES, 'UTF-8') . "</td>";
                echo "<td>" . htmlspecialchars($row['pk_home'], ENT_QUOTES, 'UTF-8') . "</td>";
                echo "<td>" . htmlspecialchars($row['pk_away'], ENT_QUOTES, 'UTF-8') . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<p>該当する試合結果が見つかりませんでした。</p>";
        }

        $stmt->close();
    }

    $conn->close();
    ?>
</body>
</html>
