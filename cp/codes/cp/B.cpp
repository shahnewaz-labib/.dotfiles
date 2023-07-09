#include "bits/stdc++.h"

using namespace std;

int calculatePower(const vector<int>& villagers, int start, int end) {
    int power = 0;
    for (int i = start; i < end; i++) {
        power += abs(villagers[i] - villagers[i + 1]);
    }
    return power;
}

int minimizePower(int n, int k, const vector<int>& villagers) {
    vector<vector<int>> dp(k + 1, vector<int>(n + 1, INT_MAX));

    // Base case: If there is only one group, the power is 0
    for (int i = 1; i <= n; i++) {
        dp[1][i] = 0;
    }

    for (int i = 2; i <= k; i++) {
        for (int j = i; j <= n; j++) {
            for (int x = i - 1; x < j; x++) {
                int power = calculatePower(villagers, x, j);
                dp[i][j] = min(dp[i][j], dp[i - 1][x] + power);
            }
        }
    }

    return dp[k][n];
}

int main() {
    int t;
    cin >> t;

    while (t--) {
        int n, k;
        cin >> n >> k;

        vector<int> villagers(n);
        for (int i = 0; i < n; i++) {
            cin >> villagers[i];
        }

        int result = minimizePower(n, k, villagers);
        cout << result << endl;
    }

    return 0;
}

