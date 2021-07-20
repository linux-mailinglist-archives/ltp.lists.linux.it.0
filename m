Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B28CB3CFA9D
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E06A3C9819
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB7313C2B48
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:07 +0200 (CEST)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C6F7520034E
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:06 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id l11so15840751ljq.4
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2wa6kCrf5mDsXHplEuSQnQi7D9eMdFKhg5C0N9Cy7w=;
 b=bLrtnwgWHWaCvCGwbk5kmWVdiPRBgOC5alGwRYrCOC6aB1u4RTcyihu0C9K9Pu6D1/
 Wv1LLUBTvWAvzxOj92XAW7mWd7OqCK9IpGziPO9AhJMfa7L3wMM6+syxY+Qt0y4tLctF
 o78wnRoNK3vlhE01/s4fShBr76otdVOihlN34bS8vnaWVOIkQGRpc3QO6xMKZNYGX6cl
 hAI/kfU3j+dGQZqvQOa/WhUNCt03nBPg5VaQATpqNqIG+kkgJyT7mJ2kGZEHPgqhP1UV
 T0eO3N5hPBPK19A6Efy38rrBebqo+7gBRbPkk2lqG7CQnwZtHnJeX+11PGb/choRd3wx
 j6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2wa6kCrf5mDsXHplEuSQnQi7D9eMdFKhg5C0N9Cy7w=;
 b=T/LK/eS0OaJ1M05ujDjVmQvLrhu6Atn9zxcfxneQiHMmFCw59Ip2wuLLmzKaMumXEb
 YAE1O4CfUSSMLjMp2RFRJURewi041vIjPOLOBDrHV1cDkbM7it2P1MbOs7fQ2a/BlqYJ
 E8p+RxVstfV/QdHV8wUIcVPvqujoDf4ic6wpFlRWdB+23XbtX/dMcqex7nF2vMJSuGAL
 tR/zk+L+RqxiJtCgGSZiSce4Kf8QvHeU69JJGeINRgDU+lhyxfZ87N2kziTbaYw9dVFg
 JcxCyfCJm1ZvSxUyFiZtrWvCrcI8ex+b2ySoAg1OrfDR2hvXbkWXjRfWl37uye82Sd6N
 klUg==
X-Gm-Message-State: AOAM532gprmRWndoYLTw+Wfv75J7UDm1lmkPOLA0H4FKs4Lsq+ehNxCl
 Om+qQsywzq2pquEy4p+SUXT+Ysss79gM
X-Google-Smtp-Source: ABdhPJyS/t6k5tPMSJ2NR6VpZuc3C4bYO8RQZwtwilbcvDOi0/ncNP3RelQ5f/YCmIc3T8wZ+mECsg==
X-Received: by 2002:a05:651c:12c7:: with SMTP id
 7mr5134340lje.427.1626788046062; 
 Tue, 20 Jul 2021 06:34:06 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:05 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:08 +0300
Message-Id: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 00/16] syscalls/sched_*: convert to new API and handle
 ENOSYS errno
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

The patch-set introduced new tst_sched_* wrappers to handle ENOSYS
error that can be returned by libc (musl [1]). In that particular
case the wrapper uses syscall directly to test the kernel anyway.

[1]: https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5

Alexey Kodanev (16):
  lib/tst_sched: add ltp tst_sched_*()
  syscalls/sched_getparam01: use tst_sched_*()
  syscalls/sched_getparam03: use tst_sched_*()
  syscalls/sched_setparam01: convert to new API
  syscalls/sched_setparam02: convert to new API
  syscalls/sched_setparam03: convert to new API
  syscalls/sched_setparam04: convert to new API
  syscalls/sched_setparam05: convert to new API
  syscalls/sched_rr_get_interval01: use tst_sched_*()
  syscalls/sched_rr_get_interval02: use tst_sched_*()
  syscalls/sched_rr_get_interval03: use tst_sched_*()
  syscalls/sched_setscheduler01: convert to new API
  syscalls/sched_setscheduler02: convert to new API
  syscalls/sched_setscheduler03: use tst_sched_*()
  syscalls/sched_getscheduler01: convert to new API
  syscalls/sched_getscheduler02: convert to new API

 include/tst_sched.h                           |  16 ++
 lib/tst_sched.c                               |  36 +++
 .../sched_getparam/sched_getparam01.c         |   6 +-
 .../sched_getparam/sched_getparam03.c         |   4 +-
 .../sched_getscheduler/sched_getscheduler01.c | 141 +++---------
 .../sched_getscheduler/sched_getscheduler02.c | 104 ++-------
 .../sched_rr_get_interval01.c                 |   4 +-
 .../sched_rr_get_interval02.c                 |   4 +-
 .../sched_rr_get_interval03.c                 |   4 +-
 .../sched_setparam/sched_setparam01.c         | 135 ++---------
 .../sched_setparam/sched_setparam02.c         | 195 +++-------------
 .../sched_setparam/sched_setparam03.c         | 215 ++++--------------
 .../sched_setparam/sched_setparam04.c         | 161 +++----------
 .../sched_setparam/sched_setparam05.c         | 186 +++------------
 .../sched_setscheduler/sched_setscheduler01.c | 171 ++++----------
 .../sched_setscheduler/sched_setscheduler02.c | 154 +++----------
 .../sched_setscheduler/sched_setscheduler03.c |  10 +-
 17 files changed, 345 insertions(+), 1201 deletions(-)
 create mode 100644 include/tst_sched.h
 create mode 100644 lib/tst_sched.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
