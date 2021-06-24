Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBA3B2FEA
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 15:22:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 687233C6F4E
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 15:22:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C4EE3C2021
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 15:22:32 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 232AE1A01124
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 15:22:31 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwPJO-0001hD-Ug
 for ltp@lists.linux.it; Thu, 24 Jun 2021 13:22:30 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 d8-20020adfef880000b029011a9391927aso2182695wro.22
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 06:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTy6XyjtNxa5bDcsm37hCIzptAzfqqhWnYi91r7vTfc=;
 b=PdX78Vx/eBtL/qESVmH2qhhqVf9oqsF/b9tClufZue24yZlmg5lpWUz2dHEneEzau3
 fZkVRYusbNiK4FR+gIfuc8LaR+P4lqxfwS2uc/5eDYNq2bLA7A0keJ0pA9h/+3WYdKtf
 p633khdbujXmVr3OVv7q1Vtb9cFgy0UtQJiyoZPQaN8O/zxPBYxxmCAez8/7CfxRo7di
 0t3NSUzLSBNAxcVuEtFfY2vyTrAByxUTluSjmf3MSoH6cIRHA20uELsJ8J/ZwjYRjMFe
 8E2sO5Di4waw+WojgJjgNVuIXQkZqt4b8I0T8RMJE5gejf0bidZJejOUz96i6sKMo70D
 K4ZA==
X-Gm-Message-State: AOAM533bRNwo1+lTga1qt9dp47P5uXcuZ9QS1Ie2+1P84VNMKBw6EF7d
 d7Bn9ldPOhbtJGJovNHMADq5hHqCqNDSji6xofVA+sp4zRgbHrmd/1aZMy+RMkjxmMwuSNmgkKZ
 W7eXQt1YOnpOKDiJolJX7vu2MWUDR
X-Received: by 2002:adf:e110:: with SMTP id t16mr4527787wrz.359.1624540950313; 
 Thu, 24 Jun 2021 06:22:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+ZQPW3F7QyZrkQS76NxH8QQMgdbZoIxsSOSqanWkTSZ/EF71vtdZGxW+oOsSKLfwgvpU+Sw==
X-Received: by 2002:adf:e110:: with SMTP id t16mr4527765wrz.359.1624540950103; 
 Thu, 24 Jun 2021 06:22:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id z5sm3367189wrt.11.2021.06.24.06.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 06:22:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 24 Jun 2021 15:22:26 +0200
Message-Id: <20210624132226.84611-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: memutils: don't pollute entire system memory to
 avoid OoM
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

On big memory systems, e.g. 196 GB RAM machine, the ioctl_sg01 test was
failing because of OoM killer during memory pollution:

    tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
    ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg2
    tst_test.c:1357: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
    tst_test.c:1359: TBROK: Test killed! (timeout?)

In dmesg:

    [76477.661067] LTP: starting cve-2018-1000204 (ioctl_sg01)
    [76578.062209] ioctl_sg01 invoked oom-killer: gfp_mask=0x100dca(GFP_HIGHUSER_MOVABLE|__GFP_ZERO), order=0, oom_score_adj=0
    ...
    [76578.062335] Mem-Info:
    [76578.062340] active_anon:63 inactive_anon:49016768 isolated_anon:0
                    active_file:253 inactive_file:117 isolated_file:0
                    unevictable:4871 dirty:4 writeback:0
                    slab_reclaimable:18451 slab_unreclaimable:56355
                    mapped:2478 shmem:310 pagetables:96625 bounce:0
                    free:121136 free_pcp:0 free_cma:0
    ...
    [76578.062527] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=/,mems_allowed=0-1,global_oom,task_memcg=/user.slice/user-1000.slice/session-40.scope,task=ioctl_sg01,pid=446171,uid=0
    [76578.062539] Out of memory: Killed process 446171 (ioctl_sg01) total-vm:195955840kB, anon-rss:195941256kB, file-rss:1416kB, shmem-rss:0kB, UID:0 pgtables:383496kB oom_score_adj:0
    [76581.046078] oom_reaper: reaped process 446171 (ioctl_sg01), now anon-rss:0kB, file-rss:0kB, shmem-rss:0kB

It seems leaving hard-coded 128 MB free memory works for small or medium
systems, but for such bigger machine it creates significant memory
pressure triggering the out of memory reaper.

The memory pressure usually is defined by ratio between free and total
memory, so adjust the safety/spare memory similarly to keep always 0.5%
of memory free.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 lib/tst_memutils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index dd09db4902b0..abf382d41b20 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -21,6 +21,7 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 
 	SAFE_SYSINFO(&info);
 	safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);
+	safety = MAX(safety, (info.freeram / 200));
 	safety /= info.mem_unit;
 
 	if (info.freeswap > safety)
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
