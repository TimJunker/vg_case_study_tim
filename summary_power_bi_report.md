# Varengold Bank AG - Data Analyst Case Study - Tim Junker

## 📋 Overview - Dashboard

## Purpose

Provide Branch Performance Manager with a high level overview of branch performance.
The Dashboard is split into three pages (excl. table of contents):
- Customers by branch
- Loans by branch
- Transactions by branch

## Insights/findings & Recommedations

- Customers by branch - Insights/findings:
    - customer age distribution skews older
    - over 60 % are older than 50
    - most financially active segment (30–50 years old) is underrepresented across most branches
    - there are customers without accounts (3 identified) - might indicate operational gaps/data integrity issues
    - average account age is ~15.7 years, with consistent longevity across branches - signals strong customer retention, suggesting trust in the institution
    - near-even distribution between current (50.02%) and savings accounts (49.98%) -> some branches lean heavily toward one type, indicating branch-specific customer behavior or product focus

- Recommendations:
    - Boost acquisition in mid-age segment
    - Focus marketing and sales efforts on attracting younger mid-age professionals — the demographic with the highest lifetime value
    - Tailor products (e.g., credit offers, mortgage options) to attract this group
    - investigate customers without account - reach out to the branch
    - Leverage high account longevity - promote bank’s long-term reliability as a trust-building marketing - loyalty features

- Loans by branch - Insights/findings:
    - Approval success rate varies significantly across branches and loan types
    - for the smallest laon value branches - the mortgage success rate seems quite low
    - Branches like Nice, Doha, Malmo, Istanbul display significantly lower loan volumes and approval rates
    - In many cases, approval success for personal or auto loans is very low — a sign of either poor customer fit or stricter evaluation

- Recommendations:
    - Branches like Nice, Muscat, and Hamburg need to scale their loan activities or re-evaluate customer engagement strategies
    - For branches under target, set tailored loan KPIs and evaluate bottlenecks (customer qualification vs. internal policy)
    - Incentivize local staff to focus on smaller, safer loans to drive volume and diversify risk
    - Where mortgage success rates are low (e.g., Nice at 16.67%), launch awareness campaigns or revise approval processes
    - Consider segmenting loan targets: small-value personal loans for younger/new customers and high-value mortgages for established customers
    - Monitor approval ratios by loan type per branch to adjust product offers

- Transactions by branch - Insights/findings:
    - 14 different currencies used — reflects wide geographic and monetary diversity
    - 28 transactions lack an associated customer account — small but important data integrity issue
    - most transactions coming from customers over 50
    - low % of transactions in the age group < 30 by branch seem to correlate with lower volume in total transaction value
    - Some branches like Doha and Florence handle more currencies (8–10), yet still rank low in transaction volume/value — suggesting multi-currency support alone doesn't drive value
    - 3 branches have transactions without an account - Brussels, Copenhagen and Doha

- Recommendations:
    - false transaction currency found in raw data = 'RON1' - worth investigating the reason
    - Branches like Yerevan (21.8% <30) or Riyadh (68% >50) should tailor services to their dominant age group
    - Investigate the 28 transactions without account
    - Establish branch-specific targets for daily/monthly transaction volumes





