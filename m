Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244A260AD2
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 223F83C53BA
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 000383C53CF
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:17 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 75E7B201008
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:17 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id l191so9316492pgd.5
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlPjsip7eXR8lr94MdYcmy29T+5MgL8zaEQ1Y8tggMI=;
 b=necQ0BQrF2mGfZ/xEE8oeBDFqa+vxC+M2IWryxhDbwa3ynCsBh8pLu5DZeGbTjsayB
 M6Tqy2Fv8R/c3DNjZh9SdDwYkIPIh2M0K6mv5OLuGEHeWvb4Zv4vIM8qwYlPmlKlZmcX
 uSvrVJFJlGWdiElb42n0ByBi7OkcCJvCrspiGohsveMltkGqZOv5bCtMC32F//7/SISK
 WCMiiGU5s2ZYJ7aGrt1M5vOJqxgiKR0J0hAJaq2U6jAVRvk3FE9z8d7VGHMdXXA7oruA
 zhTwJfS0nACnQViBTMtVb8IDSq9BmSEcx0gYTye9HLqWMRexBWqFWJB1uftLIFbaQxgL
 gsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SlPjsip7eXR8lr94MdYcmy29T+5MgL8zaEQ1Y8tggMI=;
 b=Ou2v+dxxvA3gdPFebbZKhB1tRjGpiaweWgjqkx7JCoqcL1q4WoB4AzrseEaDjf78jH
 xwTIthZpTBxI5Z9UUZe9EOWqpiXDcddTtc8gfJiFh4EtKmRsCdQZ5ceuFBHiiAmaYmx8
 XhMd6mWwZ4vdueJTJqjlNTHWgT9FPYTx/OeupvuI87u3zBRenVZK6vCWFIjVWMtxkQqD
 c8OKdzSj1PFFa+2XSoXT3PsIflp6r/S6a1dTttBsdqoPxHcNjp94dRNMtSL+0LiV2Zvr
 VGAVKYXnQHaAIpv10p+IB8g/MYt3dQSHyfJLo4a6Nd2DhgODNGBbfSphW/eWNx/+JdnA
 246A==
X-Gm-Message-State: AOAM532NvHYoYSx3ZpQJNzDw7GxSIhXcM/drF4xd9bgONY1XTC10D0Gp
 LpZVltvVMtvSySIh13rYhr+nFxwECuPfJQ==
X-Google-Smtp-Source: ABdhPJw4dNskRKEFHTyb8KB7URBzyLK6CI+YEPWCBaN9wGVcOtSFn4FE8Ia3h+4FjQIyKBvt59izDw==
X-Received: by 2002:a65:6119:: with SMTP id z25mr19908670pgu.52.1599546015707; 
 Mon, 07 Sep 2020 23:20:15 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id d15sm16974514pfh.151.2020.09.07.23.20.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:24 +0530
Message-Id: <9282311ec60bb1bb2181e79d14336d26d3f073d0.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 11/16] syscalls: sendmmsg: Reuse struct time64_variants
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Lets reuse the common structure here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 24 +++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
index 54febf661530..d6a717687ee7 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
@@ -11,6 +11,7 @@
 #include <string.h>
 #include <sys/types.h>
 
+#include "time64_variants.h"
 #include "tst_test.h"
 #include "lapi/socket.h"
 #include "tst_safe_macros.h"
@@ -24,32 +25,25 @@ static int receive_sockfd;
 static struct mmsghdr *snd_msg, *rcv_msg;
 static struct iovec *snd1, *snd2, *rcv1, *rcv2;
 
-static struct test_variants {
-	int (*receive)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
-		       unsigned int flags, void *timeout);
-	int (*send)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
-		    unsigned int flags);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .receive = libc_recvmmsg, .send = libc_sendmmsg, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .recvmmsg = libc_recvmmsg, .sendmmsg = libc_sendmmsg, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
-	{ .receive = sys_recvmmsg, .send = sys_sendmmsg, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .recvmmsg = sys_recvmmsg, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .receive = sys_recvmmsg64, .send = sys_sendmmsg, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .recvmmsg = sys_recvmmsg64, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void run(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct tst_ts timeout;
 	int retval;
 
-	retval = tv->send(send_sockfd, snd_msg, VLEN, 0);
+	retval = tv->sendmmsg(send_sockfd, snd_msg, VLEN, 0);
 	if (retval < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
 		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
 		return;
@@ -58,11 +52,11 @@ static void run(void)
 	memset(rcv1->iov_base, 0, rcv1->iov_len);
 	memset(rcv2->iov_base, 0, rcv2->iov_len);
 
-	timeout.type = tv->type;
+	timeout.type = tv->ts_type;
 	tst_ts_set_sec(&timeout, 1);
 	tst_ts_set_nsec(&timeout, 0);
 
-	retval = tv->receive(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout));
+	retval = tv->recvmmsg(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout));
 
 	if (retval == -1) {
 		tst_res(TFAIL | TERRNO, "recvmmsg() failed");
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
