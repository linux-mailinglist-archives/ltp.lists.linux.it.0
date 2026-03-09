Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHujIc6krmkFHQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 11:45:34 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A17F2374BD
	for <lists+linux-ltp@lfdr.de>; Mon, 09 Mar 2026 11:45:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95CF03DD6B7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2026 11:45:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E69E3C9D7D
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 11:45:13 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1EC4A600807
 for <ltp@lists.linux.it>; Mon,  9 Mar 2026 11:45:12 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C021C4D226;
 Mon,  9 Mar 2026 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773053111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7rMo+rieoy8wq5h/Fn1DBKuyDuH9I0yunZLPnXuGQXE=;
 b=1UEzVGRbjKZcJtH/xYbC7EPMuS2eyJnz2WSrBBhjF7+bYB0ow0XlxMVM0fxBT9/0S8xfLU
 qMyTFrt/Q3TcDEQGkENJl/NHoRItGvgt/CUH51qiUSsDgt8DcmzTWfmeXwxzfGAkdyvGGN
 m90fO3W5oaR5r4K/jD6v2jDrdiapOGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773053111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7rMo+rieoy8wq5h/Fn1DBKuyDuH9I0yunZLPnXuGQXE=;
 b=NBewOtEvcC13P0uMuGUBIjgg9F0OYz8AJlzDzqUBRkmUGk5SOnlX8H1LDWJlFgzi23DHo8
 af44XGA8xE9cFHAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1773053111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7rMo+rieoy8wq5h/Fn1DBKuyDuH9I0yunZLPnXuGQXE=;
 b=1UEzVGRbjKZcJtH/xYbC7EPMuS2eyJnz2WSrBBhjF7+bYB0ow0XlxMVM0fxBT9/0S8xfLU
 qMyTFrt/Q3TcDEQGkENJl/NHoRItGvgt/CUH51qiUSsDgt8DcmzTWfmeXwxzfGAkdyvGGN
 m90fO3W5oaR5r4K/jD6v2jDrdiapOGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1773053111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7rMo+rieoy8wq5h/Fn1DBKuyDuH9I0yunZLPnXuGQXE=;
 b=NBewOtEvcC13P0uMuGUBIjgg9F0OYz8AJlzDzqUBRkmUGk5SOnlX8H1LDWJlFgzi23DHo8
 af44XGA8xE9cFHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 966833EE65;
 Mon,  9 Mar 2026 10:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SNMHI7ekrmlcTQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Mon, 09 Mar 2026 10:45:11 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Mon, 09 Mar 2026 11:45:09 +0100
Message-Id: <20260309-fork_refactoring-v3-0-8a645d7e00db@suse.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALWkrmkC/22N2wrCMAxAf2Xk2UpvtNMn/0NEtppuQVyl1aKM/
 bvdQBT08SQ5JyMkjIQJttUIETMlCkMBtarA9c3QIaNTYZBcGi6kYT7E8zGib9wtRBo6VnNjfa2
 1r1sDRbuWJT2W5P5QuKdULp/Lhyzm6Ttmf2NZMM5QoRTei0Z7u0v3hGsXLjC3svz4ius/viw+F
 8Zp6za8deLLn6bpBT/rdAbvAAAA
X-Change-ID: 20260126-fork_refactoring-8067f844f8b6
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773053111; l=1254;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=erIxUISo9IpokWabu/KNSmAShOks950ActDZYnVOVzc=;
 b=022rqaksTNpFd3X1OtxMtDvaMfgPV4UITcE0Ylq2X7eYYL2zi/+5f/LESXj/QmeoBUq/v6Ve2
 vQjr/bd1ZN/DHugX+MwgMKs7yYRE3T+3kTg1apUB72tuzOmfamcIPfS
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 0/3] Refactor tests which are verifying fork/vfork
 functionalities
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
X-Rspamd-Queue-Id: 0A17F2374BD
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
	NEURAL_SPAM(0.00)[0.175];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	TAGGED_RCPT(0.00)[linux-ltp];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Action: no action

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Changes in v3:
- fix fork09 not following the original idea
- don't check for NULL when free()
- Link to v2: https://lore.kernel.org/r/20260304-fork_refactoring-v2-0-016c47c90bc1@suse.com

Changes in v2:
- _exit(0) to avoid undefind behavior after fork/vfork
- finished uncompleted vfork02
- release getcwd() memory
- use SAFE_MALLOC() instead of SAFE_MMAP() to share between parent and
  child
- missing fork_child in vfork01
- fix missing copyright
- Link to v1: https://lore.kernel.org/r/20260127-fork_refactoring-v1-0-e3e21ff1a4f7@suse.com

---
Andrea Cervesato (3):
      syscalls: refactor fork09 using new API
      syscalls: refactor vfork01 using new API
      syscalls: refactor vfork02 using new API

 testcases/kernel/syscalls/fork/fork09.c   | 221 ++++++------------
 testcases/kernel/syscalls/vfork/vfork01.c | 374 ++++--------------------------
 testcases/kernel/syscalls/vfork/vfork02.c | 248 ++++----------------
 3 files changed, 170 insertions(+), 673 deletions(-)
---
base-commit: e434de62b487441bcd3d6d6fb763ba58ca9e5eef
change-id: 20260126-fork_refactoring-8067f844f8b6

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
