Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yApqJ2P5e2n4JgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:20:51 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D1B5DD1
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:20:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A204D3CBE37
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:20:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BAA33CB429
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 01:20:47 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CF6351A00CA3
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 01:20:46 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22AE7343E2;
 Fri, 30 Jan 2026 00:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769732445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LN4ufefkJMq7qTffEoSGXTD0KTUiaZn05puzwTAeiGk=;
 b=bWnibL36/RFOA/BJXMerEpko5sjagIio3wu7WGWCb6Y1tSb29DB6GcKUMjrogmakwPX6o1
 5aPym/uJDQa5AKF2Kpa18Swoh/Q9P2ogOIGV12exIPaWUoHYLhgeMrrluq5CRBH585YvSu
 pZRybw5b0vvj9ps3CrYhh1iWrnwcYuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769732445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LN4ufefkJMq7qTffEoSGXTD0KTUiaZn05puzwTAeiGk=;
 b=4q1y8kLAfsFbDReh7DsMhZKzVVGGxiVLXHj3fl6Wglgi29OLvlP4hdkF7CCmuoj/lrVZbC
 0Z2gXS9Lfgf7dCAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=bWnibL36;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=4q1y8kLA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769732445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LN4ufefkJMq7qTffEoSGXTD0KTUiaZn05puzwTAeiGk=;
 b=bWnibL36/RFOA/BJXMerEpko5sjagIio3wu7WGWCb6Y1tSb29DB6GcKUMjrogmakwPX6o1
 5aPym/uJDQa5AKF2Kpa18Swoh/Q9P2ogOIGV12exIPaWUoHYLhgeMrrluq5CRBH585YvSu
 pZRybw5b0vvj9ps3CrYhh1iWrnwcYuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769732445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LN4ufefkJMq7qTffEoSGXTD0KTUiaZn05puzwTAeiGk=;
 b=4q1y8kLAfsFbDReh7DsMhZKzVVGGxiVLXHj3fl6Wglgi29OLvlP4hdkF7CCmuoj/lrVZbC
 0Z2gXS9Lfgf7dCAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C91EE3EA61;
 Fri, 30 Jan 2026 00:20:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3nj0L1z5e2lddgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 30 Jan 2026 00:20:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 30 Jan 2026 01:20:41 +0100
Message-ID: <20260130002041.124571-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/1] pidns: ioctl: unshare05: Require kconfig
 CONFIG_PID_NS
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
Cc: Terry Tritton <terry.tritton@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 4A4D1B5DD1
X-Rspamd-Action: no action

CLONE_NEWPID flag require kconfig CONFIG_PID_NS. Followup to 6aa4d0e08f.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Probably after the release.

I'm not sure about these 3, probably they also require it:
testcases/kernel/syscalls/clone/clone11.c
testcases/kernel/syscalls/clone3/clone301.c
testcases/kernel/syscalls/clone3/clone304.c

This one checks for "/proc/self/ns/pid", but it would not harm to add
kconfig as well
testcases/kernel/syscalls/ioctl/ioctl_ns01.c

NOTE: I haven't checked CONFIG_USER_NS.

 testcases/kernel/containers/pidns/pidns04.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns05.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns06.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns10.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns13.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns16.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns17.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns30.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns31.c   | 4 ++++
 testcases/kernel/containers/pidns/pidns32.c   | 4 ++++
 testcases/kernel/syscalls/ioctl/ioctl_ns05.c  | 4 ++++
 testcases/kernel/syscalls/unshare/unshare05.c | 4 ++++
 12 files changed, 48 insertions(+)

diff --git a/testcases/kernel/containers/pidns/pidns04.c b/testcases/kernel/containers/pidns/pidns04.c
index ff106780ad..1594cfc5b3 100644
--- a/testcases/kernel/containers/pidns/pidns04.c
+++ b/testcases/kernel/containers/pidns/pidns04.c
@@ -49,4 +49,8 @@ static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns05.c b/testcases/kernel/containers/pidns/pidns05.c
index b1666f233a..4b0478c84c 100644
--- a/testcases/kernel/containers/pidns/pidns05.c
+++ b/testcases/kernel/containers/pidns/pidns05.c
@@ -116,4 +116,8 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.needs_checkpoints = 1,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns06.c b/testcases/kernel/containers/pidns/pidns06.c
index b79a5d4010..a3d289b0ec 100644
--- a/testcases/kernel/containers/pidns/pidns06.c
+++ b/testcases/kernel/containers/pidns/pidns06.c
@@ -43,4 +43,8 @@ static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns10.c b/testcases/kernel/containers/pidns/pidns10.c
index ab6a7a4acf..c65626fde0 100644
--- a/testcases/kernel/containers/pidns/pidns10.c
+++ b/testcases/kernel/containers/pidns/pidns10.c
@@ -42,4 +42,8 @@ static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns13.c b/testcases/kernel/containers/pidns/pidns13.c
index 1ea9f5cd33..4334a004d8 100644
--- a/testcases/kernel/containers/pidns/pidns13.c
+++ b/testcases/kernel/containers/pidns/pidns13.c
@@ -125,4 +125,8 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.needs_checkpoints = 1,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns16.c b/testcases/kernel/containers/pidns/pidns16.c
index 8867a132b5..000dc5c83d 100644
--- a/testcases/kernel/containers/pidns/pidns16.c
+++ b/testcases/kernel/containers/pidns/pidns16.c
@@ -82,4 +82,8 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.needs_checkpoints = 1,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns17.c b/testcases/kernel/containers/pidns/pidns17.c
index 3a85d96725..fb28b8adea 100644
--- a/testcases/kernel/containers/pidns/pidns17.c
+++ b/testcases/kernel/containers/pidns/pidns17.c
@@ -67,4 +67,8 @@ static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns30.c b/testcases/kernel/containers/pidns/pidns30.c
index 409b37ec18..441dd06c6c 100644
--- a/testcases/kernel/containers/pidns/pidns30.c
+++ b/testcases/kernel/containers/pidns/pidns30.c
@@ -116,4 +116,8 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_root = 1,
 	.needs_checkpoints = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns31.c b/testcases/kernel/containers/pidns/pidns31.c
index a8d737091d..32e6e2c20e 100644
--- a/testcases/kernel/containers/pidns/pidns31.c
+++ b/testcases/kernel/containers/pidns/pidns31.c
@@ -113,4 +113,8 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_root = 1,
 	.needs_checkpoints = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/containers/pidns/pidns32.c b/testcases/kernel/containers/pidns/pidns32.c
index a192c128d6..fc9bf0aaa0 100644
--- a/testcases/kernel/containers/pidns/pidns32.c
+++ b/testcases/kernel/containers/pidns/pidns32.c
@@ -67,4 +67,8 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.forks_child = 1,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
index e84af38b67..ccc21687a5 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
@@ -103,4 +103,8 @@ static struct tst_test test = {
 	.min_kver = "4.9",
 	.setup = setup,
 	.cleanup = cleanup,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 };
diff --git a/testcases/kernel/syscalls/unshare/unshare05.c b/testcases/kernel/syscalls/unshare/unshare05.c
index 3185d4d2aa..a9bd864e13 100644
--- a/testcases/kernel/syscalls/unshare/unshare05.c
+++ b/testcases/kernel/syscalls/unshare/unshare05.c
@@ -41,6 +41,10 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_root = 1,
 	.test_all = run,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_PID_NS",
+		NULL,
+	},
 	.bufs = (struct tst_buffers []) {
 		{&args, .size = sizeof(*args)},
 		{},
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
