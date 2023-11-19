int n;
cin >> n;
vector<string> a(n);
int cnt[50][10] = {};
for (auto &s : a) {
    cin >> s;
    int sum = accumulate(s.begin(), s.end(), 0LL) - '0' * s.size();
    cnt[sum][s.size()]++;
}

int ans = 0;
for (auto &s : a) {
    int sum = accumulate(s.begin(), s.end(), 0LL) - '0' * s.size();
    for (int i = 0; sum > 0 && i < s.size(); i++) {
        int len = s.size() - i;
        int need = 2 * len - s.size();
        ans += cnt[sum][need];
        sum -= 2 * (s[i] - '0');
    }
    sum = accumulate(s.begin(), s.end(), 0LL) - '0' * s.size();
    ans -= cnt[sum][s.size()];
    for (int i = s.size() - 1; sum > 0 && i >= 0; i--) {
        int len = i + 1;
        int need = 2 * len - s.size();
        ans += cnt[sum][need];
        sum -= 2 * (s[i] - '0');
    }
}

