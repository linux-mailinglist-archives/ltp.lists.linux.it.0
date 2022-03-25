Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418E4E7A46
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Mar 2022 19:44:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7850A3C91DA
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Mar 2022 19:44:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A67343C8CA0
 for <ltp@lists.linux.it>; Fri, 25 Mar 2022 19:44:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E8AED140117C
 for <ltp@lists.linux.it>; Fri, 25 Mar 2022 19:44:41 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E7C121F38D;
 Fri, 25 Mar 2022 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648233880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yxZLfj07w7DLlhOXV1EqEPWdLMmxNWxaxG2wRtWyvAw=;
 b=3QcjBdolYui6yjfnRK1qKrY77vcjQIJcIKFMHvjET9JmoZGJDpo6syIZl+t+/8QphXGPCu
 DhycFQ84ZZ5HzhvVwMaR9b4AKoiylydGfyZ3Y/M9ARJZMiMdZc3wduNDJbcHOUqHFg/nSb
 tPrPdvV0gVigCV8N1EflMsygyeg29K8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648233880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yxZLfj07w7DLlhOXV1EqEPWdLMmxNWxaxG2wRtWyvAw=;
 b=aN24xQmlBMzjhbLU+2XBRr+kDihLGTcGQN0Isr3F1Gv50diJWr3oa6RXyA6GzhJqJMOvxI
 huPdAhIfbZk00xCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CB8D11386C;
 Fri, 25 Mar 2022 18:44:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id TqN+K5cNPmI7aQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 25 Mar 2022 18:44:39 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 25 Mar 2022 19:44:35 +0100
Message-Id: <20220325184435.1206-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lib: Retry safe_clone() on ENOSPC|EUSERS
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

In some tests we are creating the namespaces faster than they are being
asynchronously cleaned up in the kernel. Thus retrying the clone() on
ENOSPC (or EUSERS for kernel < 4.9).

Before:
$ sudo ./userns08 -i 10
userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:65: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:36: TBROK: clone3 failed: ENOSPC (28)

With fix:
$ sudo ./userns08 -i 10
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:38: TINFO: clone3() failed => retrying: ENOSPC (28)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)
userns08.c:67: TPASS: Denied write access to ./restricted : EACCES (13)

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 384c73e163..527d265d0a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -446,6 +446,14 @@ pid_t safe_clone(const char *file, const int lineno,
 
 	pid = tst_clone(args);
 
+	/* too fast creating namespaces => retrying */
+	if (pid < 0 && (errno == ENOSPC || errno == EUSERS)) {
+		tst_res_(file, lineno, TINFO | TERRNO, "%s() failed => retrying",
+				 pid == -2 ? "clone" : "clone3");
+		usleep(100000);
+		pid = tst_clone(args);
+	}
+
 	switch (pid) {
 	case -1:
 		tst_brk_(file, lineno, TBROK | TERRNO, "clone3 failed");
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
