Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A13F15BCE9
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 11:35:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B88D3C2452
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 11:35:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D00393C24FD
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 11:35:21 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7F2366021AB
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 11:35:20 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,436,1574092800"; d="scan'208,223";a="83250821"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Feb 2020 18:35:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 448CB50A996F;
 Thu, 13 Feb 2020 18:25:42 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 13 Feb 2020 18:35:14 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 13 Feb 2020 18:35:13 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <jstancek@redhat.com>
Date: Thu, 13 Feb 2020 18:35:21 +0800
Message-ID: <1581590121-4626-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581590121-4626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1581590121-4626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 448CB50A996F.AEB41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/kill11,
 abort01: lower MIN_RLIMIT_CORE size
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

From ulimit manpage, ulimit -c options used 512-bytes-block in posix mode
and used 1024-bytes-block in common mode. Usually, this case used "ulimit
 -c 1024" to test, but it will report TCONF in posix mode under unprivileged user.
Since these two cases only check correct signal, lower this size doesn't affect
this result. This also can avoid github issue(640[1],83[2]).

[1]https://github.com/linux-test-project/ltp/issues/640
[2]https://github.com/linux-test-project/ltp/issues/83

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/abort/abort01.c | 2 +-
 testcases/kernel/syscalls/kill/kill11.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/abort/abort01.c b/testcases/kernel/syscalls/abort/abort01.c
index 6fde3721c..9505a5eec 100644
--- a/testcases/kernel/syscalls/abort/abort01.c
+++ b/testcases/kernel/syscalls/abort/abort01.c
@@ -62,7 +62,7 @@ void verify_abort(void)
 		tst_res(TFAIL, "abort() raised %s", tst_strsig(sig));
 }
 
-#define MIN_RLIMIT_CORE (1024 * 1024)
+#define MIN_RLIMIT_CORE (512 * 1024)
 
 static void setup(void)
 {
diff --git a/testcases/kernel/syscalls/kill/kill11.c b/testcases/kernel/syscalls/kill/kill11.c
index 4025fcc87..9b81e0095 100644
--- a/testcases/kernel/syscalls/kill/kill11.c
+++ b/testcases/kernel/syscalls/kill/kill11.c
@@ -192,8 +192,7 @@ void do_child(void)
 	exit(1);
 }
 
-/* 1024 GNU blocks */
-#define MIN_RLIMIT_CORE (1024 * 1024)
+#define MIN_RLIMIT_CORE (512 * 1024)
 
 void setup(void)
 {
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
