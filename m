Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id A7DA116405D
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9388C3C2456
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 10:28:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9A9E33C2637
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:22 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4754214019E3
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 10:28:21 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id m7so1587807pjs.0
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37QIktMIjjUwiyUPZlelPdMw0kydozoDLmaxlm4trCw=;
 b=ZhcwadaEG7+LcLUkoIZncsTAtJ0lb2WZZtlgC2eHxSGdkb/0NeNwY31r6jAFdJtBhs
 c7NOLNZoArcPnqE1kZ3Ujm+CNinlYkNKq+gViDKpQrdjZk5UUb9QPB+xbVlPE7p4Ae7Y
 C+g5PPbGWFJsMAkRD+7et/seixTAFRsjsluZjeAeyVqP6UUuS+tCqPFh2ibMVG65mU7+
 yseglTMpphYwHBZYTQrsYpNE4HeU8smq9QNM2ioQq6W2obVQu6HiRIxMj/JYwgJ/GW+y
 io3nBhHzQqtyRsdNUeXopN5qNSjPvIUQgQCqtV2vqIkOsyQPGTc+LnEfiSGGd14q4eiG
 HXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37QIktMIjjUwiyUPZlelPdMw0kydozoDLmaxlm4trCw=;
 b=Z9XatrYwNZXgZKIMyrA9VQrX2AiQe1FN1GZOk9QNjJMTXNeSR4g2FyqEfTfJd0qwZu
 BGK453Mjr9LYY8yh9BAK46BKGuqFPwnj1689wBdYWP0CmDyRNIxBpRhy05h7ILKcmY58
 FtcoyX1PoArZ6SJK2QxzgZKIeAxfkc17s/gYvDDlv/Q/EssLDY4crc/YgFpQUKEivZdR
 +XZ6g1OD1Ol4VPuV8gT7un6NBDrQYLUvVkVlIyJ+djkBfa2hLTXVujTe6ujaWeKTlano
 WNuFe5Ry20eVaT4LEp5VJdGSbSOZkX6E9vEmpHr1pGuxiCRLubO4GcLtKGhkqVGyDupT
 7cig==
X-Gm-Message-State: APjAAAVWrB76wny8qlAxxWg5+DIDZnp3m9U28PMc0vEC1oC/AgiPXn46
 9zNZcFy4bO2GO8Qj6+LLJa6MDzf9a20=
X-Google-Smtp-Source: APXvYqw5a3/pa0wlZ6DtPjirnQ/z+mQpDsCwjAekVlofy6EYvwqlA7fV3nE0wdGgp5tcQFUoQeeReQ==
X-Received: by 2002:a17:90a:c20d:: with SMTP id
 e13mr8001525pjt.95.1582104499428; 
 Wed, 19 Feb 2020 01:28:19 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id b18sm2046132pfd.63.2020.02.19.01.28.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 01:28:18 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 14:57:58 +0530
Message-Id: <8d552688d85a7acc62d654832ab7ce270a70cf77.1582104018.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582104018.git.viresh.kumar@linaro.org>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 02/10] lapi/fsmount.h: Add
 fsopen_supported_by_kernel()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a helper to check if the fsmount() related syscalls are supported by
the kernel or not.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/fsmount.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
index 87f2f229c371..e23b52e3733b 100644
--- a/include/lapi/fsmount.h
+++ b/include/lapi/fsmount.h
@@ -130,5 +130,14 @@ enum fsconfig_command {
 
 #endif /* OPEN_TREE_CLONE */
 
+void fsopen_supported_by_kernel(void)
+{
+	if ((tst_kvercmp(5, 2, 0)) < 0) {
+		/* Check if the syscall is backported on an older kernel */
+		TEST(syscall(__NR_fsopen, NULL, 0));
+		if (TST_RET == -1 && TST_ERR == ENOSYS)
+			tst_brk(TCONF, "Test not supporter on kernel version < v5.2");
+	}
+}
 
 #endif /* FSMOUNT_H__ */
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
