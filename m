Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29572171005
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D50E43C2546
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 06:15:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 496CC3C25C6
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:52 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9DCE01000C32
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 06:14:51 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id q39so656439pjc.0
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 21:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ux/3onDMUO6pOVwIkjNFpneYEOippMKOaX++Yzv0Ils=;
 b=kbsnvNqQ7EZeZaS+6BYHAsCjlqrSFlYnWkoEO93VI2ESSUNMR9yomzFQvTGreadPJk
 addpjbTBNdJEvNGiPBH5mdiLDtMQ9sZYS5blu9lB7hfAEe5Srs01frWsCXxajSKEOVUs
 0Wb1adS/jyj7hmRPbpSNaWLRyR0njITsZOkOPMFoMjRKMLzgC7vCoAhF1R2YTSN+fp+O
 8Ad2UrjIi3h5vxr4SCcL85C6bmE5UehR9v3xVZ7Sve7QvvB3NyjREkq6/AlLOuNq7r95
 gw8q8DPeztyOxHy0H6Ns2+N0QHj/E/bPhV6vz7lDFH9d/aeTqPl3KMoy7zPGip1f34x1
 UH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ux/3onDMUO6pOVwIkjNFpneYEOippMKOaX++Yzv0Ils=;
 b=VYUVLW4vxYmcYMdg8EItR5yZ4UAJVvnwZ0PP2HGgADcIUvtZRzeW1/eSNjxNvUZKlL
 JFYAgrAKL51meuzksl2heRSB0hPEWGum5wJ9VBdH2g+LoQCRp660gPiVaF0G+CCmCEJ5
 0HFnrY8MFyY4IA9kOOvEQb7TWuCM6vsrLL1OCfwwlM+A3DGE2eZCJd92m6TeiDZvJbf0
 +qzrcpWMaLBjImAJqiaO6lF91ZLSb/TmfFEH7MKcy3EOKqJsVsvQKIJX0WF4HggeKcBc
 sbNkLpsXYrgQPqeXs0KfWeQnAaMkNZuJfub1A2Q283KU9zmAAUIw+pfD6go/Y3UN+DW1
 uNtA==
X-Gm-Message-State: APjAAAXp2pbyyNM+co6L1tG9kx8XMWZ+gr9ByMneE7gFU0KanCapHr4z
 C7aqvLwcNsPMKa5aVO5YLKW8RYmqlM4=
X-Google-Smtp-Source: APXvYqzH63HAJXVq/7C/cIJryWgCFbXxr94rWetVF/XH/SdPl4B/B69TYXBysZGZdgWchF3s70h8kQ==
X-Received: by 2002:a17:902:8549:: with SMTP id
 d9mr2763143plo.153.1582780489791; 
 Wed, 26 Feb 2020 21:14:49 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id y193sm2199461pgd.87.2020.02.26.21.14.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 21:14:49 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 10:44:30 +0530
Message-Id: <21026a48ffa25ed8b09616cb939dc417459d2d74.1582779464.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1582779464.git.viresh.kumar@linaro.org>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V5 02/10] lapi/fsmount.h: Add
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

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/fsmount.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
index 87f2f229c371..a6a24904e66d 100644
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
+			tst_brk(TCONF, "Test not supported on kernel version < v5.2");
+	}
+}
 
 #endif /* FSMOUNT_H__ */
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
