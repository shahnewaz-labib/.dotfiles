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
    pair<int, int> a, b, c;
    cin >> a.first >> a.second;
    cin >> b.first >> b.second;
    cin >> c.first >> c.second;

    int ans = 0;
    if ((a.first > b.first && a.first > c.first)) {
        ans += abs(a.first - max(b.first, c.first));
    } else if (a.first < b.first && a.first < c.first) {
        ans += abs(a.first - min(b.first, c.first));
    }
    if ((a.second > b.second && a.second > c.second)) {
        ans += abs(a.second - max(b.second, c.second));
    } else if (a.second < b.second && a.second < c.second) {
        ans += abs(a.second - min(b.second, c.second));
    }

    cout << ++ans << "\n";
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
