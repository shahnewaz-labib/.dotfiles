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

set<int> ans;

void solve() {
    int n;
    cin >> n;

    if (ans.find(n) != ans.end())
        cout << "YES\n";
    else
        cout << "NO\n";
}

signed main() {
    fastio int t;
    for (int k = 2; k <= 1000; k++) {
        int val = 1 + k;
        int p = k * k;

        for (int cnt = 2; cnt <= 20; cnt++) {
            val += p;

            if (val > 1e6) break;

            ans.insert(val);
            p *= k;
        }
    }

    t = 1;
    cin >> t;
    for (int tc = 1; tc <= t; tc++) {
        /* printf("Case no: %d\n", tc); */
        solve();
    }
}
