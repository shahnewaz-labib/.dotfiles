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

void solve() {
    int n;
    cin >> n;

    vector<int> v(2 * n);

    for (int i = 0; i < 2 * n; i++) {
        cin >> v[i];
    }

    sort(v.begin(), v.end());

    vector<pair<int, int>> ans;
    for (int i = 0; i < n; i++) {
        ans.push_back({v[i], v[i + n]});
    }

    int d = 0;
    for (int i = 1; i < n; i++) {
        d += abs(ans[i].first - ans[i - 1].first) +
             abs(ans[i].second - ans[i - 1].second);
    }

    cout << d << "\n";

    for(pair<int,int> p : ans) {
        cout << p.first << " " << p.second << "\n";
    }
}

signed main() {
    fastio int t;
    t = 1;
    cin >> t;
    for (int tc = 1; tc <= t; tc++) {
        /* printf("Case no: %d\n", tc); */
        solve();
    }
}
