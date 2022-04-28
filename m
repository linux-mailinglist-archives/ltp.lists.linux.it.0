Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2F513CB6
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 22:40:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52F473CA751
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 22:40:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AD5F3C8972
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 22:40:34 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 985A46008F9
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 22:40:34 +0200 (CEST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 34E743F316
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1651178434;
 bh=lkMuQRaD9xqKXNPdAkrG/xWelk1VieZni6Pbeo32lp8=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=UExyTpDZq0/7AVheZdye6oUYKsDmUqhUGWlLgqjJZBBR/ekMOBFnRIx+jfFXMWjrG
 36674CETjTJS8n4KmFGZIZU6M+NSmjo6pP0QHp/MxjjwWPiFyFh5/N2Silb9YsrqMf
 Vf24YTR7ezoorv1SPSiPlLiPAOcnnRLv7T3hmFVfFMKepvvnwgnysUhftcWOQ1KED0
 hlPLpr+5v7wpxA+3eiWTijPz/UWd6oV1kSQRcHh4OHiArqAOEqBBDb4rBMoBXbWlI9
 x/8+fFEXVVJ/9F+MYqAJkhbak9KLM0v3wITenkullJtyqRgzo2NLBXXGDCezs6BVI3
 L/ucOx+wz/0uA==
Received: by mail-pj1-f69.google.com with SMTP id
 s5-20020a17090aa10500b001d9a8e99e3aso3155544pjp.2
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 13:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkMuQRaD9xqKXNPdAkrG/xWelk1VieZni6Pbeo32lp8=;
 b=g0CwuNloPAG86h7fzgwOMfMR4OAOmxbnNZ5iMqUhLBKuM6gfK4+Laa6WAGhGKngnms
 y+WfU6HJV9VXLa+Gg+l+gwae+3SW1TR3bt3mdQXp7HRHLBxS+TGlCI3WztKSkFsCLp71
 PhI6N3oUgKhZ2VeZPvQ+SIQYbxoTrGgn0dXcYIX7AJ3HB/h19ix2GGjWrTWbm1JZvLle
 VmN74J8KWNVmi6GIHMeCHNTOg+mnW9fqvzJjoNLQZDrsai25lS7Xs7AJST2bkJKTYLLU
 DBueo6inXh5+Ag4XKNLckj7iPj7W/CGQkYk/ZuokWpKQuc0s3QqnQSNPh8ZGwskPgL8R
 vVHA==
X-Gm-Message-State: AOAM533ObM9mK7siNTc1GXPnlidGNaPXKesOXc8iMmZq9vSggWT66VcU
 DBphnfYS3X39LuLn3zU0b6NqgsmWNZkr6fR+aT6wO054WSLxNsejZZAy+EY0anJWzXpREIZ4oZI
 cb26A+qIU9WRrDldDaBSRXG4UECF0
X-Received: by 2002:a05:6a00:a12:b0:504:e93f:2dd9 with SMTP id
 p18-20020a056a000a1200b00504e93f2dd9mr36610323pfh.49.1651178432617; 
 Thu, 28 Apr 2022 13:40:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKeDcvXUYFpX+pRz43g9UFJmqNiCaD+4Omu8qv1tQaGh19a830Sk0oVkFGEI49FgSLUEEq8w==
X-Received: by 2002:a05:6a00:a12:b0:504:e93f:2dd9 with SMTP id
 p18-20020a056a000a1200b00504e93f2dd9mr36610303pfh.49.1651178432374; 
 Thu, 28 Apr 2022 13:40:32 -0700 (PDT)
Received: from luke-ubuntu.buildd (cpe-66-27-118-101.san.res.rr.com.
 [66.27.118.101]) by smtp.gmail.com with ESMTPSA id
 f63-20020a62db42000000b0050d35bcdbc0sm659027pfg.181.2022.04.28.13.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:40:31 -0700 (PDT)
From: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
To: ltp@lists.linux.it,
	rpalethorpe@suse.de,
	liwang@redhat.com
Date: Thu, 28 Apr 2022 13:39:27 -0700
Message-Id: <0d0d6c88542864c055779ff87f08b2230fb6b8a6.1651176646.git.luke.nowakowskikrijger@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1651176645.git.luke.nowakowskikrijger@canonical.com>
References: <cover.1651176645.git.luke.nowakowskikrijger@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 02/19] API/cgroup: Add option for specific pid to
 tst_cg_opts
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

Add an option that would allow to create a test directory with a
specified pid, as opposed to the calling processes pid.

Signed-off-by: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
---
 include/tst_cgroup.h | 4 ++++
 lib/tst_cgroup.c     | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index 6ba3727f3..87e55f4df 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -97,6 +97,10 @@ struct tst_cg_opts {
 	 * version. Defautls to zero to accept any version.
 	 */
 	enum tst_cg_ver needs_ver;
+	/* Pass in a specific pid to create and identify the test
+	 * directory as opposed to the default pid of the calling process.
+	 */
+	int test_pid;
 };
 
 /* A Control Group in LTP's aggregated hierarchy */
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 1abcbaf5a..a3416f4df 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -714,7 +714,11 @@ mkdirs:
 
 	cgroup_dir_mk(&root->ltp_dir, cgroup_ltp_drain_dir, &root->drain_dir);
 
-	sprintf(cgroup_test_dir, "test-%d", getpid());
+	if (options->test_pid)
+		sprintf(cgroup_test_dir, "test-%d", options->test_pid);
+	else
+		sprintf(cgroup_test_dir, "test-%d", getpid());
+
 	cgroup_dir_mk(&root->ltp_dir, cgroup_test_dir, &root->test_dir);
 }
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
