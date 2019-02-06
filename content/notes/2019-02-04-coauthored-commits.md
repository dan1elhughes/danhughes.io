---
title: "Commits with multiple authors"
date: 2019-02-04T08:26:39Z
draft: false
---

When pairing, it is useful to attribute the work to both authors. To add a co-author to a git commit, add the `Co-authored-by` syntax to the end of the commit message:

```
Co-authored-by: Dan Hughes <danhughes@example.com>
```

This will attribute the commit to both the user creating the commit and the co-author, and both will appear when tracing the history of the file.
