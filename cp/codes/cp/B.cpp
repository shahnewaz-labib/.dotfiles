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

void bin(int n) {
    for(int i = 1; i <= n; i++) {
        vector<int> ans;
        int x = i;
        while(x) {
            ans.push_back((x&1));
            x >>= 1;
        }
        reverse(ans.begin(), ans.end());
        for(int e : ans) cout << e;
        cout << "\n";
    }
}
 
void solve() {
    bin(10);
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
