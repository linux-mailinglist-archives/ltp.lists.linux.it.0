Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF2473EED
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 10:07:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34D413C8BAE
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Dec 2021 10:07:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CCF383C2FF6
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 10:07:33 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EEE3920114A
 for <ltp@lists.linux.it>; Tue, 14 Dec 2021 10:07:32 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 42EBA212BA;
 Tue, 14 Dec 2021 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1639472852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTtCgY6gHtUjM1RqaQIlRIqsNKEVgozSSwiU8cT2pyQ=;
 b=B5bQKU14D/7W/J1Zko+BqMb0WYxBtquuPmEN0ohydAoT91nTnGKInKqEOfkZhMPen/RTJG
 rkmVwZ19bXebZ7FCsGuZP1ajlJxznKzJhc8hQOzM3T/Nv7l1QuXWJ0ahw6PnoPEuChwb3d
 kdsB8qQ+oiJaidNbY6ISeIvK07DH5sE=
Received: from g78.suse.de (unknown [10.163.24.42])
 by relay2.suse.de (Postfix) with ESMTP id 10B6AA3B81;
 Tue, 14 Dec 2021 09:07:32 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 14 Dec 2021 09:06:45 +0000
Message-Id: <20211214090648.14292-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211214090648.14292-1-rpalethorpe@suse.com>
References: <20211214090648.14292-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] API: cgroup: Add safe_cgroup_occursin
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Similar to cg_read_strstr from kselftests. The name was changed
because strstr from string.h returns a ptr and this does not.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/tst_cgroup.h |  8 ++++++++
 lib/tst_cgroup.c     | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index 9e34321e4..632050e86 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -191,5 +191,13 @@ void safe_cgroup_scanf(const char *file, const int lineno,
 		       const char *fmt, ...)
 		       __attribute__ ((format (scanf, 5, 6), nonnull));
 
+#define SAFE_CGROUP_OCCURSIN(cg, file_name, needle)		\
+	safe_cgroup_occursin(__FILE__, __LINE__,		\
+			     (cg), (file_name), (needle))
+
+int safe_cgroup_occursin(const char *file, const int lineno,
+			 const struct tst_cgroup_group *const cg,
+			 const char *const file_name,
+			 const char *const needle);
 
 #endif /* TST_CGROUP_H */
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 61cc02fa7..f85dc4fdd 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -1153,3 +1153,15 @@ void safe_cgroup_scanf(const char *const file, const int lineno,
 		 "'%s': vsscanf('%s', '%s', ..): Less conversions than expected: %d != %d",
 		 file_name, buf, fmt, ret, conv_cnt);
 }
+
+int safe_cgroup_occursin(const char *const file, const int lineno,
+			 const struct tst_cgroup_group *const cg,
+			 const char *const file_name,
+			 const char *const needle)
+{
+	char buf[BUFSIZ];
+
+	safe_cgroup_read(file, lineno, cg, file_name, buf, sizeof(buf));
+
+	return !!strstr(buf, needle);
+}
-- 
2.34.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
