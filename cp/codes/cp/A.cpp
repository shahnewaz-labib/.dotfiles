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

    stack<int> s;
    int x;

    vector<int> v(n);
    for (int &i : v)
        cin >> i;

    for (int i = 0; i < n; i++) {
        while (!s.empty() && v[s.top()] >= v[i]) {
            s.pop();
        }

        if (s.empty()) {
            cout << "0 ";
        } else {
            cout << s.top() + 1 << " ";
        }

        s.push(i);
    }
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
