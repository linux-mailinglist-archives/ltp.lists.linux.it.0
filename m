Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDF2BbGfc2muxgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:20:01 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBD78610
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:20:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6800E3CB8AA
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:20:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C81333CB844
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 17:19:02 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 00D341A0064C
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 17:19:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 120FC5BCCF;
 Fri, 23 Jan 2026 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769185134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=amTQxDqZphZCvxHwaSsQb0+sZxltdYLJwuFf0ArPuXQ=;
 b=dh1r06qyIeWWM0khDxOuFuC1uQbpMPfJu4xsOBBCv2Oxpj3MOik91/9DzhD5JONrbvUFEG
 VeZ3EQxT1uyKRWryrCWRLnLSfs3jenZHIuK9GYiKEXzX/Nh0+LzkDDZ4dAEyLEUkI2O1jt
 kkJ32wcepft4n0Y/4b3ws6H7Nh7mL6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769185134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=amTQxDqZphZCvxHwaSsQb0+sZxltdYLJwuFf0ArPuXQ=;
 b=nQrRVcdVIFvlJ1H3g7L8Zl08KlWKOS/fYsquHUk34eGuroW2To4xDHg/YRnkHBqIfRaBvh
 4kCKNzVmPWShtYBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="SUnb/+Vo";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ex9X08Kt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769185133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=amTQxDqZphZCvxHwaSsQb0+sZxltdYLJwuFf0ArPuXQ=;
 b=SUnb/+VoXk3s1Cn8h2U8bzSD06t98lUtJxx97nOeNRj7gAoebD97+YfFwBUW9EwNIthzDC
 XgXcAMzBOqO3OtoOn815db4xi8pjSgeNsm7PVCDBeKFYW6h+MHjZ9SAw+3WjJHTVM91KNL
 /pt0IfXrOG5AEch3YY76iYvDqwhkdi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769185133;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=amTQxDqZphZCvxHwaSsQb0+sZxltdYLJwuFf0ArPuXQ=;
 b=Ex9X08Kt7ko8orqZpOgAEUQGDj9oO/0lJVLos72aJJPK37roL68/tN+j8lV44tPBZppCbf
 w4zwFB0nn/fTXYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF0161395E;
 Fri, 23 Jan 2026 16:18:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id szfaNGyfc2n1GQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 23 Jan 2026 16:18:52 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Fri, 23 Jan 2026 17:18:50 +0100
Message-Id: <20260123-stream_refactoring-v1-0-281b85f6ab02@suse.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGqfc2kC/x2MWwqAIBAArxL7nWDSg7pKRGy52X5ksUoE0t2TP
 odhJkEgYQowFAmEbg58+gxVWcC6o3ek2GYGo02rK6NViEJ4zEIbrvEU9k7VS4Mt9Vaj7SCHV5b
 8/NNxet8P329ZcmQAAAA=
X-Change-ID: 20260120-stream_refactoring-4b5a6e9d0ad7
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769185132; l=1383;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=CieqHjO/Ju79eOTgx9S/90uD7fTkGZGIHJ/GqAQqNcA=;
 b=Dj3WBCKRWoeUewXayD49HCrGTRIJC8lF6fjIYXaNeRJk8kjYfdkf8aWjH1krvlRMlphLk6Nhj
 ieEuuzPLoPtAlTtd1EbLonk03534/pzpp/2D7tYOxtZ+GgE5zBHuRvG
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/6] Rewrite fs stream testing suite
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
	RCPT_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-0.542];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.com:mid,suse.com:email,picard.linux.it:helo,picard.linux.it:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	TAGGED_RCPT(0.00)[linux-ltp];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Queue-Id: B2BBD78610
X-Rspamd-Action: no action

All tests are now using the new LTP API. The stream05 has been deleted
because I think it was a bit messy and it didn't have a proper testing
focus. I replaced it with a new test that is just verifying that fd
returned by `fileno()` can be used for basic operations on fd.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Andrea Cervesato (6):
      Add safe macros for stream testing suite
      fs: rewrite stream01 test using new API
      fs: rewrite stream02 test using new API
      fs: rewrite stream03 test using new API
      fs: rewrite stream04 test using new API
      fs: rewrite stream05 test using new API

 include/safe_stdio_fn.h               |  18 ++
 include/tst_safe_stdio.h              |  18 ++
 lib/safe_stdio.c                      |  87 +++++++++
 testcases/kernel/fs/stream/stream01.c | 153 +++++-----------
 testcases/kernel/fs/stream/stream02.c | 133 +++-----------
 testcases/kernel/fs/stream/stream03.c | 326 ++++++----------------------------
 testcases/kernel/fs/stream/stream04.c | 147 +++++----------
 testcases/kernel/fs/stream/stream05.c | 256 +++++---------------------
 8 files changed, 332 insertions(+), 806 deletions(-)
---
base-commit: c47ab95d5fe077133e598ac7762387450a87cb2b
change-id: 20260120-stream_refactoring-4b5a6e9d0ad7

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
