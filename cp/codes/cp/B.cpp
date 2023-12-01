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
    multiset<int> s;
    for (int i = 0; i < 10; i++) {
        s.insert((i + 1) * 10);
    }
    int idx = s.find(s.lower_bound(10)) - s.begin();
    cout << idx << "\n";
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
