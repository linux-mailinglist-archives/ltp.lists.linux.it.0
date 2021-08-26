Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 994E43F854C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 12:27:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59CEF3C2F12
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 12:27:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD26E3C2E20
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 12:27:56 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 12F406012DA
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 12:27:55 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6EA644075F
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629973675;
 bh=MulkaxIX8wvjNZVnxZoIcBvceSI/KcXNHwctuvrFBc8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=PG2Gxt4xIr68e7hQoVLPsC18scECefPi+Kf/wNTgcKefa4EAvc/eKpWAJkBREBTpv
 rfbjZ+5w1sbtWje47f/ZYAfP1Z57ahAmt7uCTkPtiNztnIZud2gfpVi2ayqLtPvC+k
 5IeUCNKJKkXlLYYl5FTEOzi2z5QjWs0jUyd/01rgJtmpXrNCM8ZWPttij4KPGO9FH4
 2cif7BNrUc6Rx7NqIwkPuRVs4l+MgnUqx53L9LyQ27mWtPDNjW4ILaFUz3VkCY4onY
 Gi1fbQou3VPzWANQfA5Jp5d3KSJq0p2prz0UvGN8CJIpN0l4qhEXBNBzr26LKOoaS2
 jonayShepFJUQ==
Received: by mail-wm1-f69.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so775057wml.1
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 03:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MulkaxIX8wvjNZVnxZoIcBvceSI/KcXNHwctuvrFBc8=;
 b=MhT9REPHPK6v1N3WjtPOMqdniiM1snnKV1LBnnLDuo8XogdLTdclLWLU1PCZeRGdem
 PnLEz5vd1TLNpMPAT7yqMdGJjBXvGUmETlyNmILPLLM7YI7QY2KgFbamFf3p3OgSZPPB
 30sXEKlWdlp124n4CU6z6rNTxILajsMn2XripgJqWmAlu38WX7ZOLLsuOuboBRmGzXLp
 vVc7YrNa8U+L+RSzbPh3wkXjT8jukdCArjDZuhGX8qRV9er2FfdsrI2tiVxI4BaBwzEG
 G/PdE6OwchxY25AXZLG69c7s4vu9GZxaHaqPySNjZweQ2M77/tJNQSnyEbG/dJ8bLrBn
 Uz9A==
X-Gm-Message-State: AOAM5302DYm7GIpKG0Pdx4RoVRZS8a3RYaSHp4KQlNs8oyIAjNxW9BXU
 sSy19T3Ww3GvKUlHGq9YWJkKsIRyzrFLlxRvN7b/kD6NOFzhvhPEhBQS2rri5tYeONN4wO+cbMv
 zHTO+M6IUj0auCwwDU3hlsa/6iRgL
X-Received: by 2002:a5d:5150:: with SMTP id u16mr3067597wrt.156.1629973674938; 
 Thu, 26 Aug 2021 03:27:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjJb8a5ZrMfImAvCk4yaYL1lpcaQi8R+YU3rWHEiCmxvyYDp+ZS4Afl7O3cKIugPq+D2Dw0g==
X-Received: by 2002:a5d:5150:: with SMTP id u16mr3067588wrt.156.1629973674807; 
 Thu, 26 Aug 2021 03:27:54 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.122])
 by smtp.gmail.com with ESMTPSA id b13sm2542869wrf.86.2021.08.26.03.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 03:27:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 26 Aug 2021 12:27:08 +0200
Message-Id: <20210826102708.23721-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v6] syscalls/msgstress: tune limit of processes for
 small machines
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

Forking the exactly amount of processes as the limit (either from
max_pids or from cgroups) is risky - OS might be doing some work and
interfere with the test.  Instead leave some reserve (hard-coded
to 50) for the OS so the test won't fail on fork failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v5:
1. Move the max-pid-reserve to cover non-systemd case.
---
 lib/tst_pid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index 23753988ca57..897a1b96ac1d 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -32,6 +32,8 @@
 #define PID_MAX_PATH "/proc/sys/kernel/pid_max"
 #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
 #define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
+/* Leave some available processes for the OS */
+#define PIDS_RESERVE 50
 
 pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
 {
@@ -124,6 +126,11 @@ int tst_get_free_pids_(void (*cleanup_fn) (void))
 	if ((max_session_pids > 0) && (max_session_pids < max_pids))
 		max_pids = max_session_pids;
 
+	if (max_pids > PIDS_RESERVE)
+		max_pids -= PIDS_RESERVE;
+	else
+		max_pids = 0;
+
 	/* max_pids contains the maximum PID + 1,
 	 * used_pids contains used PIDs + 1,
 	 * so this additional '1' is eliminated by the substraction */
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
