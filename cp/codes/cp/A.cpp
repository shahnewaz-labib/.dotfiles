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
    int n, w;
    cin >> n >> w;

    set<int> s;
    for (int i = 0; i < n; i++) {
        int x, y;
        cin >> x >> y;
        s.insert(y);
    }

    vector<int> v;
    for (int x : s) {
        v.push_back(x);
    }


    int ans = 1, l = v[0] + w;
    for (int i = 1; i < v.size(); i++) {
        if (l < v[i]) {
            ans++;
            l = v[i] + w;
        }
    }

    cout << ans << "\n";
}

signed main() {
    int t;
    t = 1;
    cin >> t;
    for (int tc = 1; tc <= t; tc++) {
        printf("Case %lld: ", tc);
        solve();
    }
}
