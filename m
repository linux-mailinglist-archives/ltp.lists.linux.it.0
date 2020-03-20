Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34318C6A3
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:52:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E131D3C547D
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:52:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 355253C5458
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:52:50 +0100 (CET)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 746C11000BDA
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:52:49 +0100 (CET)
Received: by mail-pj1-x1042.google.com with SMTP id nu11so1956286pjb.1
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 21:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vXO/7W2p5AzU6NPlXauIz7XeG3MxMqchvSibSxupLfg=;
 b=fRvXXJh2AhAFw9D4eWSSSzedroqfirLzBm64P0ZleOa/sb6G0cFtfBw7DToXWs2TBR
 RMY8AisMFxPf6FLtegG+ZeZZd88lDYggbiOx2XTPDa91BLKadXqza1MXzv5837l+Tjrm
 0HKF+W0EFVArIkG72QlIw2NwbLA1w6jTBxJpdOUqvg2WHYbkUoiy5nzSYjO3C8Jwsobk
 paDtBwldXIQ2Nx2jkUwrjulUs6dl7aNSzd4Bw9n9XQxVh98mFucPifHsEfoIYWb2Avxq
 4iFqlElz1VQsxrvv+i8kPjJaw+TggYcUcqMvEOmITHauDEKJySYqysfNa+gaVgmmIudY
 OMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vXO/7W2p5AzU6NPlXauIz7XeG3MxMqchvSibSxupLfg=;
 b=F6bbgL6DdFD6CQHrKn6WIZRHsthp6nyk+9CgAoQVPon18vMlK7WZxrwv/m913Hf0db
 O3ToJHlWrXtlXF+kql6MUK/Zz2uJcVpReKAKZjU2dkW3YNhzIR7+awa5GCBO9t3pKSYs
 rNi82dRToHnYMw9XkExCcY6KnfE2XVW/TCRK2WOtfQeW8F4ibJFyHktzmqe0ZVtZDaiD
 Iz4HLmwc5iGk7eTws24GqJp/5iqgPgCZkR4Qq2ioUdFz8guz+gpn1n5G2jWRk3UoMFS2
 30vopd+LGPqbKCEasnEFaXfrelMNoZ6FKFp6LuSkD00fC6YARmwnWi6QlpM4LMFGYAPO
 0n2A==
X-Gm-Message-State: ANhLgQ2EWjZVzqWI5nxDXzN4FUS2DDxxoSTdotWmLGZ1ONmEdhklEJnO
 p6wHYbHp4piaZ2xr86KmWyLAz5x8KXQ=
X-Google-Smtp-Source: ADFU+vsIg/lpo5UiAGSgDFoVu0N0WwAS36c+nB4g5yRGGQiFcVX0x5/owRRoZ5FNERnEdSluiendxA==
X-Received: by 2002:a17:90b:19ca:: with SMTP id
 nm10mr7173452pjb.161.1584679967638; 
 Thu, 19 Mar 2020 21:52:47 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id mq6sm3714013pjb.38.2020.03.19.21.52.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 21:52:47 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 20 Mar 2020 10:22:44 +0530
Message-Id: <b392569b582f264927f2fea65bf14a89c03faaa5.1584679961.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fspick: Call fsconfig with
 FSCONFIG_CMD_RECONFIGURE
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

Make sure mountpoint is reconfigured after all the recent changes by
calling fsconfig() with FSCONFIG_CMD_RECONFIGURE.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/fspick/fspick01.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/syscalls/fspick/fspick01.c b/testcases/kernel/syscalls/fspick/fspick01.c
index 3b3635b20195..b5a35bf61e2c 100644
--- a/testcases/kernel/syscalls/fspick/fspick01.c
+++ b/testcases/kernel/syscalls/fspick/fspick01.c
@@ -43,6 +43,12 @@ static void run(unsigned int n)
 		goto out;
 	}
 
+	TEST(fsconfig(fspick_fd, FSCONFIG_CMD_RECONFIGURE, NULL, NULL, 0));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		goto out;
+	}
+
 	tst_res(TPASS, "%s: fspick() passed", tc->name);
 
 out:
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
