Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 730528D82AB
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2024 14:46:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 276973D08E1
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2024 14:46:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B99763D01A2
 for <ltp@lists.linux.it>; Mon,  3 Jun 2024 14:46:55 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=akumar@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 191EF10000C0
 for <ltp@lists.linux.it>; Mon,  3 Jun 2024 14:46:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 07EB62225E
 for <ltp@lists.linux.it>; Mon,  3 Jun 2024 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717418814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W63OK0B6rgNHQ2YSwl4vgoIn/RUsxxJNoh6qHeo+0K8=;
 b=yvCidqON3+kZfiiJJ0F/C4ASdZa2a6+xsJJSnY5nhuy1PddAl5caZufHLzvpjOBnn5RgaW
 OvkLSYh+SwbAEzqoKD2WnGpYrYfAYR+8+HeST8lRbotlLzRbNNIhna33aDeu1pPkxqdVln
 eMNRFe7nl3Hr3ziCSzyVFJLpTxQ2bZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717418814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W63OK0B6rgNHQ2YSwl4vgoIn/RUsxxJNoh6qHeo+0K8=;
 b=xC+nRkSTSEPU9oBDpQ3l6oDcM4wAj+XJlsUZp8ZbzTMuy9zj1A1T8yrhA0th3MuvSHtF8Y
 UtVarCPV6hKMimDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717418814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W63OK0B6rgNHQ2YSwl4vgoIn/RUsxxJNoh6qHeo+0K8=;
 b=yvCidqON3+kZfiiJJ0F/C4ASdZa2a6+xsJJSnY5nhuy1PddAl5caZufHLzvpjOBnn5RgaW
 OvkLSYh+SwbAEzqoKD2WnGpYrYfAYR+8+HeST8lRbotlLzRbNNIhna33aDeu1pPkxqdVln
 eMNRFe7nl3Hr3ziCSzyVFJLpTxQ2bZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717418814;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W63OK0B6rgNHQ2YSwl4vgoIn/RUsxxJNoh6qHeo+0K8=;
 b=xC+nRkSTSEPU9oBDpQ3l6oDcM4wAj+XJlsUZp8ZbzTMuy9zj1A1T8yrhA0th3MuvSHtF8Y
 UtVarCPV6hKMimDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F083813AB5
 for <ltp@lists.linux.it>; Mon,  3 Jun 2024 12:46:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5KqFOj27XWZWQgAAD6G6ig
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Mon, 03 Jun 2024 12:46:53 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Mon,  3 Jun 2024 14:46:52 +0200
Message-ID: <20240603124653.31967-1-akumar@suse.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <CAJCsO8fTwOsVwhCdBksStaPVjXHBi8m3g+_b-ZAnKByUR3cqyA@mail.gmail.com>
References: <CAJCsO8fTwOsVwhCdBksStaPVjXHBi8m3g+_b-ZAnKByUR3cqyA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_ONE(0.00)[1];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] unlink09: Fix open syscall flags
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

In the SAFE_OPEN() calls, we missed to include any of the mandatory
flags for open syscall:  O_RDONLY,  O_WRONLY,  or  O_RDWR

Fixes: 2cf78f47a6 (unlink: Add error tests for EPERM and EROFS)
Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/unlink/unlink09.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/unlink/unlink09.c b/testcases/kernel/syscalls/unlink/unlink09.c
index cc4b4a07e..405deb05f 100644
--- a/testcases/kernel/syscalls/unlink/unlink09.c
+++ b/testcases/kernel/syscalls/unlink/unlink09.c
@@ -43,12 +43,12 @@ static void setup(void)
 {
 	int attr;
 
-	fd_immutable = SAFE_OPEN(TEST_EPERM_IMMUTABLE, O_CREAT, 0600);
+	fd_immutable = SAFE_OPEN(TEST_EPERM_IMMUTABLE, O_RDWR | O_CREAT, 0600);
 	SAFE_IOCTL(fd_immutable, FS_IOC_GETFLAGS, &attr);
 	attr |= FS_IMMUTABLE_FL;
 	SAFE_IOCTL(fd_immutable, FS_IOC_SETFLAGS, &attr);
 
-	fd_append_only = SAFE_OPEN(TEST_EPERM_APPEND_ONLY, O_CREAT, 0600);
+	fd_append_only = SAFE_OPEN(TEST_EPERM_APPEND_ONLY, O_RDWR | O_CREAT, 0600);
 	SAFE_IOCTL(fd_append_only, FS_IOC_GETFLAGS, &attr);
 	attr |= FS_APPEND_FL;
 	SAFE_IOCTL(fd_append_only, FS_IOC_SETFLAGS, &attr);
@@ -79,7 +79,7 @@ static void verify_unlink(unsigned int i)
 	/* If unlink() succeeded unexpectedly, test file should be restored. */
 	if (!TST_RET) {
 		if (tc->fd) {
-			*(tc->fd) = SAFE_OPEN(tc->filename, O_CREAT, 0600);
+			*(tc->fd) = SAFE_OPEN(tc->filename, O_RDWR | O_CREAT, 0600);
 			if (tc->flag) {
 				SAFE_IOCTL(*(tc->fd), FS_IOC_GETFLAGS, &attr);
 				attr |= tc->flag;
-- 
2.45.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
