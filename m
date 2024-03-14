Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F92C87C09C
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Mar 2024 16:47:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 275763D0132
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Mar 2024 16:47:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EEDF73CFD01
 for <ltp@lists.linux.it>; Thu, 14 Mar 2024 16:47:08 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 14BD7140135B
 for <ltp@lists.linux.it>; Thu, 14 Mar 2024 16:47:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 043701F863;
 Thu, 14 Mar 2024 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1710431226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQnSmntIQJhB4jyZ/I5JH4pj2C6fvnp2JLnG3mGG3rA=;
 b=aqiUKpBMh2WYU/Zofvr6wbXys7E8kElmZkGD/Y8rkHwUoCp92ZPBHQb2TYGaMEtiIOlseY
 lnBcHOggCcrebzuXQMr/IwqZ+W6a+/K/uStU1E88KHBLlw9efoSDLd7i3G72a3O2BAP3Fh
 ONTtRzNy9KIUNpV/LfyVCrFEu6mvnWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1710431226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQnSmntIQJhB4jyZ/I5JH4pj2C6fvnp2JLnG3mGG3rA=;
 b=JDBW6IdCwHhYbTJoD0Fr5nzWzm01Bs/lGLCT5E9WztHLnfxeqpgF6mdib7x/niU56uYV9E
 AmTWmpmPGooecVAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1710431224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQnSmntIQJhB4jyZ/I5JH4pj2C6fvnp2JLnG3mGG3rA=;
 b=GJwy7ABUUwvnOJn9XkoTStXqheoX4iNddQs+0yT5T4qx3yCL7p9rzTgam+a/da8lr2P6o4
 2RFXgv43LVyr73W9ygdBcWS+vTvtqDpRb5ZRhSw4hgEZr9sH3b5yZTIrBQYd4/bmvW9nlr
 +pZV2EQFqlZz6/Xdbq0qL36HifrrK/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1710431224;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CQnSmntIQJhB4jyZ/I5JH4pj2C6fvnp2JLnG3mGG3rA=;
 b=EZTw7rEqjGJ09lG2yEOEjbJqzHG8OONT/5pHSlY8zpjq/xRfgKZvarWePoFLoLlt3clIgQ
 VigTgr9hMi+ngiDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2DFA1368B;
 Thu, 14 Mar 2024 15:47:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VpMYNvcb82X0MAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 14 Mar 2024 15:47:03 +0000
Date: Thu, 14 Mar 2024 16:46:06 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <ZfMbvls8C3Sx2cWC@yuki>
References: <20240308023312.25449-1-wegao@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240308023312.25449-1-wegao@suse.com>
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=GJwy7ABU;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=EZTw7rEq
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.28 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]; RCPT_COUNT_TWO(0.00)[2];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,suse.com:url];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.27)[74.09%]
X-Spam-Score: -1.28
X-Rspamd-Queue-Id: 043701F863
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] memcontrol03: Using clean page cache to avoid
 dependency on IO rate
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Bad IO situation(storage bandwidth ~10MB/sec) will lead background
> writeback has uncertain progress for dirty page. So system can not
> reclaim enough memory for new process and finally lead a unexpected
> OOM.
> 
> memcontrol03.c:218: TPASS: Expect: (A/B/E memory.current=0) ~= 0
> memcontrol03.c:116: TPASS: Child 1918 killed by OOM
> memcontrol03.c:224: TPASS: Expect: (A/B memory.current=52588544) ~= 52428800
> memcontrol03.c:129: TFAIL: Expected child 1944 to exit(0), but instead killed by SIGKILL

So I've read the corresponding bug:

https://bugzilla.suse.com/show_bug.cgi?id=1218178

And now I understand what this is supposed to fix. Hover doing sync() is
a too big hammer, there is no need to sync the whole system, we just
need to make sure that the pages from the file we wrote into are written
to a pernament storage, so we likely just need:

diff --git a/testcases/kernel/controllers/memcg/memcontrol03.c b/testcases/kernel/controllers/memcg/memcontrol03.c
index e927dfd19..6d9c490b5 100644
--- a/testcases/kernel/controllers/memcg/memcontrol03.c
+++ b/testcases/kernel/controllers/memcg/memcontrol03.c
@@ -144,6 +144,7 @@ static void alloc_pagecache_in_child(const struct tst_cg_group *const cg,
        tst_res(TINFO, "Child %d in %s: Allocating pagecache: %"PRIdPTR,
                getpid(), tst_cg_group_name(cg), size);
        alloc_pagecache(fd, size);
+       SAFE_FSYNC(fd);

        TST_CHECKPOINT_WAKE(CHILD_IDLE);
        TST_CHECKPOINT_WAIT(TEST_DONE);

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
