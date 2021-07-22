Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E53D23DC
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 14:52:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 445543C8191
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 14:52:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1868F3C5AEB
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 14:52:38 +0200 (CEST)
Received: from smtpbg516.qq.com (smtpbg516.qq.com [203.205.250.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 85C50600F4F
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 14:52:32 +0200 (CEST)
X-QQ-mid: bizesmtp47t1626958344tv1q53v4
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 22 Jul 2021 20:52:20 +0800 (CST)
X-QQ-SSF: 01400000008000207000B00A0000000
X-QQ-FEAT: Oj0A4zlq//dCl30IX8ihU3RSG6X7GF4fsri4dKFWgDYH3g8tN0nIjpaiSygIa
 hJWaZKoWKmyR4TYqhgce9D50sqzMLHiOjkTdkKGnWugsDnabSLbe9ZBxvAP6D2P2se37aMP
 aJbhOPG45xdGvAIj/5n5/yVUGpAjLARltQR49bir9vhsKFGH6Cxb8SwS/rR18zeHvLiaf86
 e+24hooNuvJNMRCf97vxwee8q1iEbYzlHOcBWjB15CoIuJoM6enQ+k4TgTJ9eWPMc9SAxSg
 am1bur2l2hNKK5sf8+s2BkvrsZV9aK/fTXNqRP4q9IQMuVZv7fJHKnu4k7e1r376Wcw7ywH
 G4dw2TV
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Thu, 22 Jul 2021 20:52:19 +0800
Message-Id: <20210722125219.31895-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] regen.sh: Limit mips o32 system calls
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

With mips architecture, 64-bit programs cannot call o32 system calls.
For example, __NR_stime, __NR_socketcall, __NR_time, etc.
Better solve the problem described in commit: 22c2c9e2f

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/include/lapi/syscalls/regen.sh b/include/lapi/syscalls/regen.sh
index 7a4f0cf44..8ac80440c 100755
--- a/include/lapi/syscalls/regen.sh
+++ b/include/lapi/syscalls/regen.sh
@@ -80,7 +80,7 @@ for arch in $(cat "${srcdir}/order") ; do
 		s390) echo "#if defined(__s390__) && !defined(__s390x__)" ;;
 		mips_n32) echo "#if defined(__mips__) && defined(_ABIN32)" ;;
 		mips_n64) echo "#if defined(__mips__) && defined(_ABI64)" ;;
-		mips_o32) echo "#if defined(__mips__) && defined(_ABIO32)" ;;
+		mips_o32) echo "#if defined(__mips__) && defined(_ABIO32) && _MIPS_SZLONG == 32" ;;
 		*) echo "#ifdef __${arch}__" ;;
 	esac
 	while read line ; do
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
