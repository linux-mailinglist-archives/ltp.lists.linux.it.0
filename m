Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7BBA07744
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 14:23:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 941483C223C
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 14:23:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 716AD3C1D33
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 14:23:41 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9623F101716C
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 14:23:40 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A49CC21114;
 Thu,  9 Jan 2025 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736429019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HI6DvL/9EBhBV9vf0uJZ42t12i20KGEwAxiqv1R2Cg0=;
 b=eaT9pC0bp04jyZ/cyMs7O4z6bu8yemyRQpc2qC3+if+i/Kg5mMCLeXMfLFzeScAgiXLncR
 jqd1Por9RmMXVtVqX9tTDPdQtpvFB0NAU7nQ1lQV3oq0uvkBLePh6skJGN8f9l00hsEOPF
 2ySnkZCjWbWffMFbNSCTNyS92ZznI7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736429019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HI6DvL/9EBhBV9vf0uJZ42t12i20KGEwAxiqv1R2Cg0=;
 b=zx6ZXTYM01jccoBQ3u52SSfMzm5SlyXrt8Cr0+H4wIDvkrbmDLvW+WD3RJ5XG+X4+N/6eq
 YxYm6ZwZu3x6DJCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1736429019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HI6DvL/9EBhBV9vf0uJZ42t12i20KGEwAxiqv1R2Cg0=;
 b=eaT9pC0bp04jyZ/cyMs7O4z6bu8yemyRQpc2qC3+if+i/Kg5mMCLeXMfLFzeScAgiXLncR
 jqd1Por9RmMXVtVqX9tTDPdQtpvFB0NAU7nQ1lQV3oq0uvkBLePh6skJGN8f9l00hsEOPF
 2ySnkZCjWbWffMFbNSCTNyS92ZznI7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1736429019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HI6DvL/9EBhBV9vf0uJZ42t12i20KGEwAxiqv1R2Cg0=;
 b=zx6ZXTYM01jccoBQ3u52SSfMzm5SlyXrt8Cr0+H4wIDvkrbmDLvW+WD3RJ5XG+X4+N/6eq
 YxYm6ZwZu3x6DJCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DC5B13876;
 Thu,  9 Jan 2025 13:23:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id V+caBtvNf2d0SwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 09 Jan 2025 13:23:39 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  9 Jan 2025 14:23:33 +0100
Message-ID: <20250109132334.212281-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] [RFC] macros: Remove TEST_VOID()
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

TEST_VOID() macro was meant for syscalls whose return type is void, e.g.
sync(). It was used only sync03.c, which was later merged to sync01.c
and later removed. Now it's unused, therefore remove it.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/old/usctest.h     | 14 --------------
 include/tst_test_macros.h |  7 -------
 2 files changed, 21 deletions(-)

diff --git a/include/old/usctest.h b/include/old/usctest.h
index 2d46c40451..b984c343fd 100644
--- a/include/old/usctest.h
+++ b/include/old/usctest.h
@@ -60,20 +60,6 @@ extern int TEST_ERRNO;
 		TEST_ERRNO = errno; \
 	} while (0)
 
-/***********************************************************************
- * TEST_VOID: calls a system call
- *
- * parameters:
- *	SCALL = system call and parameters to execute
- *
- * Note: This is IDENTICAL to the TEST() macro except that it is intended
- * for use with syscalls returning no values (void syscall()).  The
- * Typecasting nothing (void) into an unsigned integer causes compilation
- * errors.
- *
- ***********************************************************************/
-#define TEST_VOID(SCALL) do { errno = 0; SCALL; TEST_ERRNO = errno; } while (0)
-
 /***********************************************************************
  * TEST_PAUSE: Pause for SIGUSR1 if the pause flag is set.
  *	       Just continue when signal comes in.
diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index b2ca32f771..b2b446b70c 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -16,13 +16,6 @@
 		TST_ERR = errno; \
 	} while (0)
 
-#define TEST_VOID(SCALL) \
-	do { \
-		errno = 0; \
-		SCALL; \
-		TST_ERR = errno; \
-	} while (0)
-
 extern long TST_RET;
 extern int TST_ERR;
 extern int TST_PASS;
-- 
2.47.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
