Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB403A3297
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 19:58:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF6523C4EBE
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 19:58:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87A3A3C31E4
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 19:58:30 +0200 (CEST)
Received: from atcsqa06.andestech.com (59-120-53-16.HINET-IP.hinet.net
 [59.120.53.16])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 10A202009FE
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 19:58:28 +0200 (CEST)
Received: by atcsqa06.andestech.com (Postfix, from userid 5427)
 id 9A285C3898; Fri, 11 Jun 2021 01:58:25 +0800 (CST)
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: ltp@lists.linux.it
Date: Fri, 11 Jun 2021 01:58:12 +0800
Message-Id: <20210610175812.13730-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.17.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=RDNS_DYNAMIC,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] fs/racer: Fix LTP hang caused by fs_racer.sh
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

fs_racer.sh test could cause LTP to hang if the file
gets removed when it's at time same time being renamed.

The if statement in mv source implemented by busybox is as follows:

	if (dest_exists) {
		if (flags & OPT_NOCLOBBER)
			goto RET_0;
		if (!(flags & OPT_FORCE)           // OPT_FORCE is set by -f option
		 && ((access(dest, W_OK) < 0 && isatty(0))
		    || (flags & OPT_INTERACTIVE))  // this is set by -i option
		) {
			if (fprintf(stderr, "mv: overwrite '%s'? ", dest) < 0) {
				goto RET_1;  /* Ouch! fprintf failed! */
			}
			if (!bb_ask_y_confirmation()) {
				goto RET_0;
			}
		}
	}

If somehow the dest_file exists when mv executes the first if "if (dest_exists)",
and gets removed when mv executes the third if "if (access(...))".
Then it is possible for mv to reach "bb_ask_y_confirmation" and to try to read from tty.

However, the mv process is executing in the background,
so when it tries to read from tty,
the processes in the same process group as mv would all receive SIGTTIN
and be changed into TASK_STOPPED state.

This would cause this testcase to hang, though happens rarely.

Add -f option to suppress the attempt to read from tty.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 testcases/kernel/fs/racer/fs_racer_file_rename.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/fs/racer/fs_racer_file_rename.sh b/testcases/kernel/fs/racer/fs_racer_file_rename.sh
index 7e2e6b1b2..15090361f 100755
--- a/testcases/kernel/fs/racer/fs_racer_file_rename.sh
+++ b/testcases/kernel/fs/racer/fs_racer_file_rename.sh
@@ -25,5 +25,5 @@ MAX=$2
 while true ; do
     file=$(($RANDOM%$MAX))
     new_file=$((($file + 1)%$MAX))
-    mv $DIR/$file $DIR/$new_file 2> /dev/null
+    mv -f $DIR/$file $DIR/$new_file 2> /dev/null
 done
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
