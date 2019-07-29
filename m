Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F3787D1
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 10:56:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 346563C1D45
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 10:56:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C7E0E3C1CE4
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 10:56:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 338DC1000362
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 10:55:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08294B601;
 Mon, 29 Jul 2019 08:56:02 +0000 (UTC)
Date: Mon, 29 Jul 2019 10:56:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Steve Muckle <smuckle@google.com>
Message-ID: <20190729085606.GA25517@dell5510>
References: <20190725211119.239938-1-smuckle@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725211119.239938-1-smuckle@google.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/sendmmsg: add new test
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Steve,

> Test basic functionality of sendmmsg and recvmmsg.

> Signed-off-by: Steve Muckle <smuckle@google.com>
Acked-by: Petr Vorel <pvorel@suse.cz>

> ---

> Changes since v3:
>  - drop resending of messages on partially successful sendmmsg()
>  - drop use of pthreads, do message creation and port management in
>    setup/cleanup

The only thing left in v4 is duplicate LTP_CHECK_MMSGHDR call.
+ I'd use lapi/socket.h also in cve-2016-7117.c (as Cyril pointed out)
in this commit (this change is simple enough).

So I'd be for merging v4 with diff below.

Kind regards,
Petr

diff --git configure.ac configure.ac
index 5e4e7f1f9..f7d1afc40 100644
--- configure.ac
+++ configure.ac
@@ -255,7 +255,6 @@ LTP_CHECK_TIME
 LTP_CHECK_TIMERFD
 test "x$with_tirpc" = xyes && LTP_CHECK_TIRPC
 LTP_CHECK_TPACKET_V3
-LTP_CHECK_MMSGHDR
 LTP_CHECK_UNAME_DOMAINNAME
 LTP_CHECK_XFS_QUOTACTL
 LTP_CHECK_X_TABLES
diff --git testcases/cve/cve-2016-7117.c testcases/cve/cve-2016-7117.c
index f0f6c22f1..140839712 100644
--- testcases/cve/cve-2016-7117.c
+++ testcases/cve/cve-2016-7117.c
@@ -30,6 +30,8 @@
  * https://blog.lizzie.io/notes-about-cve-2016-7117.html
  */
 
+#include "config.h"
+
 #include <sys/wait.h>
 #include <sys/types.h>
 #include <sys/socket.h>
@@ -44,20 +46,12 @@
 
 /* The bug was present in the kernel before recvmmsg was exposed by glibc */
 #include "lapi/syscalls.h"
-
-#include "config.h"
+#include "lapi/socket.h"
 
 #define MSG "abcdefghijklmnop"
 #define RECV_TIMEOUT 1
 #define ATTEMPTS 0x1FFFFF
 
-#ifndef HAVE_STRUCT_MMSGHDR
-struct mmsghdr {
-	struct msghdr msg_hdr;
-	unsigned int msg_len;
-};
-#endif
-
 static volatile int socket_fds[2];
 static struct mmsghdr msghdrs[2] = {
 	{

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
