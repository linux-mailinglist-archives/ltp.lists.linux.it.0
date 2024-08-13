Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D594FFC3
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2024 10:24:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0762E3D20FE
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2024 10:24:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D3B513C8910
 for <ltp@lists.linux.it>; Tue, 13 Aug 2024 10:11:24 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=schwab@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D2B661A00A5F
 for <ltp@lists.linux.it>; Tue, 13 Aug 2024 10:11:23 +0200 (CEST)
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9E148211BF;
 Tue, 13 Aug 2024 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723536680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=yYTUWTJpz17f7w2t2sDOJ398mJQiSnNKCuUByANBOAc=;
 b=hHfvXZjLZ3XhN++7KXKkTgik8l5VPDuRwH8IDyvDrJZv7+pp0v9dMlLAMuL6KHhz+Ve43V
 xOS4vj+BlGDgw2NQ9BAZPyIzxi23CPUA8WypYGCRQPuQgAOdLkdY1EnBdsby+Y8MNzT3jY
 4NarRIzaKrE7ji31zs5o90zTt92lSR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723536680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=yYTUWTJpz17f7w2t2sDOJ398mJQiSnNKCuUByANBOAc=;
 b=PtI+n46gkK3yYJiJTyiM3+sm1efjR5f/UKEK+UadmSogPvjCr9WeyzIIbHNCHB5zIIT2JK
 b5YMhPGV88YR7CAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723536680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=yYTUWTJpz17f7w2t2sDOJ398mJQiSnNKCuUByANBOAc=;
 b=hHfvXZjLZ3XhN++7KXKkTgik8l5VPDuRwH8IDyvDrJZv7+pp0v9dMlLAMuL6KHhz+Ve43V
 xOS4vj+BlGDgw2NQ9BAZPyIzxi23CPUA8WypYGCRQPuQgAOdLkdY1EnBdsby+Y8MNzT3jY
 4NarRIzaKrE7ji31zs5o90zTt92lSR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723536680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=yYTUWTJpz17f7w2t2sDOJ398mJQiSnNKCuUByANBOAc=;
 b=PtI+n46gkK3yYJiJTyiM3+sm1efjR5f/UKEK+UadmSogPvjCr9WeyzIIbHNCHB5zIIT2JK
 b5YMhPGV88YR7CAQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
 id 8F61F4A04EA; Tue, 13 Aug 2024 10:11:20 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: ltp@lists.linux.it
X-Yow: If you STAY in China, I'll give you 4,000 BUSHELS of "ATOMIC MOUSE"
 pencil sharpeners!!
Date: Tue, 13 Aug 2024 10:11:20 +0200
Message-ID: <mvm7cckdeqf.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -4.20
X-Spamd-Result: default: False [-4.20 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.993]; RCVD_NO_TLS_LAST(0.10)[];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_ONE(0.00)[1]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 13 Aug 2024 10:19:42 +0200
Subject: [LTP] [PATCH] Fix landlock06 test
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

Initialize the flag variable, so that FIOASYNC does not spuriously fail
with ENOTTY (/dev/zero has no support for FASYNC).

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 testcases/kernel/syscalls/landlock/landlock06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/landlock/landlock06.c b/testcases/kernel/syscalls/landlock/landlock06.c
index 4dc1f532a..1a6e59241 100644
--- a/testcases/kernel/syscalls/landlock/landlock06.c
+++ b/testcases/kernel/syscalls/landlock/landlock06.c
@@ -28,7 +28,7 @@ static void run(void)
 	if (SAFE_FORK())
 		return;
 
-	int flag;
+	int flag = 0;
 	size_t sz = 0;
 
 	TST_EXP_PASS(ioctl(file_fd, FIONREAD, &sz));
-- 
2.46.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
