Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C125F485
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 10:04:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00FD93C2C99
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 10:04:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 19E0B3C2670
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 09:51:20 +0200 (CEST)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 90FFC60065D
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 09:51:19 +0200 (CEST)
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 75C7372CCE9
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 10:51:18 +0300 (MSK)
Received: from beacon.altlinux.org (unknown [83.220.44.62])
 by imap.altlinux.org (Postfix) with ESMTPSA id 5D49E4A4A2A;
 Mon,  7 Sep 2020 10:51:18 +0300 (MSK)
From: Vitaly Chikunov <vt@altlinux.org>
To: ltp@lists.linux.it
Date: Mon,  7 Sep 2020 10:51:09 +0300
Message-Id: <20200907075109.19194-1-vt@altlinux.org>
X-Mailer: git-send-email 2.11.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 07 Sep 2020 10:04:15 +0200
Subject: [LTP] [PATCH] Fix removal of TMP by moving cleanup trap into main
 just after mktemp
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
Cc: Vitaly Chikunov <vt@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If user have TMP set and run 'runltp -h' their whole TMP dir is removed.

Fixes: https://github.com/linux-test-project/ltp/issues/722
Suggested-by: Cyril Hrubis <metan@ucw.cz>
Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
---
 runltp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/runltp b/runltp
index 11654ebff..d53ef2941 100755
--- a/runltp
+++ b/runltp
@@ -552,6 +552,8 @@ main()
     # write to it as user nobody
     export TMPDIR=$TMP
 
+    trap "cleanup" 0
+
     chmod 777 $TMP || \
     {
       echo "unable to chmod 777 $TMP ... aborting"
@@ -952,7 +954,6 @@ cleanup()
 LTP_SCRIPT="$(basename $0)"
 
 if [ "$LTP_SCRIPT" = "runltp" ]; then
-    trap "cleanup" 0
     setup
     main "$@"
 fi
-- 
2.11.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
