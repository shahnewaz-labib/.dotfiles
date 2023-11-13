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
    multiset<int> ms;
    ms.insert(1);
    ms.insert(4);
    ms.insert(4);
    ms.insert(2);

    for(int e : ms) cout << e << " ";
}
 
signed main() {
    fastio int t;
    t = 1;
    for (int tc = 1; tc <= t; tc++) {
        /* printf("Case no: %d\n", tc); */
        solve();
    }
}
