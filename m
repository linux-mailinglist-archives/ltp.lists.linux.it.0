Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B403E2E82
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A6AC3CA3F4
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35B7C3C5361
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:02 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 81BC714001E1
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:01 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id y34so19092455lfa.8
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jzG2wYsEViserrQB/0KLNqrIYgygS0lsJEOn2EZuXs=;
 b=zniiRAU3RffAZXHsHhQQW6eSGgzRGjryt6UqW5/HRk34m+ZMV0YgPd9zP57nuYXp/l
 uRX9XKSUwl8JQarTooxpZAeLPLrolbdLohVplIbGSUop9y29RSpohCTXdif0XcQXUTdn
 2sm4NXpxaHF2Qo1vApi/piZR6BCjWl/NShJrlOjsG3po+1GW+e9ADKOmbJ4VOZDGkbAC
 0xiBCt6KUFoNFiJwuUx3JnKCJ0Oo18qZXsljXmbqJWBvC3gtZUAYX9EVZ2zw6Io3xzj3
 vEwdXLgBAfBw0YbMfHZNNUG/47dg4/UY1UsiQStPB79nX6QzRl/ljsj1EnOszlmh7p4u
 7M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/jzG2wYsEViserrQB/0KLNqrIYgygS0lsJEOn2EZuXs=;
 b=Rq2wnNJGJE+kMZ0zB2/KDC1vy0vcCrZRqhIb7uTJWpXVPey/orQ4tRFry4OAYgnjBk
 oPQtBtmc6Qjvjxc3hiq1D00UOPwYVIh1j9iaA7gXF+q0M66HslDBhOjuGFK+CoZXEI5w
 ioxlDjdtqjYyeDnRmbEDJRyDTyxKLRM/qsK4zETjJuqD+DpCxBDbwqWiZv/e2/GCkQjN
 FgTkj4cLt8xABweQo4f4IYAdo5KKISsj3m0/zYEiSsvL4OEKEfiX3LRMkf1zPu5X3FCK
 XUQz9AKSK9eBeOXoOoM66aeVIU8tc7eAY/bJ/xTBCgZMqhLalkF/faqUWLVsMZeQS+be
 SiEA==
X-Gm-Message-State: AOAM531vxhuoTp2qAwdqK6nwNGHg4e2Bx4RF5Cami+5QBpUxqKNNv3gR
 /Mny9e/dYFPtnNiaKfboG+6ayCRtWuAq
X-Google-Smtp-Source: ABdhPJwLE7HstipyWwIICD4Rq/nHDEAB6tG98bjXVlwI98h2Jspy/+eQFCX3aUJRG9XbLWPgViv5pw==
X-Received: by 2002:a05:6512:ba9:: with SMTP id
 b41mr8632619lfv.231.1628268480817; 
 Fri, 06 Aug 2021 09:48:00 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:00 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:14 +0300
Message-Id: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 00/16] syscalls/sched_*: convert to new API and
 handle ENOSYS errno
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The patch-set adds new libc/sys_sched_* wrappers to test libc
and syscall variants of sched_*() functions seperately.

This is needed because musl libc returns ENOSYS for those
functions [1], and the tests just fails with it.

[1]: https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5

v2: Using test variants

Alexey Kodanev (16):
  lib/tst_sched: add ltp sys/libc_sched_*() wrappers
  syscalls/sched_getparam01: use libc/sys_sched_*()
  syscalls/sched_getparam03: use libc/sys_sched_*()
  syscalls/sched_setparam01: convert to new API
  syscalls/sched_setparam02: convert to new API
  syscalls/sched_setparam03: convert to new API
  syscalls/sched_setparam04: convert to new API
  syscalls/sched_setparam05: convert to new API
  syscalls/sched_rr_get_interval01: use sys_sched_*()
  syscalls/sched_rr_get_interval02: use sys_sched_*()
  syscalls/sched_rr_get_interval03: use sys_sched_*()
  syscalls/sched_setscheduler01: convert to new API
  syscalls/sched_setscheduler02: convert to new API
  syscalls/sched_setscheduler03: use libc/sys_sched_*()
  syscalls/sched_getscheduler01: convert to new API
  syscalls/sched_getscheduler02: convert to new API

 include/tst_sched.h                           |  70 ++++++
 .../sched_getparam/sched_getparam01.c         |  17 +-
 .../sched_getparam/sched_getparam03.c         |  13 +-
 .../sched_getscheduler/sched_getscheduler01.c | 154 ++++--------
 .../sched_getscheduler/sched_getscheduler02.c | 109 ++------
 .../sched_rr_get_interval01.c                 |   4 +-
 .../sched_rr_get_interval02.c                 |   4 +-
 .../sched_rr_get_interval03.c                 |   4 +-
 .../sched_setparam/sched_setparam01.c         | 140 ++---------
 .../sched_setparam/sched_setparam02.c         | 207 ++++-----------
 .../sched_setparam/sched_setparam03.c         | 235 +++++-------------
 .../sched_setparam/sched_setparam04.c         | 167 +++----------
 .../sched_setparam/sched_setparam05.c         | 192 +++-----------
 .../sched_setscheduler/sched_setscheduler01.c | 180 ++++----------
 .../sched_setscheduler/sched_setscheduler02.c | 165 ++++--------
 .../sched_setscheduler/sched_setscheduler03.c |  39 +--
 16 files changed, 504 insertions(+), 1196 deletions(-)
 create mode 100644 include/tst_sched.h

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
