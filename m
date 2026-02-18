Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DrdEIbClWmBUgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:45:42 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D8156CED
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:45:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88E043D0679
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Feb 2026 14:45:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A7F9F3C58A2
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 14:45:39 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0BC10600202
 for <ltp@lists.linux.it>; Wed, 18 Feb 2026 14:45:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B4D715BD14;
 Wed, 18 Feb 2026 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771422337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ka6jD2JLnxHQ/9QHyeOsc5q+101jD2g3+vB0Y3tMy6w=;
 b=dN2+kQzj+yl6T89XGHxC17X9waVEnHb/EiabB6klQKkSwifKxSvVMCGQcbQKgOU5HTnOSt
 q3YjFMsVBrIJxL+HH7Rw3fKAAKFSE2bF2lZpCsKUw9PPJIgkauHmkaWn0wxDMFNPCRoHMJ
 bKqupahnvANRYCf3P0G5n6FSwMQM+As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771422337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ka6jD2JLnxHQ/9QHyeOsc5q+101jD2g3+vB0Y3tMy6w=;
 b=JUSIdU4AsCBxAI0TRGLjEtT3JGBeE2dbR67eIi395K4LDKvJEizHRUF/bYKgbo+pq471k6
 0pxSEeFQeAFA+oBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dN2+kQzj;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JUSIdU4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771422337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ka6jD2JLnxHQ/9QHyeOsc5q+101jD2g3+vB0Y3tMy6w=;
 b=dN2+kQzj+yl6T89XGHxC17X9waVEnHb/EiabB6klQKkSwifKxSvVMCGQcbQKgOU5HTnOSt
 q3YjFMsVBrIJxL+HH7Rw3fKAAKFSE2bF2lZpCsKUw9PPJIgkauHmkaWn0wxDMFNPCRoHMJ
 bKqupahnvANRYCf3P0G5n6FSwMQM+As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771422337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ka6jD2JLnxHQ/9QHyeOsc5q+101jD2g3+vB0Y3tMy6w=;
 b=JUSIdU4AsCBxAI0TRGLjEtT3JGBeE2dbR67eIi395K4LDKvJEizHRUF/bYKgbo+pq471k6
 0pxSEeFQeAFA+oBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E2013EA65;
 Wed, 18 Feb 2026 13:45:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sEP9IIHClWkRbgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 18 Feb 2026 13:45:37 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 18 Feb 2026 14:45:36 +0100
MIME-Version: 1.0
Message-Id: <20260218-kirk_remove_minus_u-v1-1-83499b7254fb@suse.com>
X-B4-Tracking: v=1; b=H4sIAH/ClWkC/x3M2wpAQBRG4VfRvjY1RoRXkSaHHzsZ2tNIybubX
 H4Xaz3kIQxPTfKQ4GLPh4vI0oTGtXcLFE/RZLQptckqtbFsVrAfF+zOLngblEExoC9q6HymWJ6
 Cme//2nbv+wHjTW9/ZQAAAA==
X-Change-ID: 20260218-kirk_remove_minus_u-2e5bea59e03f
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771422337; l=910;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=IJFguHD805J6jrZ9Uy48Qv5k9FwENPkh0M1jxSzH+aU=;
 b=NnTQMu5jIz/dfmCEX2QClWpIoeKLm+dpkA4Uus+A67of3yyNtbmmTRlt00MdTQ7v7c18gSvsG
 w1GcptKQF77AIqQGpJA7YMNTItUk8LMafxq4NH1IEXa/lmmcR5Jh5h/
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] doc: remove -U option from kirk execution
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-ltp];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.com:mid,suse.com:email];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Queue-Id: E08D8156CED
X-Rspamd-Action: no action

From: Andrea Cervesato <andrea.cervesato@suse.com>

The -U/--framework option has been removed in the version 3.2

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
Link: https://github.com/linux-test-project/kirk/commit/730eaf8fbc29bc00dd5a0048446ba8b8cbc108d2
---
 doc/users/quick_start.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/users/quick_start.rst b/doc/users/quick_start.rst
index e73175e3384a0d50edc36ffe68fc77f14696332b..cf1c9ef25cc86cf0e03d7cba04d456d7d2d4f549 100644
--- a/doc/users/quick_start.rst
+++ b/doc/users/quick_start.rst
@@ -87,7 +87,7 @@ To run all the test suites
    $ cd /opt/ltp
 
    $ # run syscalls testing suite
-   $ ./kirk -U ltp -f syscalls
+   $ ./kirk -f syscalls
 
 .. note::
 

---
base-commit: edda9a8c6af37e92587de477a5ac9c67b55ec6f8
change-id: 20260218-kirk_remove_minus_u-2e5bea59e03f

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
