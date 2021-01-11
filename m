Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D82F0E55
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:41:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54C0E3C5FC9
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:41:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CF6AA3C313B
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:26 +0100 (CET)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CF82C1000249
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:25 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id j13so10122602pjz.3
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ofJztJZTnz3YLCMfAA6J81RbZUU1yIHk6EEIwEv6/ls=;
 b=t1a6EnxHH2VUINueePt12TQWpQQ5vZPxkZUfQFRUQBZ9ZUvicbUVf8vMKSeMS/MThS
 ZgDZI2MZv5DEC89mbSjBGl3RP3uyFcy6tx+llqBNUDEBWmjpqI+o0ZceMI4WnRuHcbst
 20mPwRWILYQhutGJJwjrUze4j8C78vZZGyIAS4Xw30bCKwpvWf8jRXGDZ+nP479y08/J
 8NJ19NULjXZ7dJ60GWCtiqBYSXL/BetujyaD05Z5hAKtTrm+WYfZuIpfmVTRA6kCycbk
 rdFJ3x0f/9sFoG51lL1Wm2/wS+kxI2IaslutpbIT4kjvM/5X6+s7kYSPgOOtmA25Foga
 ZgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ofJztJZTnz3YLCMfAA6J81RbZUU1yIHk6EEIwEv6/ls=;
 b=IuHw9FlhosvelhW/1/uLhPVmkJ4DKOiJNvWkd4HLAmDrWHk4uXrAYRL1rL/kOdgSQq
 RyKKDHqYAk2kO4tO++4IL2x1T3GpKdBIVq+7fqopwu1/MYA/AaXiNJbV1hbe/OEtP105
 fSVqbKOVoqquKLgT44Tg098WEXOpLaaCPvC9Rr9SZU8ci9ttYqUy9Uo3iaa5PtcfexsW
 q9B9m3ciJd1Kcwi6w9zcwNyppJpu9CUUnScnbUjToaSOxYH3Q/qs3iLVaxkkvEzC3U/S
 BkebgFHxuNLZIo2i3kW7mZQAnafFvGD2thdq2PE3uPPDeJlsPVk3brcEC+IXX5EudztW
 fauA==
X-Gm-Message-State: AOAM531QfHCEwhukFc3LI7x9490chuhzrWAjdOkLTDdyB3Je/WciqLQB
 3PQKxoK+NPXFaQnNaVt+9Ik=
X-Google-Smtp-Source: ABdhPJzMkggDUeODoA2ob3NJrzW+UpNMfCNrIzG7fJ3+hBugnl4LRdyvGPu1EfaD3FZhsRsPl0Y71w==
X-Received: by 2002:a17:90b:943:: with SMTP id
 dw3mr16473003pjb.97.1610354484385; 
 Mon, 11 Jan 2021 00:41:24 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u12sm19186901pgi.91.2021.01.11.00.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 00:41:24 -0800 (PST)
From: gengcixi@gmail.com
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Mon, 11 Jan 2021 16:37:07 +0800
Message-Id: <20210111083711.1715851-1-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 0/3] add rtctime libs and rtc02 case
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

This file is a implementation for rtc test function
in tst_rtctime lib, support tst_rtc_gettime and tst_rtc_settime;
at the same file, also add rtctime and time_t convert functions.
in tst_wallclock.s, add tst_rtc_save and tst_rtc_restore for testcase
used in SETUP and CLEANUP.

the rtc02 testcase is verify set rtctime a exact timestamp.

V2 changes:
1. add passing rtd_dev int tst_rtc_gettime, tst_rtc_settime, 
  tst_rtc_clock_save and tst_rtc_clock_restore functions.
  
2. move check device exist functions from lib into testcase

3. rename tst_rtctime_save|tst_rtctime_restore to tst_rtc_clock_save|
  tst_rtc_clock_restore

4. test description and identifiers format issues.

NO chanages:
1. keep tst_rtc_gettime and tst_rtc_settime no change to "static 
   inline"(V1) for some compile warning and referring to 
   tst_clock_gettime in tst_clocks.h

2. in .h, use identifiers format "/* XXX /*" rather than "// XXX" 
   for kernel checkpatch "WARNING" as follow:

```
WARNING: Improper SPDX comment style for 'include/tst_rtctime.h', please use '/*' instead
\#26: FILE: include/tst_rtctime.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
\#26: FILE: include/tst_rtctime.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later
```

Cixi Geng (3):
  lib: add tst_rtctime* for rtc test
  lib: implement rtc_clock_save and rtc_clock_restore function
  device-drivers/rtc: add verify rtc set time case

 include/tst_rtctime.h                         |  15 ++
 include/tst_wallclock.h                       |   4 +
 lib/tst_rtctime.c                             | 159 ++++++++++++++++++
 lib/tst_wallclock.c                           |  44 +++++
 runtest/kernel_misc                           |   1 +
 .../kernel/device-drivers/rtc/.gitignore      |   1 +
 testcases/kernel/device-drivers/rtc/rtc02.c   | 111 ++++++++++++
 7 files changed, 335 insertions(+)
 create mode 100644 include/tst_rtctime.h
 create mode 100644 lib/tst_rtctime.c
 create mode 100644 testcases/kernel/device-drivers/rtc/rtc02.c

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
