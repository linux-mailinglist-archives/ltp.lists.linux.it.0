Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 063851A98DA
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:28:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C0D93C2B1B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 11:28:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 68C3A3C2AF6
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:28:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ADC0C1A0118E
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 11:28:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 312D2AE39;
 Wed, 15 Apr 2020 09:28:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 11:28:01 +0200
Message-Id: <20200415092809.20240-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/8] Fix compilation with -fno-common (gcc-10)
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

there was more broken code than I first expected.
Comments and testing are welcome.

https://travis-ci.org/github/pevik/ltp/builds/675216826

Kind regards,
Petr

Petr Vorel (8):
  lib: Fix linking error multiple TCID definitions with -fno-common
  controllers: Simplify fullpath definition
  controllers: Fix linking with -fno-common
  kernel/mem: Fix linking error with -fno-common
  hugepage: Fix linking error with -fno-common
  hugetlb: Fix linking error with -fno-common
  realtime: Fix linking error with -fno-common
  travis: Build with -fno-common

 build.sh                                      |  2 +-
 include/tst_hugepage.h                        |  4 +--
 include/tst_test.h                            |  6 ++--
 lib/tst_hugepage.c                            |  2 ++
 lib/tst_test.c                                |  5 +++
 .../controllers/cpuctl/cpuctl_def_task01.c    |  2 --
 .../controllers/cpuctl/cpuctl_def_task02.c    |  2 --
 .../controllers/cpuctl/cpuctl_def_task03.c    |  2 --
 .../controllers/cpuctl/cpuctl_def_task04.c    |  2 --
 .../kernel/controllers/cpuctl/cpuctl_test01.c |  2 --
 .../kernel/controllers/cpuctl/cpuctl_test02.c |  1 -
 .../kernel/controllers/cpuctl/cpuctl_test03.c |  2 --
 .../kernel/controllers/cpuctl/cpuctl_test04.c |  2 --
 .../libcontrollers/libcontrollers.c           | 11 +++++++
 .../libcontrollers/libcontrollers.h           | 32 ++++++-------------
 testcases/kernel/mem/hugetlb/lib/hugetlb.c    |  2 ++
 testcases/kernel/mem/hugetlb/lib/hugetlb.h    |  2 +-
 testcases/kernel/mem/include/mem.h            |  2 +-
 testcases/realtime/include/librttest.h        |  1 -
 testcases/realtime/lib/librttest.c            |  1 +
 20 files changed, 38 insertions(+), 47 deletions(-)

-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
