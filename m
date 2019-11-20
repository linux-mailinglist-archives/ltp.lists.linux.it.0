Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B00103667
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 10:13:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1223B3C2022
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 10:13:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 48B4A3C0738
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 10:13:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id E54731A01488
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 10:13:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,221,1571673600"; d="scan'208";a="78787320"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 17:13:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id E9CA84CE1BE4
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 17:05:17 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 20 Nov 2019 17:13:34 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 20 Nov 2019 17:13:31 +0800
Message-ID: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E9CA84CE1BE4.A06BB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/5]  optimize quotactl test code
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

I cleanup the quotactl code and add project quota test for quotactl.
Thanks to Jan Kara with support about quota.


------------
v3->v4
check some new features(such as Q_GETNETXSTAT,Q_XGETNEXTSTAT,Q_XGETQSTATV)
whether supported in setup by using ltp customized struct
------------
Yang Xu (5):
  syscalls/quotactl01: Add Q_GETNEXTQUOTA test
  syscalls/quotactl02: Add Q_XGETQSTATV test and group quota tests
  syscalls/quotactl04: add project quota test for non-xfs filesystem
  syscalls/quotactl05: add project quota test on xfs filesystem
  syscalls/quotactl06: Add new error testcase

 configure.ac                                  |   1 +
 include/lapi/quotactl.h                       |  80 +++++--
 m4/ltp-quota.m4                               |   8 +
 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/quotactl/.gitignore |   3 +
 .../kernel/syscalls/quotactl/quotactl01.c     | 107 ++++++---
 .../kernel/syscalls/quotactl/quotactl02.c     | 222 ++++++++----------
 .../kernel/syscalls/quotactl/quotactl02.h     | 167 +++++++++++++
 .../kernel/syscalls/quotactl/quotactl04.c     | 162 +++++++++++++
 .../kernel/syscalls/quotactl/quotactl05.c     | 118 ++++++++++
 .../kernel/syscalls/quotactl/quotactl06.c     | 196 ++++++++++++++++
 11 files changed, 906 insertions(+), 161 deletions(-)
 create mode 100644 m4/ltp-quota.m4
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl02.h
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl04.c
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl05.c
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl06.c

-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
