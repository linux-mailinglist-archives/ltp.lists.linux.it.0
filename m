Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E0C91A29C
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2024 11:25:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D56FC3D1290
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2024 11:25:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 123B33D03C1
 for <ltp@lists.linux.it>; Thu, 27 Jun 2024 04:19:58 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=kuan-ying.lee@canonical.com; receiver=lists.linux.it)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DD1F86067A8
 for <ltp@lists.linux.it>; Thu, 27 Jun 2024 04:19:57 +0200 (CEST)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6ADA63F734
 for <ltp@lists.linux.it>; Thu, 27 Jun 2024 02:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1719454795;
 bh=QPeI927ytX9TUCA6BIDf0njlynlxmNMFmE+bfDqzo/8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=wQQe4+qa3V7rKy+GHxB+/mzC9zEaN1jlWW8cTxtdWftPPGdFQ36Caa2YhgNItF+Mk
 aX2/qbl9EAk6VGBxLnPBpT1u1b3wOthnR2sgwVPalCVXSgusxSxhGkZcVzzSKXttHl
 3LdSql/IHgTBWvY3IIQX4QiBCh4sliVD3Ji5ytPFkn8xl8ViCAGn2wW9SjDgM+VoEo
 CL7FiLR8DvokjJJMkudqu0TqM3wrR+NkTJw2rZTcxHo7pR4l+cBUuCVIi14ca/f+F2
 5Y1jkOS6JKngJFP0ZgwK9E5jK6q3aMF1PWlZhUcVczyeGPLJqAbrCNvcnwY6IERw2M
 w5INlWuJbOKeQ==
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-704d99cb97aso8886620a12.0
 for <ltp@lists.linux.it>; Wed, 26 Jun 2024 19:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719454793; x=1720059593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QPeI927ytX9TUCA6BIDf0njlynlxmNMFmE+bfDqzo/8=;
 b=gYqSZlhfdbooFmlq9mEAdGAv1DE4L4+oRvFxsddidvvKzxJ8J9lKFX4sRLFyDVJwtL
 vnhhDbmDPLs6hgOn6awVAnjDoR5Y2Wv7InzTcGLIhZZXlxYZCWfYKovmitQ8K1XYZMpz
 63/3V7QBvfkZw7VkVlnK4p+7c5HGUaCSTyYPUVO3I1FgYRlUHDmGNLv9QyF28BfH1bxc
 9s2V+1DBWL+w6RewINXy5GxAvPmLwcFGlNyf7O5cxCoUkpY8b0X/ZZf7lUnJadqOUc7O
 NvbIE5c7AMrGXBeDmjcsjQQI5JwTGGzYDi7Se2y+RCOCiXRn0573GKjYLdAS5M1Yoe8r
 c60A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk3Mi4ot+Q1nKPWXEbQ+5k8J4sYQ862Y1K0up291/oQoFiLuKnltxMCCroyxxg9MPRKhqTUvbkZLnq9WYulFm5p3o=
X-Gm-Message-State: AOJu0Yx6ZvnAnxwDEGj/jkLLxf/L4B30VKTBaf4yYa3axMenNJwJi+EI
 LDThFO19kILfLPhY1VTNEwvkaxP9Wq8Qg2bq8GB4xFzcTgoAQw7BHVUug0LxNFmvYn50H0Jtke5
 3sSS4n0fpVInK7JlPxr+6zolwlCMR1FmW/Gx0l1VqemGefnlbYKjlE2jpcjgcy2ev
X-Received: by 2002:a05:6a20:1587:b0:1bd:2a88:a36c with SMTP id
 adf61e73a8af0-1bd2a88a4c2mr4817678637.32.1719454793041; 
 Wed, 26 Jun 2024 19:19:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJZE/J/8eMMpxVGP5uQw2EqeiDcfN4SBHV08hE7MHP1WEw4TsL9zHw5XubA0C/01URImwthg==
X-Received: by 2002:a05:6a20:1587:b0:1bd:2a88:a36c with SMTP id
 adf61e73a8af0-1bd2a88a4c2mr4817663637.32.1719454792501; 
 Wed, 26 Jun 2024 19:19:52 -0700 (PDT)
Received: from kylee-ThinkPad-E16-Gen-1.. ([122.147.171.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1faac8f5900sm1773095ad.103.2024.06.26.19.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 19:19:52 -0700 (PDT)
From: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
To: kuan-ying.lee@canonical.com,
	ltp@lists.linux.it
Date: Thu, 27 Jun 2024 10:19:47 +0800
Message-Id: <20240627021947.13718-1-kuan-ying.lee@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 27 Jun 2024 11:23:38 +0200
Subject: [LTP] [PATCH] kallsyms: check if CONFIG_KALLSYMS=y
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
Cc: po-hsu.lin@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Only if CONFIG_KALLSYMS=y enable, node /proc/kallsyms is
generated.

We need to check if this config is set or not.

Signed-off-by: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
---
 testcases/kernel/security/kallsyms/kallsyms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/security/kallsyms/kallsyms.c b/testcases/kernel/security/kallsyms/kallsyms.c
index ad3a9265afbe..2a5cbaa325ea 100644
--- a/testcases/kernel/security/kallsyms/kallsyms.c
+++ b/testcases/kernel/security/kallsyms/kallsyms.c
@@ -141,5 +141,9 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.max_runtime = 60,
+	.needs_kconfigs = (const char *const[]){
+		"CONFIG_KALLSYMS=y",
+		NULL
+	},
 	.test_all = test_access_kernel_address,
 };
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
