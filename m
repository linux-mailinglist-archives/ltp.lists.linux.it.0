Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEBC1AB9F1
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 09:29:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A4133C64A2
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 09:29:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 50F5C3C2AFF
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 09:29:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BB3811001370
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 09:29:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,390,1580745600"; d="scan'208";a="89140493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Apr 2020 15:29:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EE83049DF12A
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 15:18:32 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Apr 2020 15:29:03 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 16 Apr 2020 15:29:05 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 16 Apr 2020 15:28:59 +0800
Message-ID: <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EE83049DF12A.AC76D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/3] increase pipe2 coverage
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

Fixes:#625
v2->v3:
Add pipe2_02.c and  pipe2_03.c test.

Noticed that:
Cases use SAFE_PIPE2 macro(it is in review[1]).
[1]https://patchwork.ozlabs.org/project/ltp/patch/20200409211255.1357-2-laniel_francis@privacyrequired.com/
Also, laniel has writed test case for pipe2 O_NONBLOCK flag, so I only
cover O_CLOEXEC and O_DIRECT flag.

Yang Xu (3):
  syscalls/pipe2_01: convert into new API
  syscalls/pipe2_02: Add new test for pipe2 O_CLOEXEC flag
  syscalls/pipe2_03: Add new test for pipe2 O_DIRECT flag

 include/lapi/fcntl.h                          |   4 +
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/pipe2/.gitignore    |   2 +
 testcases/kernel/syscalls/pipe2/pipe2_01.c    | 234 +++++-------------
 testcases/kernel/syscalls/pipe2/pipe2_02.c    | 214 ++++------------
 .../kernel/syscalls/pipe2/pipe2_02_child.c    |  26 ++
 testcases/kernel/syscalls/pipe2/pipe2_03.c    | 157 ++++++++++++
 7 files changed, 305 insertions(+), 333 deletions(-)
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02_child.c
 create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c

-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
