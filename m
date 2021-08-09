Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D94413E444C
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 12:58:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 345FD3C7206
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 12:58:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8039F3C55AB
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 12:58:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D61501A004DE
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 12:58:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 341E621DEF
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628506707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3FcQIJQp6Uf0N0P/PzLJgYFv7FknBp8ETEhth+M/H3k=;
 b=BrUEwxRkdJAQR1l0UTaCwiWap0Q/XZ0CEALi996fMgA62porC2rMjsC0+w27lZZ52esYgi
 gUYtyA+PMwYACUQF2ACGM/8byxl19UHtzjnWOfH+Nf9eOjuEZtRtdcxPeFxVjREXzB5M6e
 lXSVza/eK/I3QBcYEVG8WUhbcsjHjgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628506707;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3FcQIJQp6Uf0N0P/PzLJgYFv7FknBp8ETEhth+M/H3k=;
 b=Ezygwc+ETrSswNjGMzDyWX9I3r//dT1okKDragvs4s/6ZGh8DZ/dzcbF7QDe1sFBTZEOj/
 W26dc975ee/205Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21EA613BAA
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EmooB1MKEWEFdgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 09 Aug 2021 10:58:27 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  9 Aug 2021 12:58:26 +0200
Message-Id: <20210809105826.19674-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] connectors/pec_listener: Make exit_flag volatile
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

There are two ways in which the main loop of pec_listener can stop:
- syscall gets interrupted by signal and its error handler code breaks the loop
- or exit_flag get set to 1

The exit flag is only changed in signal handler so it needs to be volatile,
otherwise the compiler will optimize it out of the main program loop. If
an incoming signal doesn't interrupt a syscall, pec_listener will get stuck
in the loop forever. It's a rare situation but it does happen once in a while.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/connectors/pec/pec_listener.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/connectors/pec/pec_listener.c b/testcases/kernel/connectors/pec/pec_listener.c
index 7844dc905..2707ea8fb 100644
--- a/testcases/kernel/connectors/pec/pec_listener.c
+++ b/testcases/kernel/connectors/pec/pec_listener.c
@@ -50,7 +50,7 @@ int main(void)
 
 static __u32 seq;
 
-static int exit_flag;
+static volatile int exit_flag;
 static struct sigaction sigint_action;
 
 struct nlmsghdr *nlhdr;
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
