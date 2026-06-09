---
layout: projects
permalink: creditcard
categories: projects
title: "Random Forests & Credit Card Fraud"
description: "Research paper investigating the effectiveness of random forests in detecting credit card fraud."
external_links:
  - label: Paper
    url: "assets/projects/creditcard/paper.pdf"
date: 2025-05-16
emoji: "🌳"
tech_stack: ["Python", "scikit-learn", "XGBoost"]
---

This group project explored how effectively Random Forest classifiers can detect credit card fraud, a domain where fraudulent transactions represent less than 1% of total data which makes detection extremely difficult due to class imbalance.

We investigated:
- The impact of data balancing methods such as undersampling, oversampling and SMOTE on model performance.
- The role of model refinement techniques like boosting (XGBoost) and bagging and...
- How feature selection and hyperparameter tuning affect accuracy and recall.

We found that, using the IEEE-CIS Fraud Detection dataset (590k+ transactions):
- The baseline Random Forest achieved high accuracy (98.7%) but poor recall (0.48), missing many fraud cases.
- Limited undersampling and feature selection improved recall to 0.65, achieving the best F1-score of 0.77.
- Boosting methods like XGBoost provided additional gains in recall and robustness. 