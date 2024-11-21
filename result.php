<?php
// フォームからのデータを取得
$team = $_POST['team'];
$date = $_POST['date'];

// CSVファイルのパス
$csvFile = 'worldcup_results.csv';

// CSVファイルの読み込みと検索
$results = [];
if (($handle = fopen($csvFile, "r")) !== FALSE) {
    // ヘッダーをスキップ
    fgetcsv($handle);

    // 各行を読み込んで検索
    while (($data = fgetcsv($handle)) !== FALSE) {
        list($match_date, $home_team, $away_team, $home_score, $away_score, $pk_home, $pk_away) = $data;

        // 条件に一致する試合を検索
        if (($match_date === $date || empty($date)) && ($home_team === $team || $away_team === $team)) {
            // PK戦が行われた場合
            if (!empty($pk_home) && !empty($pk_away)) {
                $result = [
                    'date' => $match_date,
                    'home_team' => $home_team,
                    'away_team' => $away_team,
                    'home_score' => $home_score,
                    'away_score' => $away_score,
                    'pk_result' => "<strong>PK戦:</strong> {$home_team} <strong>{$pk_home}</strong> - <strong>{$pk_away}</strong> {$away_team}",
                ];
            } else {
                $result = [
                    'date' => $match_date,
                    'home_team' => $home_team,
                    'away_team' => $away_team,
                    'home_score' => $home_score,
                    'away_score' => $away_score,
                    'pk_result' => '<span style="color:gray;">PK戦なし</span>',
                ];
            }
            $results[] = $result;
        }
    }
    fclose($handle);
}

// 結果の表示
if (!empty($results)) {
    echo "<h2>試合結果</h2>";
    foreach ($results as $result) {
        echo "<p><strong>{$result['date']}</strong> - {$result['home_team']} {$result['home_score']} : {$result['away_score']} {$result['away_team']}<br>{$result['pk_result']}</p>";
    }
} else {
    echo "<p>指定した条件の試合結果が見つかりませんでした。</p>";
}
?>
