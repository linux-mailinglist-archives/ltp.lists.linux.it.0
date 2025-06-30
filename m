Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E32AEDC1E
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Jun 2025 13:57:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A8A03C54CA
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Jun 2025 13:57:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C4E6C3C58A7
 for <ltp@lists.linux.it>; Mon, 30 Jun 2025 13:56:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 252C860029B
 for <ltp@lists.linux.it>; Mon, 30 Jun 2025 13:56:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DC7691F397;
 Mon, 30 Jun 2025 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751284595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8yDInkcfvILggJYiNTvgzosrT0NPvJ1ma/hn7Fd7wk=;
 b=y7OSsCpnPYZ/jqRos9/OP4wi94ONcj9lT6oPcAPx9UabuN7sVd7zIcLsdXsIdZbK9GOwMA
 tkWiZCJLofj6yEVqgmMqRQOEN3TJSxfYpiGF/ipsoYi64HnuYegWSS/ULSTw2onBP3BGmd
 VkPmunC+VCinfgobe8uoantFhfvu3CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751284595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8yDInkcfvILggJYiNTvgzosrT0NPvJ1ma/hn7Fd7wk=;
 b=4GgJy/lRRgrUOX2KD4G9IMR/LTAZwcxLHb4+SfirqFB/uSTbQMsUBfrHsZrgZQaipyPWIW
 fYEaabFiht03ZgDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y7OSsCpn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="4GgJy/lR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751284595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8yDInkcfvILggJYiNTvgzosrT0NPvJ1ma/hn7Fd7wk=;
 b=y7OSsCpnPYZ/jqRos9/OP4wi94ONcj9lT6oPcAPx9UabuN7sVd7zIcLsdXsIdZbK9GOwMA
 tkWiZCJLofj6yEVqgmMqRQOEN3TJSxfYpiGF/ipsoYi64HnuYegWSS/ULSTw2onBP3BGmd
 VkPmunC+VCinfgobe8uoantFhfvu3CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751284595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8yDInkcfvILggJYiNTvgzosrT0NPvJ1ma/hn7Fd7wk=;
 b=4GgJy/lRRgrUOX2KD4G9IMR/LTAZwcxLHb4+SfirqFB/uSTbQMsUBfrHsZrgZQaipyPWIW
 fYEaabFiht03ZgDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B34B913A24;
 Mon, 30 Jun 2025 11:56:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mDT/KXN7YmiTQAAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Mon, 30 Jun 2025 11:56:35 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Mon, 30 Jun 2025 13:56:34 +0200
MIME-Version: 1.0
Message-Id: <20250630-clock_nanosleep05-v2-1-15522d5551c6@suse.com>
References: <20250630-clock_nanosleep05-v2-0-15522d5551c6@suse.com>
In-Reply-To: <20250630-clock_nanosleep05-v2-0-15522d5551c6@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751284595; l=1623;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=9H8L/4DsYv4zA6S2LtKpul9lRZIlKQZTAF6QB1uFBuQ=;
 b=ag5Rjglh5AutSowwVCHnEJ07t5Mt3+bQCf3oPxb4GX6yQbllPbeptJHFKO4uULn70MaXphn0b
 6jq78YhuB+LDlVjxeAmhu03yVm6t4UESQHAwL65sw+q5fF/sO3/fudP
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: DC7691F397
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/2] Add SAFE_CLOCK_NANOSLEEP macro utility
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/tst_safe_clocks.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/tst_safe_clocks.h b/include/tst_safe_clocks.h
index 5661ce57bf7c7b2b0eb3ada9d01049abdd99dab0..5b0e8c5b8c2baad9b41e7f3bf56274d94ebddc7e 100644
--- a/include/tst_safe_clocks.h
+++ b/include/tst_safe_clocks.h
@@ -73,6 +73,26 @@ static inline int safe_clock_settime(const char *file, const int lineno,
 	return rval;
 }
 
+static inline int safe_clock_nanosleep(const char *file, const int lineno,
+	clockid_t clockid, int flags, const struct timespec *ts,
+	struct timespec *remain)
+{
+	int ret;
+
+	errno = 0;
+	ret = clock_nanosleep(clockid, flags, ts, remain);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"clock_nanosleep() failed");
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid clock_nanosleep() return value %d", ret);
+	}
+
+	return ret;
+}
+
 static inline int safe_timer_create(const char *file, const int lineno,
 	clockid_t clockid, struct sigevent *sevp, timer_t *timerid)
 {
@@ -159,6 +179,9 @@ static inline int safe_timer_delete(const char *file, const int lineno,
 #define SAFE_CLOCK_SETTIME(clk_id, tp)\
 	safe_clock_settime(__FILE__, __LINE__, (clk_id), (tp))
 
+#define SAFE_CLOCK_NANOSLEEP(clockid, flags, ts, remain)\
+	safe_clock_nanosleep(__FILE__, __LINE__, clockid, flags, ts, remain)
+
 #define SAFE_TIMER_CREATE(clockid, sevp, timerid)\
 	safe_timer_create(__FILE__, __LINE__, (clockid), (sevp), (timerid))
 

-- 
2.50.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
