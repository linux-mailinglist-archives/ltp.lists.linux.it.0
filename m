Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A46113E00CF
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 14:05:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DF433C8003
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 14:05:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F5D43C7FEA
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 14:05:13 +0200 (CEST)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D0C2F1A0021A
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 14:05:12 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id z2so4053446lft.1
 for <ltp@lists.linux.it>; Wed, 04 Aug 2021 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2h2oICRNF8iCHbv8Yq+A8rYQIRS6Fo9O3rakUeRwGls=;
 b=LL93aXdja3nhdg6q9ZS/HQl4dKUdofRpxP7RTw9ohYyg9ctulYA0QiAodxpBECJN7x
 4xXPNavDbsANMpsqoCPLNPdq7gRU52NLP8zKwpucFq5GBLguwqLwUsbIL7LFsVqFiKIQ
 rFpVLMhBxdgZKJthu7Oq7X1dRaTXhB9jcnnrJEa0Rtdl13GHkddfEoES7o8h5EdhvWYy
 EsqJMTbyNWHWMUATilHK53SGappjG2PJ2RX3HG/DxcfkQ0PJspSYOt8hILq87wqPEkbU
 CyKEmadG8c/3MZzt8THChBdKBV5LVj/fjU2WMLleG7O7/TYHeJ2d3J2rSNbt3mdA0URi
 b1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2h2oICRNF8iCHbv8Yq+A8rYQIRS6Fo9O3rakUeRwGls=;
 b=ePmsoaJO08/ahjGae1ZXDlbmdGORDyX6e9URm/n2Qxz3fURNi5g+GdGzLf+OZ+Ds2t
 xlVppgMohUPY5R21V55PI5Vr+EJnzepb1GaDPdr8k7ynM9TNph9/BoxeuHIj1N0/DfHW
 RCuereNBZXBm9/ExnD3ourPrpuD7lxbtfCRVYOhw/hjYc4uA8OPlCEdcT1QHcnpoW3O1
 CgqGSoH+ZstTz+j3/mx6d7JGZGpcyjZ08lwS3vXpvw1UyJ74AE2qtV0xQxOQr48Zyb1A
 CV0XfAd5vJ9d4kdf5oRN+6Eyqp3o0yvE01psXcSA9T46Jqqq+eAvWkndED8x8LQ3JDG5
 kMKw==
X-Gm-Message-State: AOAM532fXLHrHxlnXkR/UEg9/jINYlSwyBGAFQ231/uwPkuRjRYvDacO
 LSyGLL4jEaJg9sE75o035U/HGjcwAXqM
X-Google-Smtp-Source: ABdhPJwI5wEF76jfyKxHoXC1YwZTp83B77sd7k1YznHFIeIdNDVrEeb4iYDHWZKP74Z3An5xQYpw/w==
X-Received: by 2002:ac2:554b:: with SMTP id l11mr16583157lfk.650.1628078711948; 
 Wed, 04 Aug 2021 05:05:11 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id w16sm179768lfp.1.2021.08.04.05.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:05:11 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 15:04:45 +0300
Message-Id: <20210804120446.32835-2-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
References: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] network/tst_net.sh: fix busybox/sysctl in
 tst_set_sysctl()
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

busybox/sysctl expects -e option to be set before 'name=value'.
This can easily be fixed by splitting the string in tst_set_sysctl(),
so that 'rparam' with '-e' option is added in between.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/lib/tst_net.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 511fb7eb1..bb30c13ec 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -918,7 +918,7 @@ tst_set_sysctl()
 	local rparam=
 	[ "$TST_USE_NETNS" = "yes" ] && rparam="-r '-e'"
 
-	tst_net_run $safe $rparam "sysctl -q -w $name=$value"
+	tst_net_run $safe $rparam "sysctl -q -w" "$name=$value"
 }
 
 tst_cleanup_rhost()
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
