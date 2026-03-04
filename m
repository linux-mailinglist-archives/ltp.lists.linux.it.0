Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPjALPAyqGm+pQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 14:26:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D8C2005DA
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 14:26:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A05B3DB96E
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 14:26:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AED2B3C61C5
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:25:55 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0E5671000A0B
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:25:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 505E25BDF8;
 Wed,  4 Mar 2026 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772630754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivDTVPejXN3q0dzLBe/9H6e6BXhyxDnXRhYfXV2nMgk=;
 b=mb83tk6dqc6clR12MiJLPQ/1as6nmET0El+pJuequ7oBZnvdHg76uMtShaFTiKjIdl4low
 VXSWK4gdCVvomtUYQe6hLInSJhZZo0JBDJ5OJMI9d4tBg446NWhfmkWHS1wpvQkWywOGQ9
 CDPog5C5EG46Nb/ra6VIydI1kZSASF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772630754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivDTVPejXN3q0dzLBe/9H6e6BXhyxDnXRhYfXV2nMgk=;
 b=sw34ZHkCJRoIjtTE3//jQtxdsSMWibz2gol/xRfzuS8KqwaMIvU6cSMfvTjW94jxRXmERp
 +qeZHqc1VfKLwJAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mb83tk6d;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sw34ZHkC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772630754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivDTVPejXN3q0dzLBe/9H6e6BXhyxDnXRhYfXV2nMgk=;
 b=mb83tk6dqc6clR12MiJLPQ/1as6nmET0El+pJuequ7oBZnvdHg76uMtShaFTiKjIdl4low
 VXSWK4gdCVvomtUYQe6hLInSJhZZo0JBDJ5OJMI9d4tBg446NWhfmkWHS1wpvQkWywOGQ9
 CDPog5C5EG46Nb/ra6VIydI1kZSASF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772630754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivDTVPejXN3q0dzLBe/9H6e6BXhyxDnXRhYfXV2nMgk=;
 b=sw34ZHkCJRoIjtTE3//jQtxdsSMWibz2gol/xRfzuS8KqwaMIvU6cSMfvTjW94jxRXmERp
 +qeZHqc1VfKLwJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 271A43EA69;
 Wed,  4 Mar 2026 13:25:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KEh1B+IyqGlBTgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 04 Mar 2026 13:25:54 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 04 Mar 2026 14:25:38 +0100
Message-Id: <20260304-stream_refactoring-v2-0-3e48ada8ff1a@suse.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANIyqGkC/22NQQ7CIBBFr9LMWgygxerKe5jGUJi2sygYphJN0
 7uLTdy5fH/+f7MAYyJkuFQLJMzEFEMBvavAjTYMKMgXBi21kUpLwXNCO90T9tbNMVEYxLGrrcG
 zl9afoAwf5UivTXprC4/EpfnefmT1TX+6wz9dVkIK3aiuqXtjO6mv/GTcuzhBu67rB/EI1JmzA
 AAA
X-Change-ID: 20260120-stream_refactoring-4b5a6e9d0ad7
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772630754; l=1779;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=OZYo5YdFVywImlmRJfrs8cgLn+G8AVyapjxcf8/r/p0=;
 b=6M+E+oQVzL6I5p1zf0t3NUoDnuMN1iHJ4QblCO6/SagZBzeWmazBC7v2L4lWySrg0BX3vxKDu
 5i6qSPWp6XgApBXRLYkcwmvOlgBmKDD9qtRHJmhQDlfezpyyj5+pCjQ
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 0/6] Rewrite fs stream testing suite
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
X-Rspamd-Queue-Id: 55D8C2005DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	NEURAL_SPAM(0.00)[0.090];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:rdns,picard.linux.it:helo,suse.com:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	TAGGED_RCPT(0.00)[linux-ltp];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Action: no action

All tests are now using the new LTP API. The stream05 has been deleted
because I think it was a bit messy and it didn't have a proper testing
focus. I replaced it with a new test that is just verifying that fd
returned by `fileno()` can be used for basic operations on fd.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Changes in v2:
- add SAFE_FFLUSH() macro
- remove cleanup_fn from SAFE_* macros
- stream01: use a double buffer to write data inside file
- stream02: check if stream is NULL after fopen()
- stream05: use SAFE_FFLUSH()
- stream05: don't overengineer SAFE_FILENO() with TST_EXP_FD()
- Link to v1: https://lore.kernel.org/r/20260123-stream_refactoring-v1-0-281b85f6ab02@suse.com

---
Andrea Cervesato (6):
      Add safe macros for stream testing suite
      fs: rewrite stream01 test using new API
      fs: rewrite stream02 test using new API
      fs: rewrite stream03 test using new API
      fs: rewrite stream04 test using new API
      fs: rewrite stream05 test using new API

 include/safe_stdio_fn.h               |  21 +++
 include/tst_safe_stdio.h              |  21 +++
 lib/safe_stdio.c                      | 101 +++++++++++
 testcases/kernel/fs/stream/stream01.c | 155 +++++-----------
 testcases/kernel/fs/stream/stream02.c | 136 ++++----------
 testcases/kernel/fs/stream/stream03.c | 326 ++++++----------------------------
 testcases/kernel/fs/stream/stream04.c | 147 +++++----------
 testcases/kernel/fs/stream/stream05.c | 258 +++++----------------------
 8 files changed, 362 insertions(+), 803 deletions(-)
---
base-commit: 23ea0f0f8064f68bbf4d5c5f4f037ef18a5848d8
change-id: 20260120-stream_refactoring-4b5a6e9d0ad7

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
