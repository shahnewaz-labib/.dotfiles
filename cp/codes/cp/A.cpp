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
    int n, k;
    cin >> n >> k;

    if (n == 1) {
        cout << k << "\n";
        return;
    }
    int x = 1, cnt = 0;
    for (int i = 1; i <= n - 1; i++) {
        if (k >= x) {
            cout << x << " ";
            k -= x;
            x <<= 1;
            cnt++;
        } else
            break;
    }
    if (k) {
        cout << k << " ";
        cnt++;
    }
    for (; cnt < n; cnt++) {
        cout << "0 ";
    }
    cout << "\n";
}

signed main() {
    fastio;
    int t;
    t = 1;
    cin >> t;
    for (int tc = 1; tc <= t; tc++) {
        /* printf("Case no: %d\n", tc); */
        solve();
    }
}
