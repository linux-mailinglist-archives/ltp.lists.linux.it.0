Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF6C3B028E
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:14:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E10F33C8E64
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:14:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 441CE3C229B
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:14:47 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67EFD200A11
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:14:47 +0200 (CEST)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lveMg-0006F0-5i
 for ltp@lists.linux.it; Tue, 22 Jun 2021 11:14:46 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso9586970wrh.12
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 04:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqAgaqEcdATLuZwKUnhgB1LotU9tq72u8E/2okEqFPI=;
 b=GK8lZmzd6DiuyesLV9OrED9/jmCDr2sO6P86DTUNdHdW8A1+3cia2sFGUJAi0JGFBT
 y/ViM8ifd2gGf+WPGA4TL41qdlfzplqjOsmw2PbibW3EzTDODG2Kj/eMy8D01aqddLbL
 0MT0N7mzE+3j26+3OX/cp/TnjBhdJ+L+btbKH3bZxhydYpFElT7zOMJQFdj7wmX4lTAs
 pjixcqbd2ZiST61E9lV7y+SRQkm1prwe4QZCdcouEQrdBE6k67jVBZc2+7LWZJH7Xmx4
 LPekjs0QY2JKo46lIvu1g2gYY1MZQ/KxhGzAr8miZEsP3fg4efbEFsdAaTJC8PLnNgcz
 BSnw==
X-Gm-Message-State: AOAM5310iyB+FzuVDIxC+KpaD0d99YzPchAjukgRJHApo6wx9l0qYF2w
 ySCKxkyK8jGOOwtwyjJcYuw420DMpt9LAnnNGDqixaqjRBKmN7mwzN5RhErJRotorhN6RsmC2NO
 kPCI23tPc5kApJbF0x0qulTrJ/mZc
X-Received: by 2002:a7b:c187:: with SMTP id y7mr3775284wmi.13.1624360485486;
 Tue, 22 Jun 2021 04:14:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzwXM4V21QDKoJWvP4FaHoqjfNSiySuRg7OpkvWMR6fycpD0GOcIBKoMMf+TId3H/KAe2FqQ==
X-Received: by 2002:a7b:c187:: with SMTP id y7mr3775268wmi.13.1624360485335;
 Tue, 22 Jun 2021 04:14:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n16sm10852683wrx.85.2021.06.22.04.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 04:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 13:14:40 +0200
Message-Id: <20210622111440.74722-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
References: <20210622111440.74722-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/msgstress04: fix fork failure on small
 memory systems
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

Running syscalls/msgstress04 on a system with less than ~4 GB of RAM fails:

    Fork failure in the first child of child group 4396
    Fork failure in the second child of child group 4413
    msgstress04    1  TFAIL  :  msgstress04.c:222: Child exit status = 1

The reason is cgroups pid limit set by systemd user.slice.  The limit is
set for login session, also for root user.  For example on 2 GB RAM
machine it is set as:
    /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207

Read the maximum number of pids and adjust the test limit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/syscalls/ipc/msgstress/msgstress04.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
index f1c124990cb1..37561b18c651 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
@@ -387,7 +387,7 @@ static void term(int sig LTP_ATTRIBUTE_UNUSED)
 
 void setup(void)
 {
-	int nr_msgqs, free_pids;
+	int nr_msgqs, free_pids, max_session_pids;
 
 	tst_tmpdir();
 	/* You will want to enable some signal handling so you can capture
@@ -423,6 +423,13 @@ void setup(void)
 	 * For each child we fork up to 2*maxnkids grandchildren. */
 	maxnprocs = (free_pids / 2) / (1 + 2 * maxnkids);
 
+	max_session_pids = get_pids_limit();
+	if ((max_session_pids > 0) && (max_session_pids < free_pids)) {
+		/* Clamp number of processes to session limit with some buffer for OS */
+		max_session_pids = (max_session_pids > 500 ? max_session_pids - 500 : 0);
+		maxnprocs = (max_session_pids / 2) / (1 + 2 * maxnkids);
+	}
+
 	if (!maxnprocs)
 		tst_brkm(TBROK, cleanup, "Not enough free pids");
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
