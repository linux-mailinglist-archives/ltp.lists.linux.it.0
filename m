Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18A3C742F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:16:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32AA73C9D3F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:16:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D9F93C878C
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:16:01 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E9A46600BF5
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:16:00 +0200 (CEST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 42BF540612
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626192960;
 bh=vMetiXMdvIbRMIPt7C/GQbBOhMT9/bYRlL0qNGvPk3M=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=XWlFRp3o3Qz5NHDOP89FP1RAzSLnY0s+FODfN5NQOJ0yWCMkYlBrNyJxXQlf/XVCw
 d/PXceO7jrQrjccADtjf6HpjqXjzJvu8J61n7+X2rVIyvNB0rDIFBBowZQ2yRQgESt
 VJG6w3EqJ1Sv/fj4l6v796MNoi2ioIA6WmLz3q2i3vb0hNzavGLtk2/wi9Sh9MzSPh
 VdpFTfShiRXJ8EOwWdQbhrmEp19Vkd7oXwr6rr1la+W0Lc3sA6yTGD6qi1YBBfvpgA
 oZZulCVBnFiSHnrPJUuWX5QCsn0yPKxn/c7Ly9uTw/CJEnH0DkeK4a2RwbiCFrI+tN
 KQ4ukDKfS5MlA==
Received: by mail-ej1-f72.google.com with SMTP id
 sd15-20020a170906ce2fb0290512261c5475so3152837ejb.13
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vMetiXMdvIbRMIPt7C/GQbBOhMT9/bYRlL0qNGvPk3M=;
 b=OCw+pK2/eFWfDlKBtC9eXMfcR5/0RWESoORHlSE/xbrSk5UOVBV1ll8qOxOwdcT+oY
 Uft4OwjCKhON+8bHQQqXKhLzzm4l7AuXV2I3GUH97mxOyzpallGtCotZTUo2UwX2DPDE
 gOhyDsWFetdPafHpmgFpM1skSSoLo1aDi2OKk5hEo5Igj6Zils+I4mOquoCinalcTsiV
 CzREVbEcpgHzjaOko0adI3VLJp6h+CDclq9w22MTktRA+Hd5Zqy+3fG3ucjgkzd8K5KG
 VvFu/mX/Ybu0yXNn1llzfVGWOw1KG/O8VYdIlps2Xk2KKtrd55r66/oE+D8lPm96aRLY
 7Jrg==
X-Gm-Message-State: AOAM533juJiXjFRi+O/Go9zv+aVuHPTWAIaWLvCzchyLHIc5X71uJtlg
 PCcUtUPze1mQbhoKpZ/IwulNbeGO8qveTuFM0679nhgNbeaqSZJ5Dmd3gl+c0hl/SlZjXQk1V2K
 DKWasiGh/0FNxsqX9ZRFn6e/MN8nB
X-Received: by 2002:a17:906:2dc9:: with SMTP id
 h9mr6651201eji.345.1626192959808; 
 Tue, 13 Jul 2021 09:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWpjVflA0eDqXk9DYLFOjKBdgUDN5cOWlqDK+lEAk4TL3lhwLiJfdOsrLjfcD88iaM/qFKpQ==
X-Received: by 2002:a17:906:2dc9:: with SMTP id
 h9mr6651188eji.345.1626192959687; 
 Tue, 13 Jul 2021 09:15:59 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b12sm9952161edu.30.2021.07.13.09.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:15:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 18:15:56 +0200
Message-Id: <20210713161556.63096-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/memcg: document non-hierarchical on v5.11
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

Since kernel v5.11, there is no non-hierarchical mode, so mention it in
the code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../kernel/controllers/memcg/functional/memcg_lib.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
index 3d04c3a60700..873b637c88f9 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
@@ -124,13 +124,17 @@ memcg_setup()
 	ROD mkdir /dev/memcg
 	ROD mount -t cgroup -omemory memcg /dev/memcg
 
-	# The default value for memory.use_hierarchy is 0 and some of tests
-	# (memcg_stat_test.sh and memcg_use_hierarchy_test.sh) expect it so
-	# while there are distributions (RHEL7U0Beta for example) that sets
-	# it to 1.
+	# For kernels older than v5.11 the default value for
+	# memory.use_hierarchy is 0 and some of tests (memcg_stat_test.sh and
+	# memcg_use_hierarchy_test.sh) expect it so while there are
+	# distributions (RHEL7U0Beta for example) that sets it to 1.
 	# Note: If there are already subgroups created it is not possible,
 	# to set this back to 0.
 	# This seems to be the default for all systems using systemd.
+	#
+	# Starting with kernel v5.11, the non-hierarchical mode is not
+	# available. See Linux kernel commit bef8620cd8e0 ("mm: memcg:
+	# deprecate the non-hierarchical mode").
 	orig_memory_use_hierarchy=$(cat /dev/memcg/memory.use_hierarchy)
 	if [ -z "$orig_memory_use_hierarchy" ];then
 		tst_res TINFO "cat /dev/memcg/ failed"
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
