Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 396FC2D4061
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 11:56:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87B873C5897
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 11:56:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 90B283C58E0
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 11:56:24 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D14581000A35
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 11:56:23 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,405,1599494400"; d="scan'208";a="102224662"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Dec 2020 18:56:23 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 25E3B4CE600B
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 18:56:18 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 9 Dec 2020 18:56:17 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 9 Dec 2020 18:56:17 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 9 Dec 2020 18:35:47 +0800
Message-ID: <20201209103547.1343502-2-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201209103547.1343502-1-yangx.jy@cn.fujitsu.com>
References: <20201209103547.1343502-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 25E3B4CE600B.A99D2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/fsconfig02.c: Remove unneeded
 .needs_tmpdir
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

.needs_device will enable .needs_tmpdir automatically so
remove the unneeded flag.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/fsconfig/fsconfig02.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
index 20d77917f..9ff41a7d7 100644
--- a/testcases/kernel/syscalls/fsconfig/fsconfig02.c
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
@@ -94,7 +94,6 @@ static struct tst_test test = {
 	.test = run,
 	.setup = setup,
 	.cleanup = cleanup,
-	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.needs_device = 1,
 };
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
