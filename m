Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8542434068E
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:11:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5754C3C6068
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:11:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2FB793C603A
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:40 +0100 (CET)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B523F1401122
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:39 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id g20so3517357wmk.3
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bldjMh9BSSedkuIfEN4va8Md3di42R1m+RcfWYiuTvA=;
 b=Z+u10FP5D8ddylKo5MLFS5s+Y/I/H/qz4WuFt/+mHGWCP9I4ewah+D9oi5p/cpgNFF
 y2sVFR3AHthHhzQluyCakwsN2CQlKa4YZx4RP1bgnsXS92IwtR0UglJhwkj3RVNzFYD0
 0VruxZcyB1NcC+DshhznaYUD7f/hUln23vQ8tQ8XeigMvALEJDh5yjq2ivglxHpE7icF
 vi9Y3TsbUP4Kq9EDIb8tE+PwTxWEgU3JBtnSFL0qShMZJWXWoBz1NBMcoVhVUYlxx88/
 NdvRceKyoPYl4gEN15Sjq/9P2pH9z1jfffC8YffDP4AXtqO4ebkLTGoqNkbsoBl7ptfV
 Qgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bldjMh9BSSedkuIfEN4va8Md3di42R1m+RcfWYiuTvA=;
 b=MuNVY+hSeeJ/OVWIB4KEY4qXYw5/51jaIagGQGs7J0AEWUgXqSx7oWISwk8esaJyhN
 oiVabez/1IKs8XkLzma2+icQHTpi3r/GQji24tVu3WXS1YKcHsCylSBK+QMST9c/HCw3
 SpB+fAWYc+oiGroPjEzuyx5LFRZ4XFv/c3N8hhqtTmY06COhCQuoJEjv7I4IVuJvWU25
 57bwN08CBAa7elA3s7t1GT+PmLc2ruJoFTNSpi4I/Zo2jbxqp06h26Fyd/L4kslE4DWh
 UKgEJgJitH37/osfPQ8iDFIWHj3VhYE9B1kG4Dg4yssUTNZi8XAbB+f0ZLxlCixF1sfm
 4o4A==
X-Gm-Message-State: AOAM531Eb5g7Ed/W/+cjExn5arCQqUmt17JOspcv+/sz/R1EkokhhM32
 3POWStUT7QAepCyCmuRUoh2/2BDB6J0=
X-Google-Smtp-Source: ABdhPJzsNSiPEpqiW8DWdJRHlUDuazkf/RlvBR1ipIaEa9NeN+k7+9DpkNk52o/EnHW/0/xc6JvR3g==
X-Received: by 2002:a1c:b70b:: with SMTP id h11mr3630921wmf.10.1616073099302; 
 Thu, 18 Mar 2021 06:11:39 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:38 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:26 +0200
Message-Id: <20210318131134.3562203-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/8] fanotify tests for v5.13
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Following tests were used for development of the two features
queued for v5.13 (in linux-next):
- Performance improvements for events merge [1]
- Unprivileged fanotify listener [2]

All test cases of fanotify05 pass on upstream, but their runtime
on linux-next is reduced by more than half.

Only the first test case of fanotify17 pass on upstream.
The rest of the test cases as well as fanotify18 and fanotify19
tests exit with TCONF on upstream. They all pass on linux-next.

Thanks,
Amir.

[1] https://lore.kernel.org/linux-fsdevel/20210304104826.3993892-1-amir73il@gmail.com/
[2] https://lore.kernel.org/linux-fsdevel/20210304112921.3996419-1-amir73il@gmail.com/

Amir Goldstein (8):
  syscalls/fanotify05: Fix test output when not getting overflow
  syscalls/fanotify05: Verify events are received by queue order
  syscalls/fanotify05: Verify getting a single overflow event
  syscalls/fanotify05: Add a test case for unlimited queue
  syscalls/fanotify05: adjust test to tunable max_queued_events
  syscalls/fanotify: New test for fanotify user limits
  syscalls/fanotify: New test to validate unprivileged user permissions
  syscalls/fanotify: New test to validate unprivileged listener events

 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/fanotify/.gitignore |   3 +
 testcases/kernel/syscalls/fanotify/fanotify.h |   3 +
 .../kernel/syscalls/fanotify/fanotify05.c     | 147 ++++++++--
 .../kernel/syscalls/fanotify/fanotify17.c     | 266 ++++++++++++++++++
 .../kernel/syscalls/fanotify/fanotify18.c     | 198 +++++++++++++
 .../kernel/syscalls/fanotify/fanotify19.c     | 253 +++++++++++++++++
 7 files changed, 845 insertions(+), 28 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify17.c
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify18.c
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify19.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
