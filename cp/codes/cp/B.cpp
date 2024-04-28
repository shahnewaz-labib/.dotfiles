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
    vector<int> v = {1,2,3};
    v.resize(5);
    for(int e:v)cout<<e<<" ";
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
