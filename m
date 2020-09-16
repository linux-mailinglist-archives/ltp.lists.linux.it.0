Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5826C1CA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 856523C2CB0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 132C73C2DB4
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:11 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B5A2A6009F0
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:10 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id w7so3738660pfi.4
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlPjsip7eXR8lr94MdYcmy29T+5MgL8zaEQ1Y8tggMI=;
 b=LF9o2RsCsVnZ/UteXtG2NPwCg1AF6iXokAb8+HOWPLUm4vv7o3FEA96Ych7w/+49Uz
 fUfOc7ksVrwpjCcr9Hlg3O26jcg9QalM/cQuySIrCiWRdJaQ8C0WEC68qPqiZ1Z8JAxx
 exoWrBzbTApP8wiede5VkXyowRzzG7G2Vg50tT0tQQUoA9x5+tr/XJYyXkEvQ31Ma2M6
 ZF3BrY9sdCfp4FbSQBqtYcm6vvsMfu+4LpvE6Jmi5Fo6L2wGSCc4j+FU0tuicPeUoadK
 jVymDhI5p9OLfwq4mum/6Pfby/QoQ0WfsskFDTJqLN4ad/sr0Q2GXuHFGMt9KCJ4ycyV
 Ta1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SlPjsip7eXR8lr94MdYcmy29T+5MgL8zaEQ1Y8tggMI=;
 b=hzFKEmW6R588I7fwZ0s1HA8mjf5xnlu3JNHvY+jW6Z7YmGFy/1VimxBYs4UjK1rtPp
 xNESEs9eSBVSttrppcEp/Km41BQm6x4Cnu/2RvFh+2nHApXd5n1yUM69X+8oqiIYtMAL
 dSNRKHFOyfir7Z+2ZDDfiGrKfr6HPiPjmV1i10OzLOzvHofrh9SKj1piR8TnCsWsNClY
 11NAAYG7TDxykfBsdRjuBPF2NpJn92LKLBOQtAcTzFJJrf2Lsjk/58RAkiwza5CbLHyT
 bX+jt7LasaEwRGOVYBPA7V/hZMRdxzcbut6yOJoiqyZGOHgGQNxMb/s7DfjsZfwSjC4t
 448w==
X-Gm-Message-State: AOAM530DQzjqbgvJbpNs/ECUKAi9WXuwZFYDDloKq4SGREno2GmsPVkp
 xtT0BqK308ZWqsmUWDWlxuFp8njA1loVgw==
X-Google-Smtp-Source: ABdhPJxAel8/MBcfTmLc98WtBVui6+pnYHkLHEmkQQWZyRTPg73Bx58TFuxz3PDlKz2aV0vGeXihaw==
X-Received: by 2002:a62:d456:0:b029:13c:1611:66c2 with SMTP id
 u22-20020a62d4560000b029013c161166c2mr21256365pfl.13.1600252748989; 
 Wed, 16 Sep 2020 03:39:08 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id m5sm2279214pjn.19.2020.09.16.03.39.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:39:08 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:57 +0530
Message-Id: <2dca67718880207b6dc970cf23fac75044bc1ba6.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 12/17] syscalls: sendmmsg: Reuse struct
 time64_variants
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
