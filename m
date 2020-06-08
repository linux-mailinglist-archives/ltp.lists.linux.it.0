Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3573F1F1B2C
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:42:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D46FD3C2EA0
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:42:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4DC1B3C094D
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:42:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 604761001132
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:42:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,487,1583164800"; d="scan'208";a="94092395"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Jun 2020 22:42:44 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id C20894CD7FE7;
 Mon,  8 Jun 2020 22:42:42 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Jun 2020 22:42:45 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 8 Jun 2020 22:42:44 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 8 Jun 2020 22:27:44 +0800
Message-ID: <20200608142744.274287-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: C20894CD7FE7.AB59B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] network/nfs_lib.sh: Use double quotes for grep pattern
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

sh -c 'grep -q '^[# ]*udp *= *y' ...' in nfs_server_udp_enabled()
cannot processe nested single quotes correctly if rsh/ssh is used
and gets the error:
--------------------------------------------
grep: Unmatched [ or [^ (or grep: Unmatched [, [^, [:, [., or [=)
nfs01 1 TCONF: UDP support disabled on NFS server
--------------------------------------------

This issue make many NFS tests including UDP become TCONF even
if NFS supports UDP so use double quotes inside to fix it.

Fixes: 0f1c36c51 ("nfs: Detect disabled UDP")
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/network/nfs/nfs_stress/nfs_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index f7eb57d66..e236cd485 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -58,7 +58,7 @@ nfs_server_udp_enabled()
 	tst_rhost_run -c "[ -f /etc/nfs.conf ]" || return 0
 	config=$(tst_rhost_run -c 'for f in $(grep ^include.*= '/etc/nfs.conf' | cut -d = -f2); do [ -f $f ] && printf "$f "; done')
 
-	tst_rhost_run -c "grep -q '^[# ]*udp *= *y' /etc/nfs.conf $config"
+	tst_rhost_run -c "grep -q \"^[# ]*udp *= *y\" /etc/nfs.conf $config"
 }
 
 nfs_setup_server()
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
