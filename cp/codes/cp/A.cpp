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

    vector<int> v(n);
    for (int i = 0; i < n; i++) {
        cin >> v[i];
    }

    int sum = v[0], ans = *min_element(v.begin(), v.end());
    for (int i = 1; i < n; i++) {
        cout << sum << "\n";
        if ((v[i] & 1) == (v[i - 1] & 1)) {
            sum = 0;
        }
        sum += v[i];
        ans = max(ans, sum);
    }

    cout << ans << "\n";
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
