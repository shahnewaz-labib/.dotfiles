#include <linux/limits.h>
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
    string s;
    cin >> s;

    s = "0" + s;

    int n = s.size();

    int e = -1, f = -1;
    for (int i = 1; i < n; i++) {
        if (s[i] >= '5' && e == -1) {
            e = i;
        }
    }

    for (int i = e; i < n; i++) s[i] = '0';
    cout << s << "\n";
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
