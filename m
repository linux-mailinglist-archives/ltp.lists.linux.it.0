Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE86B3E00CE
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 14:05:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 498AD3C807F
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 14:05:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 710EC3C65B1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 14:05:13 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D4F29601100
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 14:05:12 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id h2so4023286lfu.4
 for <ltp@lists.linux.it>; Wed, 04 Aug 2021 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AGyhy2gtrASu3faynnUpUovseMQlQrX1RrbhQi4Za3w=;
 b=0/WofGWLSgEoXm7B4ppRtBpRjvSyfferx1g9mqPcrMbdnY6Cx8BoODS9rSgsWHZcjo
 6ZIVZvE2jku/VaeB0IvtLVX/Y3Fvgxgo42qsBTVrd9Tqg4EUe/CSda4DeOJ739A2j4Um
 EF1BCtyBkszt86BVWO+bn1gLPoMRdm/FaiSzSd8ztdfI6pTIuWsmdTHVfwWgFLP/BHtI
 uxDWr5UydL3oU5qwSz2B6f0M+Km4pDRDhaCCCnQXy17LWOfrvjEQ5Vd6LqBaxGN6OERp
 cYtj1j3ny539eBB/Xm4eHxZ2p7En9HbKsUIOT5+/ykpWaH0YGEDUC8Yb0x/1mN5S5mWe
 LzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AGyhy2gtrASu3faynnUpUovseMQlQrX1RrbhQi4Za3w=;
 b=b6p6F2lKfONSHZ2g64PDg0MnvdXNK4L+I5CzdlzBpY3rsmeAh87fmk6HKsBZiwOjR0
 ijngoziCtsw4RoDbW1xqBx87NgYexdc2pnXU3XHCy1ndSL3g/vgwuybITQEHnAUdRnkD
 y+rFE7o+qkXcAzC6ZX4lB5AhaSyihVDvZt7j0gCPSSVxhDvvHgWlbPqMaA4WhmRh5DpZ
 MawyelgengoBBblEpRGhn/CRzMg0JlLMOjfOGggHA8g6W6uAqAkiASR+jScBrBJ3ejU3
 VMUywSC21jvRb/s/4oYnI/AMSNYDx+OxAMczjkVVGTpRzpA4oGb5dK8YC+X5HvN61Ln+
 M2zg==
X-Gm-Message-State: AOAM530mtsBFsdo8zDxfvrdv0gDf9Sv6UER9Lhjz9LmQlQoyJ893RngJ
 rsY4Fw74yWcaYxJRbH4JUYP98yyxj4Os
X-Google-Smtp-Source: ABdhPJybJGT76zCzn/JQdcORD/K95AMSJSAo9JMdVFp0+VYrb+d7WfO+t+gyBT+bKBt5oUIS+woNkA==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr12021896lfr.525.1628078711582; 
 Wed, 04 Aug 2021 05:05:11 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id w16sm179768lfp.1.2021.08.04.05.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:05:11 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 15:04:44 +0300
Message-Id: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] network/tcp_cc: check sch_netem driver in the lib
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

bbr01, bbr02 and dctcp01 are using netem.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/network/tcp_cc/tcp_cc_lib.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/network/tcp_cc/tcp_cc_lib.sh b/testcases/network/tcp_cc/tcp_cc_lib.sh
index dff8cef19..1a6845664 100755
--- a/testcases/network/tcp_cc/tcp_cc_lib.sh
+++ b/testcases/network/tcp_cc/tcp_cc_lib.sh
@@ -6,6 +6,7 @@
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
 TST_NEEDS_CMDS="sysctl tc"
+TST_NEEDS_DRIVERS="sch_netem"
 
 . tst_net.sh
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
