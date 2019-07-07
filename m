Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47B6163D
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD8D43C1D0D
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2121B3C1C7A
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:33 +0200 (CEST)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 34C581A00E68
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:25 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id s3so13629008wms.2
 for <ltp@lists.linux.it>; Sun, 07 Jul 2019 12:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yOsWY2Pw0meyVvkgeX8+LdVIajcGimGqzaFMF3X0Mp8=;
 b=ItXOGh9ZJG//RUqKkSatRLmTXSywgdnJhqnudUt17NtSPUmStdqP+Le7dX4Zb8b7Aw
 c72rJGeuTqpUXmuTmJjh5X9qEIi5aBJ7SouznKIGiyMHubMWyrL1zz1Sn72gizLUqIZL
 YORBwv2uYcqwfORA+Y9j5DFFYM0GYuizlwSO9goVi0qY4vJrfkn3z7c4o71Ws+7umyay
 IaJQaFdbURBDuyH6S5R+OUC0/WFTNEOUIA2dS8LgGjlOhQk9nCTIH6clB4neZxe37+Gi
 mO6sbqFzCHBzLuin5n+2E9VgcM5Whqybt8PRuGr7t3vP0fYpP/o99dl3VbJ5eJ2E4nwV
 tG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yOsWY2Pw0meyVvkgeX8+LdVIajcGimGqzaFMF3X0Mp8=;
 b=CpPxpRM4xyI30b8X9Yp4jsApJr0/Wq2zvoFcmfk/06JoH4uaHs8gBLFunVgSgLfaMD
 pPK0j95Y16CfK6NGf8wb1Z4ROt5+g8YMGzAqtVfVRUK9eUileHAbNFHWMQeu/RgkPOom
 5o7euBaq0e7qxfnGJYXewqwxwZ+S+FEynneLrQkuNqSJ9g5PBfeiC5l5XblN9Xg02Kyy
 L0w/msyM0GC5O8ziaAGTCHORBwsyl0gZayBpeKnOHC+ru8YhpmXsS6K1OCPgLUTHhPio
 v+Zbyu4r5jB/Jzn/xDlCfStHlPm8MJFBRBqw1q58B6rnzs4Ay3tz+qzQPoe8sg0MnJvQ
 EOSQ==
X-Gm-Message-State: APjAAAVpDPN+cJHTZNObKUSXwmC2ivvuvuI/EyC6C7kde0zMIScMiB+W
 CAeIJeerbWcS0EtoA4lYydwcjRQR
X-Google-Smtp-Source: APXvYqxXYrwpqjySbftsjJ+jmiPnYmkOPq3aWUdoz68g6rAX2UKFgPR2jrTvy89pgrOKFDKcOV9GVg==
X-Received: by 2002:a1c:9dc5:: with SMTP id g188mr13337897wme.93.1562526024496; 
 Sun, 07 Jul 2019 12:00:24 -0700 (PDT)
Received: from x230.suse.de (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d10sm16403849wro.18.2019.07.07.12.00.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 12:00:23 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun,  7 Jul 2019 21:00:11 +0200
Message-Id: <20190707190016.27296-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] setdomainname() converted to new API
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

Hi,

simple to new API + lapi header (fixes for MUSL + (maybe) for Bionic).
Given that sethostname() tests are identical, I'll probably reuse
setdomainname() (compiler time option).

Kind regards,
Petr

Petr Vorel (5):
  lib: include <errno.h> in tst_test.h
  lapi: Add utsname.h
  setdomainname01: Convert to new API
  setdomainname02: Convert to new API
  setdomainname03: Convert to new API

 configure.ac                                  |   1 +
 include/lapi/utsname.h                        |  16 ++
 include/tst_test.h                            |   1 +
 .../syscalls/setdomainname/setdomainname.h    |  58 ++++++
 .../syscalls/setdomainname/setdomainname01.c  | 162 +++-----------
 .../syscalls/setdomainname/setdomainname02.c  | 197 ++++--------------
 .../syscalls/setdomainname/setdomainname03.c  | 195 +++--------------
 7 files changed, 167 insertions(+), 463 deletions(-)
 create mode 100644 include/lapi/utsname.h
 create mode 100644 testcases/kernel/syscalls/setdomainname/setdomainname.h

-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
