Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2F16B9D4
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:41:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF33E3C261B
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:40:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 12CC93C13DA
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:40:55 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 66E342011CB
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:40:54 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id 4so6639223pfz.9
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QjD52M59CIC16erIFH0qKN75/Ambq9aBVAg1ZqK17E=;
 b=AXD9EVJYY5U+oEYE2ZyuHE+xRU43zh3HDrflCznE+hW5T9kCLXVxqusx8IM0xjITnf
 PnqevhwOf8r4K6EQREVzAvt9850zSA8uT4G1WOE6yAaJUE0Y4oz42slJSHXsJt5ebc32
 rYlIpaALRCVrp4J+BGajEBI/YxTw6qcD/7gEJFvuRdh7UFcuNm6CL8Q9P3Sb91O2u0xS
 FzXxGOlz5DbfIz1XdHVKppXnXoPUxt0dVsU26m3dF9gzKjUJIpcZmBZMSOg0NanZgX3f
 XJMKZxRWnDhAzwG21qRwa9MPlarQSKVsrweuW/IDPhMrhDgkty6WBV3p5uMd4JgNfq4s
 UNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QjD52M59CIC16erIFH0qKN75/Ambq9aBVAg1ZqK17E=;
 b=KT7LkvTuPE8TtoDqu/bbQDzbVchj9YKpuj/QPe3F2MV9625M6chMKSjGtBKVe2kxnT
 1NXXXNjoIkI7tvbPdYZVItWS0oR/MVlkcp7mGYfh7vC0Pt0u+b/OGGvhhd3/cP/RP7y5
 WwAlZJjIjzpmHmvHiuXWnq+BQwB1/50GD/O8VAlA2ruFSrmiMbdAY+w3IXwbaMJW03oN
 /ykGLseehbvaCoeOmNUYMISMAh23+NaL0FWjfffnWotwaYmFsU/+FtMRl7kNXkhKjIj7
 JC12TvttRUE9BZwIcWq9k/bNvYXsmKEUZCbpnu53UEvomHq7SFhjw3qUVOei1Cnbt8xN
 Qs0g==
X-Gm-Message-State: APjAAAXfixxqnImchwStchts3cCWJU0FAToZvEMZ+eagwALRaNZfHQmu
 nadEYVigE2cHzsqxjgikzAfknK9ouxI=
X-Google-Smtp-Source: APXvYqydSNX4bXbI6TnEpTXo+Z8fgx7VViVzxKfEgv1HL9OvSTXNcgJXhTj06inFQMnsI1q/SeQNWw==
X-Received: by 2002:a62:be12:: with SMTP id l18mr5156924pff.49.1582612852372; 
 Mon, 24 Feb 2020 22:40:52 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id x7sm15563797pfp.93.2020.02.24.22.40.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:40:51 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 12:10:38 +0530
Message-Id: <cover.1582612624.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V3 00/10] Add new LTP tests related to fsmount family
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

Here is the third version of my work rebased over the latest changes
pushed around fsmount work by Zorro. This is tested on both ARM and X86
platforms now and no more errors are seen with it.

V2->V3:
- Fix errors with xfs.
- Add macros to define test names.
- Continue with multiple iteration tests on failures, instead of
  returning early.
- Set value of is_mounted in open_tree patch.
- Rename tst_ismount() and make it return 1 on success.
- Fix various formatting issues.
- Add all reviewed/ack tags.

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
 lib/tst_device.c                              |  23 ++++
 runtest/syscalls                              |  16 +++
 testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
 testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
 .../kernel/syscalls/fsconfig/fsconfig01.c     | 104 +++++++++++++++
 .../kernel/syscalls/fsconfig/fsconfig02.c     |  98 ++++++++++++++
 testcases/kernel/syscalls/fsmount/.gitignore  |   1 +
 testcases/kernel/syscalls/fsmount/fsmount01.c | 121 +++++++++--------
 testcases/kernel/syscalls/fsmount/fsmount02.c |  79 +++++++++++
 testcases/kernel/syscalls/fsopen/.gitignore   |   2 +
 testcases/kernel/syscalls/fsopen/Makefile     |   6 +
 testcases/kernel/syscalls/fsopen/fsopen01.c   |  83 ++++++++++++
 testcases/kernel/syscalls/fsopen/fsopen02.c   |  55 ++++++++
 testcases/kernel/syscalls/fspick/.gitignore   |   2 +
 testcases/kernel/syscalls/fspick/Makefile     |   6 +
 testcases/kernel/syscalls/fspick/fspick01.c   | 117 +++++++++++++++++
 testcases/kernel/syscalls/fspick/fspick02.c   | 105 +++++++++++++++
 .../kernel/syscalls/move_mount/.gitignore     |   2 +
 testcases/kernel/syscalls/move_mount/Makefile |   6 +
 .../kernel/syscalls/move_mount/move_mount01.c |  86 ++++++++++++
 .../kernel/syscalls/move_mount/move_mount02.c |  95 ++++++++++++++
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 124 ++++++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 104 +++++++++++++++
 27 files changed, 1209 insertions(+), 59 deletions(-)
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
