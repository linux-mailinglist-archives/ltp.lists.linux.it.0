Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8C3A8690
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CDB63C2794
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A8DED3C2794
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 265351400F91
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:16 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDE221FD68;
 Tue, 15 Jun 2021 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXn/BdJXjqgXVuZ3WrYd0GiwFn8az9PKXyYSHLsQ1bQ=;
 b=W6q0xUv1RyThhpZBOwBzFCIv/Xaxb5A8kYJEpFC1DROuoi3VjMoyJ79aIBw7T9Pd/vAjQ+
 9pD2ekFfa2WrrrthwGrVwWHA6Xu/hVf+es/2KrmJQAMvvuLe9AdpS8qCEqWpXluUC4f0p7
 20RdzTEOs60GU10JNDVXultAzP5MAFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXn/BdJXjqgXVuZ3WrYd0GiwFn8az9PKXyYSHLsQ1bQ=;
 b=EL/jUrew5d9pPwrEBlJpklNxPOfjXFhqUIxdAjIlOIx9stxhBMnBF7hDzoeDxR1hEnX7mR
 NtVy5MVWug6SNxDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6A1C3118DD;
 Tue, 15 Jun 2021 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXn/BdJXjqgXVuZ3WrYd0GiwFn8az9PKXyYSHLsQ1bQ=;
 b=W6q0xUv1RyThhpZBOwBzFCIv/Xaxb5A8kYJEpFC1DROuoi3VjMoyJ79aIBw7T9Pd/vAjQ+
 9pD2ekFfa2WrrrthwGrVwWHA6Xu/hVf+es/2KrmJQAMvvuLe9AdpS8qCEqWpXluUC4f0p7
 20RdzTEOs60GU10JNDVXultAzP5MAFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXn/BdJXjqgXVuZ3WrYd0GiwFn8az9PKXyYSHLsQ1bQ=;
 b=EL/jUrew5d9pPwrEBlJpklNxPOfjXFhqUIxdAjIlOIx9stxhBMnBF7hDzoeDxR1hEnX7mR
 NtVy5MVWug6SNxDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id KEQmGEvWyGDdfQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 16:33:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 15 Jun 2021 18:33:06 +0200
Message-Id: <20210615163307.10755-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210615163307.10755-1-pvorel@suse.cz>
References: <20210615163307.10755-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/3] lib: Add $LTPROOT/testcases/bin into PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

when LTPROOT set. Put it as the last.
TWARN when directory does not exist.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_test.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 36a4809c7..14a739eb5 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1149,15 +1149,31 @@ static unsigned long long get_time_ms(void)
 static void add_paths(void)
 {
 	char *old_path = getenv("PATH");
+	const char *ltproot = getenv("LTPROOT");
 	const char *start_dir;
-	char *new_path;
+	char *bin_dir, *new_path = NULL;
 
 	start_dir = tst_get_startwd();
 
+	/* : - current directory */
 	if (old_path)
-		SAFE_ASPRINTF(&new_path, "%s::%s", old_path, start_dir);
+		SAFE_ASPRINTF(&new_path, "%s:", old_path);
 	else
-		SAFE_ASPRINTF(&new_path, "::%s", start_dir);
+		strcat(new_path, ":");
+
+	/* empty for library C API tests */
+	if (strlen(start_dir) > 0)
+		SAFE_ASPRINTF(&new_path, "%s:%s", new_path, start_dir);
+
+	if (ltproot) {
+		SAFE_ASPRINTF(&bin_dir, "%s/testcases/bin", ltproot);
+
+		if (access(bin_dir, F_OK) == -1)
+			tst_res(TWARN, "'%s' does not exist, is $LTPROOT set correctly?",
+				bin_dir);
+		else
+			SAFE_ASPRINTF(&new_path, "%s:%s", new_path, bin_dir);
+	}
 
 	SAFE_SETENV("PATH", new_path, 1);
 	free(new_path);
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
