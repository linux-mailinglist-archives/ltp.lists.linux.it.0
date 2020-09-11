Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3625265E4A
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 12:40:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4524F3C4F9F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 12:40:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3798A3C149D
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 12:40:05 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A73531A01113
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 12:40:04 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id x123so7006365pfc.7
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 03:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mKmK85XUxbJfvtlCDn6pc6LirvJX7FeVomV9RfqTO9s=;
 b=N0VJ7l6HQwIYzgVH8XJWflNUMJivlIL4z/XIUV+rvsQmjBOVsEn6r3sxHqoiTGjFx7
 Jkp8ae66ulvBex62G6i6lUE9gXpCwzjMnAyubKY1maPLOIkPIS71nG0V2oasp3RsjHW3
 pPZZwgNFbLkSqNTGo2y8ud/XT5+kEC887eTE7SsN/rlHq0Aoy5Mm9ZV6V4juS+UcPo7a
 wREXEMO+W+B4gpBaL3/Opi6G0BUjAXcV65nEStZPtql1uRNePFu859WQx1xfogNIBuf/
 xoAvoMa904Rvn4roolg0CnP3IwGfswUT2QvxNQB8XfjvS9bs8ucvPMJ2zXiIhWzWEBiX
 91hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mKmK85XUxbJfvtlCDn6pc6LirvJX7FeVomV9RfqTO9s=;
 b=cmiJ25Tugpe4TQVM03k6bg03QYgo7oxEuntv7HjtdcjLRoHO1Y4y9g65BO6O7gjJM0
 Zw0tpsxCs6Lk+JilL5Pz3MuWbVmAlvYg7zsdsolZ1h9nu4qevPJnObZC2GHCBMpgce0u
 pWlS1vjAyxgeIWF+51qb2T+p27RMSU/IzVKoIoq1UooQqnw/TeTEYc0NPpTp1BWjCpr1
 B3MdkC8TjNq4x0lv21GyPBsdDIj5LNnlGo1NrBdV9c1w65Wtu5C8KWSmuRhLXdGkkkqh
 zgGds4ySiXTBz9WNA23C/BBgZnmlediL7BH0I1zM5/8ihnJW7Q/QOOksP5emusNBnxz0
 5dbQ==
X-Gm-Message-State: AOAM530KqN7pP0L/DtlxElc3g57jzEXQ/2eCsvhGWUGajKcaqkDs7L23
 ahDne1BP9PNQP7qxB7ipWfIdPg==
X-Google-Smtp-Source: ABdhPJxvqnucssQGReAoQxPj0Qh7gL9qDZZCpWZKUFxy2jmmCos4Jjosw76ahi4LfpHByR9OiiSokw==
X-Received: by 2002:a63:4c1b:: with SMTP id z27mr1243605pga.69.1599820802796; 
 Fri, 11 Sep 2020 03:40:02 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id p68sm1894586pfb.40.2020.09.11.03.40.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 03:40:02 -0700 (PDT)
Date: Fri, 11 Sep 2020 16:09:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200911103950.kehhklgyie2tqpxh@vireshk-i7>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
 <20200911095314.GA9505@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911095314.GA9505@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls: Use common variants structure
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11-09-20, 11:53, Petr Vorel wrote:
> Hi Viresh,
> One of the commits fails on various tests [1].
> 
> Some failures (I haven't checked all):
> 
> * missing nfds_t (<poll.h> is probably from old commits) [2]:
> 
> CC testcases/kernel/syscalls/mq_open/mq_open01
> In file included from ../../../../include/time64_variants.h:13,
>                  from /usr/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq_timed.h:10,
>                  from mq_timedreceive01.c:17:
> /usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
>     1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
>       |  ^~~~~~~
> In file included from /usr/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq_timed.h:10,
>                  from mq_timedreceive01.c:17:
> ../../../../include/time64_variants.h:41:35: error: unknown type name 'nfds_t'
> 41 |  int (*ppoll)(struct pollfd *fds, nfds_t nfds, void *tmo_p,
> 
> * <libaio.h> not found [3]:
> BUILD libltpnewipc.a
> make[6]: Nothing to be done for 'all'.
> In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop02.c:29:
> In file included from In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop01.c:15:
> In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop.h:7:
> /usr/src/ltp/include/time64_variants.h:10:10: fatal error: /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop.h'libaio.h' file not
>       found
> :7:
> /usr/src/ltp/include/time64_variants.h:10:10: fatal error: 'libaio.h' file#include <libaio.h>
>          ^~~~~~~~~~
>  not
>       found
> #include <libaio.h>

I didn't get any of these on my x86 box :(

I think this should fix it, but I would required help of your bot to
get the testing done for all these architectures. This should get
merged in the first patch, I will resend it.

diff --git a/include/time64_variants.h b/include/time64_variants.h
index 934268b0328b..972eb333b614 100644
--- a/include/time64_variants.h
+++ b/include/time64_variants.h
@@ -7,10 +7,13 @@
 #ifndef TIME64_VARIANTS_H
 #define TIME64_VARIANTS_H
 
+#ifdef HAVE_LIBAIO
 #include <libaio.h>
+#endif /* HAVE_LIBAIO */
+
 #include <signal.h>
 #include <stdio.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <time.h>
 #include "tst_timer.h"
 
@@ -32,8 +35,12 @@ struct time64_variants {
        int (*timer_settime)(kernel_timer_t timerid, int flags, void *its, void *old_its);
        int (*tfd_gettime)(int fd, void *its);
        int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
+
+#ifdef HAVE_LIBAIO
        int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
                        struct io_event *events, void *timeout, sigset_t *sigmask);
+#endif /* HAVE_LIBAIO */
+
        int (*mqt_send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
                        unsigned int msg_prio, void *abs_timeout);
        ssize_t (*mqt_receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
