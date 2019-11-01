Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72326EC34A
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 13:55:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 165163C23F4
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Nov 2019 13:55:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BDB8A3C23EA
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 13:55:48 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 7784C1400524
 for <ltp@lists.linux.it>; Fri,  1 Nov 2019 13:55:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77795791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 20:55:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 56F1E41B7076;
 Fri,  1 Nov 2019 20:47:36 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 1 Nov 2019 20:55:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <pvorel@suse.cz>
Date: Fri, 1 Nov 2019 20:55:54 +0800
Message-ID: <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20191031152646.GA7078@dell5510>
References: <20191031152646.GA7078@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 56F1E41B7076.AD5F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/5] optimize quotactl test code
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

I cleanup the quotactl code and add project quota test for quotactl.
Thanks to Jan Kara with support about quota.


------------
v2->v3:
1.for quotactl02.c, add group quota test
2.add quotactl04.c and add quota05.c to test project quota.
3.add quotactl06.c to test error
4. fix build erro on centos6 
ps:don't test Q_XQUOTARM in quotactl02,04 because cycle running will
report ENOSYS (quota feture has been off). I will introduce a
new test to test it and also a regression test for commit[1].
[1]https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=for-next&id=3dd4d40b420846dd35869ccc8f8627feef2cff32
[2]https://travis-ci.org/xuyang0410/ltp/builds/605963472?utm_medium=notification&utm_source=github_status
------------

Yang Xu (5):
  syscalls/quotactl01.c: Add Q_GETNEXQUOTA test
  syscalls/quotactl02.c: Add Q_XGETQSTATV test
  syscalls/quotactl04: add project quota test for non-xfs filesystem
  syscalls/quotactl05: add project quota test for xfs filesystem
  syscalls/quotactl06: Add new testcase

 configure.ac                                  |   1 +
 include/lapi/quotactl.h                       |  34 +--
 m4/ltp-quota.m4                               |   8 +
 runtest/syscalls                              |   3 +
 testcases/kernel/syscalls/quotactl/.gitignore |   4 +
 .../kernel/syscalls/quotactl/quotactl01.c     |  53 +++--
 .../kernel/syscalls/quotactl/quotactl02.c     | 193 +++++++-----------
 .../kernel/syscalls/quotactl/quotactl02.h     | 152 ++++++++++++++
 .../kernel/syscalls/quotactl/quotactl04.c     | 155 ++++++++++++++
 .../kernel/syscalls/quotactl/quotactl05.c     |  99 +++++++++
 .../kernel/syscalls/quotactl/quotactl06.c     | 183 +++++++++++++++++
 11 files changed, 745 insertions(+), 140 deletions(-)
 create mode 100644 m4/ltp-quota.m4
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl02.h
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl04.c
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl05.c
 create mode 100644 testcases/kernel/syscalls/quotactl/quotactl06.c

-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
