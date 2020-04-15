Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7D1A9C2E
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:26:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00C8C3C2B2E
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:26:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D863C3C2B04
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 50304201117
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EAC7DABAD;
 Wed, 15 Apr 2020 11:26:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 13:26:26 +0200
Message-Id: <20200415112635.14144-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/9] Fix compilation with -fno-common (gcc-10)
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

I added 1st commit "Remove use of TCID in new API tests" which allows to
remove extern const char *TCID;

https://travis-ci.org/github/pevik/ltp/builds/675251626

Kind regards,
Petr

Petr Vorel (9):
  Remove use of TCID in new API tests
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
 include/tst_test.h                            |  4 ---
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
 .../kernel/mem/tunable/overcommit_memory.c    |  4 +--
 .../security/integrity/ima/src/ima_mmap.c     |  3 +-
 .../syscalls/memfd_create/memfd_create01.c    |  3 +-
 testcases/realtime/include/librttest.h        |  1 -
 testcases/realtime/lib/librttest.c            |  1 +
 23 files changed, 42 insertions(+), 51 deletions(-)

-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
