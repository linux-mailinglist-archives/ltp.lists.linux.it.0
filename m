Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC03B71CD
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 120A43C6E5B
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E182D3C86AC
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:58 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8C1C9200B6B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:58 +0200 (CEST)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyCZu-0006lb-24
 for ltp@lists.linux.it; Tue, 29 Jun 2021 12:10:58 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 g14-20020a056402424eb02903954930851bso5040836edb.0
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rz7GisD4gD8ZJuoI0XHtZVVDCHrVkJYv0AACuvLkJL0=;
 b=YLi0uUZQldX1Ya0KJWTj20J0zDerGs3XKyRakg4zA2kqj6SkrkVUwCYqwWGCejnV5E
 7Cy7kl6WdXQt9eBymbbQCyDwBEoAMXlirCURWEloDe7uqJ3CqLzH/VBG15dO6rn8Varb
 ol+UaMaKbvsW6vJ7kwyal1kxwM4nXj4WAoXNPAhOpUnBWeNonNQWm4do9mZJT5YTonkI
 IMCvmAfgGBzFtsk5kL+LC0pLRr3XABufaPs7QrOqJJo9aRXBVoTmBaziZQnAYEvx03RF
 6MZ7Rt8sNxWcoHNEhf1sMxEYNL2IBq4nr8U5b8uyolEBKeFRMYT1yiQseKjnCWUNWNnx
 q3uQ==
X-Gm-Message-State: AOAM531UVl++0BYAAQo9cJ51oF+1ayl0ZMnMKv/3gjKRE4Qxjj03KFls
 baXfMfnkKCTm3AZqesVRvH+XA/NlU/jASTSd2tQnidleMGlAcvdTDn4JxwNL0wItOIgJhHOaVQg
 eSctIllBV4gq/YouvdOBz4KYt2m+l
X-Received: by 2002:a17:906:dbdc:: with SMTP id
 yc28mr29675873ejb.444.1624968657354; 
 Tue, 29 Jun 2021 05:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvwLl0BSZrjQMDzc+DbV9GQ6bxyF1ux3A4zLCXfXRlesWGYfF7WSnBAjrroI7xtW9xSyqx9Q==
X-Received: by 2002:a17:906:dbdc:: with SMTP id
 yc28mr29675854ejb.444.1624968657192; 
 Tue, 29 Jun 2021 05:10:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n4sm8084256eja.121.2021.06.29.05.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:10:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 14:10:46 +0200
Message-Id: <20210629121047.100391-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/4] syscalls/msgstress03: fix fork failure on
 small memory systems
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

Running syscalls/msgstress03 on a system with less than ~4 GB of RAM fails:

    msgstress03    1  TFAIL  :  msgstress03.c:155: 	Fork failed (may be OK if under stress)

In dmesg:

    LTP: starting msgstress03
    cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope

The reason is cgroups pid limit set by systemd user.slice.  The limit is
set for login session, also for root user.  For example on 2 GB RAM
machine it is set as:
    /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207

Read the maximum number of pids and adjust the test limit.  For 2 GB RAM
machine with systemd this will result in:

    msgstress03    0  TINFO  :  Found limit of processes 5056 (from /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max)
    msgstress03    0  TINFO  :  Requested number of processes higher than user session limit (10000 > 4556), setting to 4556

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../kernel/syscalls/ipc/msgstress/msgstress03.c   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
index 294b401b1b38..18e50e35ee07 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
@@ -78,7 +78,7 @@ static void usage(void)
 
 int main(int argc, char **argv)
 {
-	int i, j, ok, pid;
+	int i, j, ok, pid, free_pids;
 	int count, status;
 	struct sigaction act;
 
@@ -109,6 +109,19 @@ int main(int argc, char **argv)
 		}
 	}
 
+	free_pids = tst_get_free_pids(cleanup);
+	if (free_pids < 0) {
+		tst_brkm(TBROK, cleanup, "Can't obtain free_pid count");
+	} else if (!free_pids) {
+		tst_brkm(TBROK, cleanup, "No free pids");
+	}
+	if (nprocs >= free_pids) {
+		tst_resm(TINFO,
+			 "Requested number of processes higher than limit (%d > %d), "
+			 "setting to %d", nprocs, free_pids, free_pids);
+		nprocs = free_pids;
+	}
+
 	srand(getpid());
 	tid = -1;
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
