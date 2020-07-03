Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BE21352E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:38:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6C1D3C2A2A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:38:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CF4043C1419
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:38:20 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DA134601777
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:37:18 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id a14so9074000pfi.2
 for <ltp@lists.linux.it>; Fri, 03 Jul 2020 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNQ08xOJSXx5mTZ7nKEWTYDd1rE0muPlxPffB6Is9Kg=;
 b=oIZeMpknTWhsjDHKnePxhZoHYAZ7udtNMre/J4VWCnjy3Mf9fe4DTPehnM5zZYvBT+
 B262LNTeTrzgFPbe2+qRMNHxPFvTIEclVsXKNIVXoCYTOlMwdYMDKqyhMnDQHdek0wid
 8JZor+S6UFoqGMiDo2T/zit4oSg5BSV6VafM+5LpJ9JalMZKKF80Z8r15vZmYBCTE4Fv
 u3mqb3STxWntD01G0nxqbbk84/yg8WCrySyHpcc8gic8n1Ry6cEAuCR6PSlD2qzDdKKP
 ckqDOybZ1f0KP161laPXl6XLmdBWV6MQOrha49lj00FhHFO8oWoEEELBJS+R0AuJA1xq
 W48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MNQ08xOJSXx5mTZ7nKEWTYDd1rE0muPlxPffB6Is9Kg=;
 b=W9PYoshQGCLDV1c/lGWghFA/fKiLNxFni6dWKNWxFRB1r//8Y+PP38NLjvvufNOK/V
 qHxYLNyOH6dF/lPgoyCuyKpACgL2VDkl4OMFQV9krxfOQ8C8Jm42S81i5lR4XXhMzQ6F
 cHVIb8dkXSV0eVK9GIwftH5X7diO7ZIfSPU5q0luJDzmWs4ka56aOVxo3YB2RJEa+S2x
 UJgkHgcPsaHs6TAZZiV76p/7FnzxU6oJ1sLRxM42SGOqnUguMCW9cMb46lq/MtOExY40
 PqosIm5tuFFKc9x2AR33GOMujBBsTJ/KJywVKEDzYnD5Qbdd0cW5vMKTPMhRe9hKAQlp
 oKBg==
X-Gm-Message-State: AOAM530DVFBDWGVkQA1wwirJDtwXbx6C9hB4EE3OA2uDKM3hAnChZoV6
 EYirEf7g4ks8mm/7jWMPDG0fg6ZG1Yk=
X-Google-Smtp-Source: ABdhPJzazbdNhGdghmOvLn4Mu7selfM7fqbpvIdp2JjuHgdpdunxK+5LPBKgs2/S9e+CjPCTQ6MX5A==
X-Received: by 2002:a63:7cf:: with SMTP id 198mr27198811pgh.309.1593761898313; 
 Fri, 03 Jul 2020 00:38:18 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id j13sm9792281pjz.8.2020.07.03.00.38.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 00:38:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  3 Jul 2020 13:08:13 +0530
Message-Id: <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
References: <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/sched_rr_get_interval: Validate the timeslice
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Validate the timespec returned by sched_rr_get_interval() against the
value read from /proc/sys/kernel/sched_rr_timeslice_ms.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval01.c     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 31d7b5d56a52..f358c91ac505 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -62,6 +62,7 @@ static void run(void)
 		        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
 	}
 
+	TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
 }
 
 static struct tst_test test = {
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
