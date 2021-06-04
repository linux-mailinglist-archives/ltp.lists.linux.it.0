Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4639B9FF
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 15:41:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F01673C7FE3
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 15:41:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF55C3C4EEB
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 15:41:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 59DE4601D15
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 15:41:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8187B21A07;
 Fri,  4 Jun 2021 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1622814103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wGfM9/E4RfPow8f92tU7wsqN/OWI1965l5M9Kp3jZbk=;
 b=TNE0LqOzEhcA3Jb+QPPnSzgh4hgIkDA+bQRXfxjp6mpmzYkqJJqRP2/yyQgTFR7HDumjR0
 +xMSjEu+mW792kU9MHzB0MKSl5lfI9sI5hHcXTggzzEw3fB316tKtZ4mKmmBtj4y2m6DCN
 oNSgliypBK9zo7Ew/d3We/3wvXLEp+s=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 53DC6A3B81;
 Fri,  4 Jun 2021 13:41:43 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  4 Jun 2021 14:41:36 +0100
Message-Id: <20210604134136.6629-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] API/CGroups: Remove TEST macro use from library
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 lib/tst_cgroup.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 6d94ea41c..2b99c81a4 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -1073,6 +1073,7 @@ ssize_t safe_cgroup_read(const char *const file, const int lineno,
 	const char *alias;
 	size_t prev_len = 0;
 	char prev_buf[BUFSIZ];
+	ssize_t read_ret = 0;
 
 	for_each_dir(cg, cfile->ctrl_indx, dir) {
 		if (!(alias = cgroup_file_alias(cfile, *dir)))
@@ -1081,9 +1082,9 @@ ssize_t safe_cgroup_read(const char *const file, const int lineno,
 		if (prev_len)
 			memcpy(prev_buf, out, prev_len);
 
-		TEST(safe_file_readat(file, lineno,
-				      (*dir)->dir_fd, alias, out, len));
-		if (TST_RET < 0)
+		read_ret = safe_file_readat(file, lineno,
+					    (*dir)->dir_fd, alias, out, len);
+		if (read_ret < 0)
 			continue;
 
 		if (prev_len && memcmp(out, prev_buf, prev_len)) {
@@ -1093,12 +1094,12 @@ ssize_t safe_cgroup_read(const char *const file, const int lineno,
 			break;
 		}
 
-		prev_len = MIN(sizeof(prev_buf), (size_t)TST_RET);
+		prev_len = MIN(sizeof(prev_buf), (size_t)read_ret);
 	}
 
-	out[MAX(TST_RET, 0)] = '\0';
+	out[MAX(read_ret, 0)] = '\0';
 
-	return TST_RET;
+	return read_ret;
 }
 
 void safe_cgroup_printf(const char *const file, const int lineno,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
