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

    int sum = 0;
    while (n) {
        sum += n;
        n >>= 1;
    }

    cout << sum << "\n";
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
