Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253434B62F
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12EBB3C27CA
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A37413C2791
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:32:58 +0100 (CET)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4C4F12001A4
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:32:58 +0100 (CET)
Received: by mail-pg1-x534.google.com with SMTP id 32so6293667pgm.1
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 03:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLHzYVh4AUmBqeW5CgGy1IgRgeYw71ChpauDoUOJS5g=;
 b=ow5UmTjfuqKKegstsjSfS3u5sxpavXkmZIaiGby0qxCbmwP34t+LP/zY2OJLKvXfHk
 tWgMkQrslHPUZS4O6LFv8CVWH28HCPqKRyWx/W8WSeVog+HaqAiqkpqxXuJ+ggBacvaO
 784t8ZzAgbcvXAmu3Hbj8lD8VTdlbmzQ+giXjMhCJXxzOV+REfGEwXh9hF4ZHp3h0LZR
 Dn1GZPdmSsfYRncgxVO+FU119ZDcRVu47LKZ1Rn1/BuzCFbIIJwz77RlJ2uHBsiuS3XN
 lE+9Zj6oblN3RxpurV5BejlLss1YPyyYYDk6W9bTZ1xRlz1F3PFp6nZkJVw4f08dK0Y2
 Rcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLHzYVh4AUmBqeW5CgGy1IgRgeYw71ChpauDoUOJS5g=;
 b=tM4jGCoeXtECIzne04gFJRvw/RLWM5TurMTj2U86XZmHUpSzUGvTuGDQ6HAZwDnSW1
 slVQns4Ldz1wXvFIMRN+t5xbPtBu+Q2NumaT1Kp+QSJ/EsCeJjFR2dkghP6tgV8CAyAe
 7K11zXGjtSeFVmg0021TQAMUqWkSf6fZ26VnNjS5blkr7foSwmVnQQBe3X3d31hkEis5
 osI6pWfaOkWyIzJ8xiN9f76viVpSDqMQvXr32DmjzL35f16lAQNgMkQvxl0T9tS8F5NE
 sKCckfRcKB3MNbIeOHLgYzkbbbV9neX8LX5Fb/F/3w6ohEuffoz4siVYxHQYOGMGQh6q
 Ld6w==
X-Gm-Message-State: AOAM533fN5LcVCBXgaLQ9fDlp87/6YIM6J+xtMxBwj90suOg1LRW48gi
 43EXbFrwGKqSRKfrc6uwkVCbyMGtIV+95A==
X-Google-Smtp-Source: ABdhPJx4RMWimy2h8VU1cJJoPiZo99qkvwQoKuPWBxjU2GttwlerfNKGzs/puwqD8fDwNutbn/PxpA==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr15970285pgf.414.1616841176350; 
 Sat, 27 Mar 2021 03:32:56 -0700 (PDT)
Received: from localhost.localdomain (softbank060103061185.bbtec.net.
 [60.103.61.185])
 by smtp.gmail.com with ESMTPSA id q184sm11890097pfc.78.2021.03.27.03.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 03:32:55 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 27 Mar 2021 19:32:20 +0900
Message-Id: <20210327103226.99073-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/6] Convert syscalls/swap{on,off}/ to the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Rename libs/libltpswapon libs/libltpswap and Convert it to the new API
Convert syscalls/swap{on,off}/ to the new API

QI Fuli (6):
  libs/libltpswap: Add libs/libltpswap by using the new API
  syscalls/swapon/swapon01: Convert swapon01 to the new API
  syscalls/swapon/swapon02: Convert swapon02 to the new API
  syscalls/swapon/swapon03: Convert swapon03 to the new API
  syscalls/swapoff/swapoff01: Convert swapoff01 to the new API
  syscalls/swapoff/swapoff02: Convert swapoff02 to the new API

 include/libswap.h                             |  24 ++
 include/libswapon.h                           |  39 ---
 libs/{libltpswapon => libltpswap}/Makefile    |   2 +-
 libs/libltpswap/libswap.c                     |  63 +++++
 libs/libltpswapon/libswapon.c                 |  90 -------
 testcases/kernel/syscalls/swapoff/Makefile    |   4 +-
 testcases/kernel/syscalls/swapoff/swapoff01.c |  94 ++------
 testcases/kernel/syscalls/swapoff/swapoff02.c | 142 ++++-------
 testcases/kernel/syscalls/swapon/Makefile     |   4 +-
 testcases/kernel/syscalls/swapon/swapon01.c   |  83 ++-----
 testcases/kernel/syscalls/swapon/swapon02.c   | 145 ++++-------
 testcases/kernel/syscalls/swapon/swapon03.c   | 227 +++++++-----------
 12 files changed, 317 insertions(+), 600 deletions(-)
 create mode 100644 include/libswap.h
 delete mode 100644 include/libswapon.h
 rename libs/{libltpswapon => libltpswap}/Makefile (89%)
 create mode 100644 libs/libltpswap/libswap.c
 delete mode 100644 libs/libltpswapon/libswapon.c

-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
