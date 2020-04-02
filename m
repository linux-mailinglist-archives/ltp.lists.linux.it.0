Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA619C579
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 17:07:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 649ED3C300D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 17:07:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 79B733C2FC7
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 17:06:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 556C7601AF1
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 17:06:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,335,1580745600"; d="scan'208";a="88404601"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 23:06:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id C715950A999D
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 22:56:14 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 23:06:33 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 23:06:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 2 Apr 2020 23:06:20 +0800
Message-ID: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C715950A999D.AE10F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 00/10] add loop ioctl test
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

This is a set of test for the loop ioctl.

Yang Xu (10):
  lapi: Add a configure check and fallback for loop ioctl and flag
  syscalls/ioctl:add common c file for loop ioctl
  syscalls/ioctl_loop01: Add LO_FLAGS_AUTOCLEAR and LO_FLAGS_PARTSCAN
    test
  syscalls/ioctl_loop02: Add LO_FLAGS_READ_ONLY and LOOP_CHANGE_FD test
  syscalls/ioctl_loop03: Add LOOP_CHANGE_FD test with WR mode
  syscalls/ioctl_loop04: Add LOOP_SET_CAPACITY ioctl test
  syscalls/ioctl_loop05: Add LOOP_SET_DIRECT_IO ioctl test
  syscalls/ioctl_loop06: Add LOOP_SET_BLOCK_SIZE error test
  syscalls/ioctl_loop07: Add dio with logic block size error test
  syscalls/ioctl_loop08: Add LOOP_SET/GET_STATUS64 sizelimit field test

 configure.ac                                  |   1 +
 include/lapi/loop.h                           |  35 +++++
 runtest/syscalls                              |  10 +-
 testcases/kernel/syscalls/ioctl/.gitignore    |   8 +
 testcases/kernel/syscalls/ioctl/Makefile      |   3 +
 .../kernel/syscalls/ioctl/ioctl_loop01.c      | 127 +++++++++++++++
 .../kernel/syscalls/ioctl/ioctl_loop02.c      | 148 ++++++++++++++++++
 .../kernel/syscalls/ioctl/ioctl_loop03.c      |  76 +++++++++
 .../kernel/syscalls/ioctl/ioctl_loop04.c      |  97 ++++++++++++
 .../kernel/syscalls/ioctl/ioctl_loop05.c      | 120 ++++++++++++++
 .../kernel/syscalls/ioctl/ioctl_loop06.c      |  90 +++++++++++
 .../kernel/syscalls/ioctl/ioctl_loop07.c      |  85 ++++++++++
 .../kernel/syscalls/ioctl/ioctl_loop08.c      |  96 ++++++++++++
 .../syscalls/ioctl/ioctl_loop_support.c       |  74 +++++++++
 .../syscalls/ioctl/ioctl_loop_support.h       |  14 ++
 15 files changed, 983 insertions(+), 1 deletion(-)
 create mode 100644 include/lapi/loop.h
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop01.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop02.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop03.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop04.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop05.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop06.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop07.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop08.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop_support.c
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop_support.h

-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
