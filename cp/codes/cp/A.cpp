#include "bits/stdc++.h"
#define fastio ios_base::sync_with_stdio(0), cin.tie(nullptr);
#define int LL
#define LL long long

#ifdef LOCAL
#include "dbg.h"
#else
#define dbg(...)
#endif

using namespace std;

class Solution {
  public:
    static bool valid(int x, int y, int n, int m) {
        return (x >= 0 && x < n && y >= 0 && y < m);
    }
    vector<vector<int>> imageSmoother(vector<vector<int>> &img) {
        vector<vector<int>> ans(img.size(), vector<int>(img[0].size(), 0));

        int di[3] = {-1, 0, +1};
        int dj[3] = {-1, 0, +1};

        int n = img.size(), m = img[0].size();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                int cells = 0;
                for (int k = 0; k < 3; k++) {
                    for (int l = 0; l < 3; l++) {
                        int x = i + di[k];
                        int y = j + dj[l];
                        if (valid(x, y, n, m)) {
                            cells++;
                            ans[i][j] += img[x][y];
                        }
                    }
                }
                cout << ans[i][j] << " ";
                ans[i][j] /= cells;
            }
            cout << "\n";
        }
        return ans;
    }
};

void solve() {
    vector<vector<int>> img = {
        {100, 200, 100}, {200, 50, 200}, {100, 200, 100}};
    Solution s;
    vector<vector<int>> v = s.imageSmoother(img);

    cout << "\n";
    for (auto x : v) {
        for (auto y : x) {
            cout << y << " ";
        }
        cout << "\n";
    }
}

signed main() {
    fastio;
    int t;
    t = 1;
    for (int tc = 1; tc <= t; tc++) {
        /* printf("Case no: %d\n", tc); */
        solve();
    }
}
