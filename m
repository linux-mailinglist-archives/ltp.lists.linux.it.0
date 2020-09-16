Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95A26C1BE
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13DC03C2B6C
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EEC5F3C2CB0
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:13 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AA1721A00FA9
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:12 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id k8so371438pfk.2
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gngPOu2PefRmAgahyAxG0+/1EP2tsOsQMl/fbKATV8=;
 b=i5YAT3SSzFOcnxAB+XjhkC2O4Rqs7Ny2uwzIwr7LeGTI8allKn8Le+hfBRabf5mCwh
 qzfsqKpqUnegPJaAZSfKUGJT3sHG8dgHaQbV9DTeWnoJN8rlX5JioMJoU62ogH7fODst
 lF+hFK9iyCvDaONyah+Dm8V7oNDYaFzTrPLM7wVnNi5G6DHrg+bLE413KcKHn+zzHqjY
 puPGp7QJEOClCqVfQUgiPApoxeKs6DpX+EMzrZL2dmVL+zNCDf0yjidxYRrZts8dZWbr
 Y/P0GL4YskWIQcT0wPbP39TuLELvHqZrOJ8CrTJ8PB7j9pXy14i2lEKWEgDln693N87R
 cKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gngPOu2PefRmAgahyAxG0+/1EP2tsOsQMl/fbKATV8=;
 b=rObgywhmAZoxFpazBTSEahhqdDWllcwD4OXi8gj3s6Sb5/X6z/Ea4uBHZYopldcUwz
 0K7xq+gAddovlo0I0DIHYOZZmgm9/kysOdCORE0YvlNtQk8np08PpJ5TIE7HYFBOoAwd
 37Oc0VL99pg+pf8fHt7e1T8dsUGw4wPwlYy4eXhPoQAMEPHWieOIEiJfygun+vUYR6tq
 FP5VDChLcOJUHvWJzMJgJE+FTFhgfKY5XthPrSeB32jh6wN4O0h/pgylYHHW3f5Cx4qs
 hejOrGcHqoD4Q14ZylUhgrd+dcVENzhnBoEOr4XzZZk88dgZnL4fLwxLkCYB0VO2m28I
 m8jA==
X-Gm-Message-State: AOAM533mbHX6xL8UYfVDzBEJoGR7ZWOtvIqIIvs24fZPVEjbPnFNj5SR
 xK+nE/84KUOW9PtAeWoW4l8Nvx6+z+ASmA==
X-Google-Smtp-Source: ABdhPJwnFa+YsuUyzI1CtTwtH6KDIoWQapl+emsVQTt9h7sEqzzjYCWNaHnoPrt30X613TUXjwQN2Q==
X-Received: by 2002:a05:6a00:1481:b029:142:2501:35d7 with SMTP id
 v1-20020a056a001481b0290142250135d7mr5891693pfu.55.1600252690921; 
 Wed, 16 Sep 2020 03:38:10 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id g1sm16729759pfm.124.2020.09.16.03.38.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:46 +0530
Message-Id: <2c5695ebf7d13bd25651faf09d0fb78bbdd4bc31.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 01/17] syscalls: utils: Remove local copy of poll.h
 definitions
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

The local copy of these definitions and this file conflicts with the
system wide ones and make the builds fail sometimes, for example when
this copy gets included instead of the system wide one.

Remove it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/utils/poll.h | 27 --------------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/utils/poll.h

diff --git a/testcases/kernel/syscalls/utils/poll.h b/testcases/kernel/syscalls/utils/poll.h
deleted file mode 100644
index 2cd4929abd40..000000000000
--- a/testcases/kernel/syscalls/utils/poll.h
+++ /dev/null
@@ -1,27 +0,0 @@
-#ifndef __i386_POLL_H
-#define __i386_POLL_H
-
-/* These are specified by iBCS2 */
-#define POLLIN		0x0001
-#define POLLPRI		0x0002
-#define POLLOUT		0x0004
-#define POLLERR		0x0008
-#define POLLHUP		0x0010
-#define POLLNVAL	0x0020
-
-/* The rest seem to be more-or-less nonstandard. Check them! */
-#define POLLRDNORM	0x0040
-#define POLLRDBAND	0x0080
-#define POLLWRNORM	0x0100
-#define POLLWRBAND	0x0200
-#define POLLMSG		0x0400
-#define POLLREMOVE	0x1000
-#define POLLRDHUP       0x2000
-
-struct pollfd {
-	int fd;
-	short events;
-	short revents;
-};
-
-#endif
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
