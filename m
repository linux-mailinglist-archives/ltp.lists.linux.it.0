Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC4122869
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:12:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93D383C2388
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:12:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5015D3C18F9
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C58A31400428
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,325,1571673600"; d="scan'208";a="80413194"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Dec 2019 18:12:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 2F38F4CE1C98
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:03:47 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 17 Dec 2019 18:12:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Dec 2019 18:12:47 +0800
Message-ID: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 2F38F4CE1C98.A0030
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 0/4] cleanup capset testcase
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

I cleanup capset testcase as below:

capset01: test on three versions
capset02: add various EPERM error cases
capset03: add EPERM error test without CAP_SETPCAP
capset04: add new EPERM error test with vfs cap support

I have tested them with root/nobody user and debug EPERM error in kernel code
(security/commoncap.c cap_capset function ).  They are ok.

Yang Xu (4):
  syscalls/capset01: Cleanup & convert to new library
  syscalls/capset02: Cleanup & convert to new library
  syscalls/capset03: add new EPERM error test without CAP_SETPCAP
  syscalls/capset04: add new EPERM error test with vfs cap support

 runtest/syscalls                            |   2 +
 testcases/kernel/syscalls/capset/.gitignore |   2 +
 testcases/kernel/syscalls/capset/capset01.c | 150 ++------
 testcases/kernel/syscalls/capset/capset02.c | 364 ++++++++------------
 testcases/kernel/syscalls/capset/capset03.c |  65 ++++
 testcases/kernel/syscalls/capset/capset04.c |  86 +++++
 6 files changed, 319 insertions(+), 350 deletions(-)
 create mode 100644 testcases/kernel/syscalls/capset/capset03.c
 create mode 100644 testcases/kernel/syscalls/capset/capset04.c

-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
