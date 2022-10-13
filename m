Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4139E5FDD83
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Oct 2022 17:49:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE2283CAEFD
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Oct 2022 17:49:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FDB13CA9C7
 for <ltp@lists.linux.it>; Thu, 13 Oct 2022 17:49:37 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 01170100113B
 for <ltp@lists.linux.it>; Thu, 13 Oct 2022 17:49:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F9BF21DF1;
 Thu, 13 Oct 2022 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665676176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPqTpadsK3K4MBj+L1G6tCnNkWkhBlGjOolnzRWmw+c=;
 b=gWTDwOi0rulCmfydRgWGjvwciwWhRFiRXjNaDKyXFFO2RoUC7wwtOV0XMKoMjhsVaigUK2
 Nuhhfw7zPHuZWJ3896qT/GfGJHgxu7koqDvn0y0m5jclSajHo3B5pqKH17TJsIqOjEPoRZ
 D7CQ6nEmiLwi1tzMuFNxkO8+wXakekc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665676176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPqTpadsK3K4MBj+L1G6tCnNkWkhBlGjOolnzRWmw+c=;
 b=HilCS8M0cQd1D9/gTzK+NrrCUxJ2dExeP6UVeUumVn9gBGWcFfoPspGxIiRBpi/whVrjEm
 Y+uQTRY3jvEwmnBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69F0313B85;
 Thu, 13 Oct 2022 15:49:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SDzbGJAzSGMnDQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 13 Oct 2022 15:49:36 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: amir73il@gmail.com,
	ltp@lists.linux.it
Date: Thu, 13 Oct 2022 17:49:34 +0200
Message-Id: <20221013154935.20461-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013154935.20461-1-mdoucha@suse.cz>
References: <20221013154935.20461-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] Add fanotify_get_supported_init_flags() helper
 function
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 51078103e..43434f6ac 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -213,6 +213,26 @@ static inline int fanotify_init_flags_supported_by_kernel(unsigned int flags)
 	return fanotify_init_flags_supported_on_fs(flags, NULL);
 }
 
+/*
+ * Check support of given init flags one by one and return those which are
+ * supported.
+ */
+static inline unsigned int fanotify_get_supported_init_flags(unsigned int flags,
+	const char *fname)
+{
+	unsigned int flg, ret = 0;
+
+	for (flg = 1; flg; flg <<= 1) {
+		if (!(flags & flg))
+			continue;
+
+		if (!fanotify_init_flags_supported_on_fs(flg, fname))
+			ret |= flg;
+	}
+
+	return ret;
+}
+
 typedef void (*tst_res_func_t)(const char *file, const int lineno,
 			       int ttype, const char *fmt, ...);
 
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
