Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AEE35D879
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:08:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCCF83C1C6C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 09:08:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5AD693C1B0A
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A2B5F600E54
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 09:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618297685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PFIGwxmvyr4MYOM2dLhDuZSNyqedCzKGRqAMPEy6FhU=;
 b=iGTfhTFrDo8PrL79zZ8lVOM4Y79u849txVkEum26KieE+NQJKKy/Og+VHsCP6jIhXGPGbv
 AooHXFW+cvuZcUDuvZrxO41i/aYCgHjelQveom8iuXDqG2HSvHQvfEzxpoQuYeKyUhQn2e
 YDMyrISmo8tfLaQpejK6wDqy3YqFiVo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A25DAE05;
 Tue, 13 Apr 2021 07:08:05 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 13 Apr 2021 08:07:46 +0100
Message-Id: <20210413070753.1691-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/7] Fuzzy Sync single core support and tests
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

V4: (no change in logic)
* Remove useless variable in pair_init
* Explain TIME_SCALE
* Differentiate between "cs" variables when printing
* Add reviewed by trailers

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
 include/tst_fuzzy_sync.h            | 104 +++++++++---
 lib/newlib_tests/.gitignore         |   2 +
 lib/newlib_tests/Makefile           |   2 +
 lib/newlib_tests/test16.c           |   2 +
 lib/newlib_tests/tst_fuzzy_sync01.c | 235 ++++++++++++++++++++++++++++
 lib/newlib_tests/tst_fuzzy_sync02.c | 177 +++++++++++++++++++++
 lib/tst_cpu.c                       |  26 +++
 8 files changed, 525 insertions(+), 24 deletions(-)
 create mode 100644 lib/newlib_tests/tst_fuzzy_sync01.c
 create mode 100644 lib/newlib_tests/tst_fuzzy_sync02.c

-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
