Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DC83B1BB2
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:56:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EA4B3C6FDD
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:56:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A39F53C2307
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:32 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 416F4200D2E
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:32 +0200 (CEST)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3Ln-0000Jr-OI
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:55:31 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 w186-20020a1cdfc30000b02901ced88b501dso1644156wmg.2
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rz7GisD4gD8ZJuoI0XHtZVVDCHrVkJYv0AACuvLkJL0=;
 b=ryJ4Crkdf3YnpqSja/H70c9oLFqOvxPX3suL31phzfo9/QIOrgi+qHxGrbbn3Jup5K
 AXDBD9ztOMtDVqOa+iTlZwK6QhPr9kzwRZhKnK7C0Dv4m1+0I148hRv8oADRRCyX3U3j
 Egk7iYkO4Y5y9uWTzBdF5FEUNGsmCL3SMtPNWckP9nboBrG93+SlKv0nIt4rJILWaATq
 FqkX7vVKqXiwMbVKENwt9QTlmm6ea5aG7tA2dyXj2aFkM+tDohZII4pFFyhdKHcCUuuS
 Z7t3umKT7nEqiCNdmhWtHf7lwf6oeKWHFhG7whegjwv4mH3jg2Qbv+omrbIdP1rds5Ux
 a9og==
X-Gm-Message-State: AOAM530pj/F11i68IKDUFWEbvKCtAq4/U1fVLaCRXttZ3N0ssvAF98U7
 crsMwY48iHOECtoJ65U/J+iodC38/emSyO8caVxWP045vV0hdPKqsZnWHjENhPTHUUmay587sbo
 07tERhIuY4sErhr5mYvZ8byC3Y5dW
X-Received: by 2002:a05:600c:17d1:: with SMTP id
 y17mr10862186wmo.188.1624456531343; 
 Wed, 23 Jun 2021 06:55:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeYVPCg9YNuWPeQj+lQpKlG1/P7G/E0ynJtnXBXE0k47bxA6e2luudQnPcIBbc1o2nf1ciYA==
X-Received: by 2002:a05:600c:17d1:: with SMTP id
 y17mr10862172wmo.188.1624456531222; 
 Wed, 23 Jun 2021 06:55:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id v5sm5746567wml.26.2021.06.23.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:55:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 15:55:20 +0200
Message-Id: <20210623135524.80663-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
References: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] syscalls/msgstress03: fix fork failure on
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
