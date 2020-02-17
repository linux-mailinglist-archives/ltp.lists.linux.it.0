Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4665160DBC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:47:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C5BF3C25BF
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:47:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DB0EA3C25B8
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:47:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0DB511000CD0
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:47:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 41E00B311;
 Mon, 17 Feb 2020 08:47:01 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 17 Feb 2020 09:46:18 +0100
Message-Id: <20200217084622.11199-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7 0/4] Add test for new mount API v5.2
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

hopefully the final version we can merge (so we can continue with Viresh
Kumar tests).

Checked with travis [2].

Changes v6->v7
* replaced Zorro's lapi/fsmount.h with Viresh's (1st commit from [1]),
added autotools checks for his commit.
* add lapi/fcntl.h to fix AT_FDCWD

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1237986/
[2] https://travis-ci.org/pevik/ltp/builds/651376895

Petr Vorel (2):
  tst_umount: Fail immediately when errno != EBUSY
  safe_macros: Use tst_umount() in safe_umount()

Viresh Kumar (1):
  lapi/fsmount: Add definitions for fsmount related syscalls

Zorro Lang (1):
  syscalls/fsmount01: Add test for fsmount series API

 configure.ac                                  |   8 +-
 include/lapi/fsmount.h                        | 134 ++++++++++++++++++
 include/lapi/syscalls/powerpc64.in            |   4 +
 lib/safe_macros.c                             |   2 +-
 lib/tst_device.c                              |   9 +-
 runtest/syscalls                              |   2 +
 testcases/kernel/syscalls/fsmount/.gitignore  |   1 +
 testcases/kernel/syscalls/fsmount/Makefile    |   8 ++
 testcases/kernel/syscalls/fsmount/fsmount01.c |  95 +++++++++++++
 9 files changed, 260 insertions(+), 3 deletions(-)
 create mode 100644 include/lapi/fsmount.h
 create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsmount/Makefile
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c

-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
