Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 843123CFC5F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 16:34:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9807C3C982F
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 16:34:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EABA13C6354
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 16:34:24 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2C03A2000DC
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 16:34:23 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 7B59A401BD
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 14:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626791660;
 bh=CZugCGvxQ5wKPlF24cz89g5KIYT2PBzeSgeNh2YcBaE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=QFZxqDV2WGuyXHGiArPGW23gghtn7CM0fTwCE/5AG85s4BQX56mIc8VBaEoephZn0
 M6ib4ZC0YYNHzQkyN872sS1xH+zceM4UUCoFVjYi0HOHfrz3JpNKKpXVGZncOac+B1
 8wLAf2RaGSutf7lOgauo0/4wYquom7OiLSc4hDVeePf08+4QMzDHsfSlf3UaGsFuLY
 02XdYwDntQW8Ngl1ZepO3r8GUkJsKiUcbM7ym7UAxlk1PjXz0+eRBp/3Ra78ZYAJWE
 RBA8u53z46P11+acmDD0U6EmQrSrjqjO/31uFcAz+p+AmVdR7ZhY2uKNaA00gfcDAL
 w01jrOzU07t7w==
Received: by mail-ej1-f70.google.com with SMTP id
 q8-20020a170906a088b02904be5f536463so6882929ejy.0
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 07:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZugCGvxQ5wKPlF24cz89g5KIYT2PBzeSgeNh2YcBaE=;
 b=MFO8b6DPXSIEaIE//MXpBQ57VOuZUeVvSd2quO3heAt61g3/tIbAd0Y1hOtzxxLjBY
 fu3HHeA3CvfnMu0P/BUA2wX1OAiqSXzQUAnB109GHAN+Q2mc1QPXNu48LX3cp2CBzNPo
 Dj2VHzCVmMbdpz4JwMzpHLRwO5Wnd5SVswoTHn9bbIbmJ33HEGxae0KeSTTheWfigl74
 wP6yfDGWcyUjCucGi/AvfU9ZDH8XpYD9XV26UbxMZLGq1Cpao5vIU8+3UlfZ4YsrM2Wt
 nI/6ReTGNddUUuuV/MHRwMDzmpO9ubK8zw/H4V/emn7pHyiT04yzbLU5c2OIqtOjG592
 H16Q==
X-Gm-Message-State: AOAM5318grHBtVe6dBuZK8FSUv8SUuz1et49owZ8AMRPwfjGvsF93DnC
 8ayXbunmts0QdiyyQrU69/LvfPAYcrv3hd/SOnPame4GaBCis8sZ1yoMECni/EyZ/Pvgh3fQ7ch
 l2++GsiXpt/wICOYs2FygFXCf/ZR1
X-Received: by 2002:a17:907:7887:: with SMTP id
 ku7mr32604401ejc.102.1626791659942; 
 Tue, 20 Jul 2021 07:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc+X05FTX81fTkREZd46b9+zqqdh2fIR8UlFwbPnU90NlZKmDOXQ1rFEFaizAGT5jydQqYjA==
X-Received: by 2002:a17:907:7887:: with SMTP id
 ku7mr32604388ejc.102.1626791659766; 
 Tue, 20 Jul 2021 07:34:19 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
 by smtp.gmail.com with ESMTPSA id w2sm9344462edx.58.2021.07.20.07.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:34:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:34:14 +0200
Message-Id: <20210720143414.14599-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/memcg_stress: fix order of process cleanup
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

The memcg_stress_test was forking test processes and adding them to new
cgroup.  However cleanup - killing forked process and cgroup removal -
was iterating in mixed up order: killing the newest process but trying
to remove the oldest cgroup.

This could work if all processes died already via earlier "kill -USR1"
but at least in case of Ubuntu with v4.15 kernel this failed and left
cgroups not cleaned up:

    + kill -KILL 3147
    /home/azure/ltp-install/testcases/bin/memcg_stress_test.sh: 96: kill: No such process
    + wait 3147
    + rmdir /dev/memcg/0
    /home/azure/ltp-install/testcases/bin/memcg_stress_test.sh: 98: /home/azure/ltp-install/testcases/bin/memcg_stress_test.sh: Cannot fork

    $ ll /dev/memcg
    0    107  116  125  134  143  18  27  36  45  54  63  72  81  90
    1    108  117  126  135  144  19  28  37  46  55  64  73  82  91

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
index cd75c704a9a4..c2501e164018 100755
--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
@@ -78,7 +78,7 @@ run_stress()
 		mkdir /dev/memcg/$i 2> /dev/null
 		memcg_process_stress $mem_size $interval &
 		echo $! > /dev/memcg/$i/tasks
-		pids="$! $pids"
+		pids="$pids $!"
 	done
 
 	for pid in $pids; do
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
