Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id C682516405B
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A93C23C2467
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9BB253C0E94
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:16 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C91FB601A68
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:15 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id 12so2289890pjb.5
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6YxCHLFBJ/mbIcj2A9Xv8436nSDvjsKDlmNCvZPS6OI=;
 b=j0YpWhDZZkILQRRnQCtzJc9Pn/bwdddICsJyrlA4jDJ6j+tHfBgPhTF6SW/CUeGAdC
 WLdvfdb0ARDvvHrN3saqG3lgzofIBfwpVw6CQXqd1R/MzndWfQiTKyAi23fSwp6LoQpQ
 5Qb5LecP8UF2DI2VvvKosCqGuwjme+0tmd5RQ/CmO2YletdoLwTPUpO9lzFQJQDLE11j
 gRrohXq4qykuXyKGEEj18B9tL2UgqrSQrnVYfAjTLMBAw1ZUeiNlMmLMr7/L+JiTUFex
 yiX8yFk0Jw/jTbCsWdKEqUxnGHIg88ASgD30Dpo2WYMssM7cScUuC4gvgbuzdrknmS5R
 MMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6YxCHLFBJ/mbIcj2A9Xv8436nSDvjsKDlmNCvZPS6OI=;
 b=pVlsYiJ71tZ8WMkO+eWl341kDB4jh9zDKClL3bpX6ua/gP5KsE6mGO+p7glpOnak2x
 c+6Vp2tdyzIX0BbOAtITv0BkQ6CcOkgFsH/sPTKASf4aNxls0/4ZA7a9tXbYVwrmBFB/
 H45yI9kXHKSErZpb4bcuw3ZkThIGUrS2m7+2U6tWcoc9cP/wk3lML7Pi/Ra+L9u1V3/t
 hemrRoTVFDmwFgbsjJJbJkii0Fd9rggY6yU9MImHYgd+sUwJ3h0wJMk60aWbx0X7O4Uz
 GGtM3IaCWwzfTP6WJLTQbqAJ2wSl5yDJq9Kq6IZyrj1DdZMwxg5ITwWeHRVr+m4hEcJV
 qmzg==
X-Gm-Message-State: APjAAAV1IxJQpfaVP/xTFbIXRoG+ZpgW8UJ8S78gcOiDYfNZxTO5QJ9Y
 jYN7V8BoSOZHA8/gaD0DncXMHAJZjnE=
X-Google-Smtp-Source: APXvYqxgu1smVWkgYlgxc6jRI1N3ChMR6sFaE+anUkGWBKW9K+2j3vFfsSnSKqaPsTskX2gagAYiLA==
X-Received: by 2002:a17:902:6192:: with SMTP id
 u18mr24929074plj.308.1582104493921; 
 Wed, 19 Feb 2020 01:28:13 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id z4sm2080657pfn.42.2020.02.19.01.28.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:13 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:57:56 +0530
Message-Id: <cover.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2 00/10] Add new LTP tests related to fsmount family
 of syscalls
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Here is the second version of my work rebased over the latest changes
pushed around fsmount work by Zorro.

V1->V2:
- Lots of changes, really :)
- Rebased over Zorro's work with fsmount.
- The success tests are modified to test all possible flags, attributes
  as well.
- Create tst_ismount() and fsopen_supported_by_kernel() helpers.
- Verify if mount is successful or not using tst_ismount().
- Remove min_kver and instead check if older kernels have patches
  backported or not.
- Test on multiple filesystems.
- Better handling of failures during setup/run callbacks.
- One of the patches around fsmount.h is already merged, dropped it now.
- Other minor cleanups.

Viresh Kumar (10):
  tst_device: Add tst_ismount() helper
  lapi/fsmount.h: Add fsopen_supported_by_kernel()
  lapi/fsmount.h: Include "lapi/fcntl.h"
  syscalls/fsopen: New tests
  syscalls/fsconfig: New tests
  syscalls/fsmount: Improve fsmount01 test
  syscalls/fsmount: Add failure tests
  syscalls/move_mount: New tests
  syscalls/fspick: New tests
  syscalls/open_tree: New tests

 include/lapi/fsmount.h                        |  11 +-
 include/tst_device.h                          |   6 +
 lib/tst_device.c                              |  25 ++++
 runtest/syscalls                              |  16 +++
 testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
 testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
 .../kernel/syscalls/fsconfig/fsconfig01.c     | 110 +++++++++++++++++
 .../kernel/syscalls/fsconfig/fsconfig02.c     | 100 +++++++++++++++
 testcases/kernel/syscalls/fsmount/.gitignore  |   1 +
 testcases/kernel/syscalls/fsmount/fsmount01.c | 114 ++++++++---------
 testcases/kernel/syscalls/fsmount/fsmount02.c |  81 ++++++++++++
 testcases/kernel/syscalls/fsopen/.gitignore   |   2 +
 testcases/kernel/syscalls/fsopen/Makefile     |   6 +
 testcases/kernel/syscalls/fsopen/fsopen01.c   |  85 +++++++++++++
 testcases/kernel/syscalls/fsopen/fsopen02.c   |  57 +++++++++
 testcases/kernel/syscalls/fspick/.gitignore   |   2 +
 testcases/kernel/syscalls/fspick/Makefile     |   6 +
 testcases/kernel/syscalls/fspick/fspick01.c   | 112 +++++++++++++++++
 testcases/kernel/syscalls/fspick/fspick02.c   | 107 ++++++++++++++++
 .../kernel/syscalls/move_mount/.gitignore     |   2 +
 testcases/kernel/syscalls/move_mount/Makefile |   6 +
 .../kernel/syscalls/move_mount/move_mount01.c |  82 +++++++++++++
 .../kernel/syscalls/move_mount/move_mount02.c |  93 ++++++++++++++
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 115 ++++++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 104 ++++++++++++++++
 27 files changed, 1203 insertions(+), 56 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c
 create mode 100644 testcases/kernel/syscalls/fsopen/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsopen/Makefile
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen01.c
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen02.c
 create mode 100644 testcases/kernel/syscalls/fspick/.gitignore
 create mode 100644 testcases/kernel/syscalls/fspick/Makefile
 create mode 100644 testcases/kernel/syscalls/fspick/fspick01.c
 create mode 100644 testcases/kernel/syscalls/fspick/fspick02.c
 create mode 100644 testcases/kernel/syscalls/move_mount/.gitignore
 create mode 100644 testcases/kernel/syscalls/move_mount/Makefile
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount01.c
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount02.c
 create mode 100644 testcases/kernel/syscalls/open_tree/.gitignore
 create mode 100644 testcases/kernel/syscalls/open_tree/Makefile
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree01.c
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree02.c

-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
