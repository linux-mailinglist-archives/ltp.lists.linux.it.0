Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD48F341814
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:19:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BE5E3C5FC6
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:19:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3121A3C5FAC
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CC4D620004C
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:19:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616145554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3t+9oJM7jo+NRAzRzQp7gI4SH5sGDzVwXDHNbYsJaaU=;
 b=nDu82toAaUmTImVmJfDiAQRFLUDjQ467IlNHaq+2v0/IqdKRhu1VGtb6jEd9g8JTm8F0rM
 JZnY6Oer0lM9PF0Hmb0WLZyzaJMTW6NmUWAYCPpr+MsjpxQwO9SkpdiDJCyLMGpDeeG+e5
 GNlPMX/KAhcTn9rlOY7LMo57EHtbZPQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22D50AC1F;
 Fri, 19 Mar 2021 09:19:14 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 09:18:30 +0000
Message-Id: <20210319091837.27319-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/7] Fuzzy Sync single core support and tests
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

V3:
* Add -pthread to test CFLAGS
* Substitute CPU_COUNT for CPU_COUNT_S and check for alloc failure

V2:
* Add tst_ncpus_available() to API
* Don't use CHK macro for yield_in_wait to prevent compiler warnings
* Simplify and split the test in two

I'm reasonably confident of the first tests correctness. The second is
maybe not complete and more formal analyses is needed IMO. I suspect
also that we can remove add_delay_bias and implement randomised
probing instead. The more I think about it the more clear it becomes,
but it may require some bigger changes to how we calculate and
introduce the delays.

Occasionally some tests may not reach the lower threshold and fail. It
may be caused by changes in the environment between the measuring and
delay implementation phases. This is also something which could be
investigated.

Anyway this is all still very time consuming and making it perform
well on single core is most important right now.

Leo Yu-Chi Liang (1):
  fzsync: Add sched_yield for single core machine

Richard Palethorpe (6):
  fzsync: Add self tests
  fzsync: Reset delay bias
  fzsync: Correctly print positive lower delay range bound
  fzsync: Move yield check out of loop and add yield to delay
  API: Add tst_ncpus_available
  fzsync: Check processor affinity

 include/tst_cpu.h                   |   1 +
 include/tst_fuzzy_sync.h            | 106 ++++++++++---
 lib/newlib_tests/.gitignore         |   2 +
 lib/newlib_tests/Makefile           |   2 +
 lib/newlib_tests/test16.c           |   2 +
 lib/newlib_tests/tst_fuzzy_sync01.c | 232 ++++++++++++++++++++++++++++
 lib/newlib_tests/tst_fuzzy_sync02.c | 179 +++++++++++++++++++++
 lib/tst_cpu.c                       |  26 ++++
 8 files changed, 526 insertions(+), 24 deletions(-)
 create mode 100644 lib/newlib_tests/tst_fuzzy_sync01.c
 create mode 100644 lib/newlib_tests/tst_fuzzy_sync02.c

-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
