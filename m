Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C03E0373
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 16:39:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3E9C3C80BC
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 16:39:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D22CB3C2C99
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 16:39:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3E7DD6008C1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 16:39:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F3681FDF8;
 Wed,  4 Aug 2021 14:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628087958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YPfBuy9qNisiGh1dGFftOiigHNk8S4YXKc5FNJ2M9Fc=;
 b=HzOuKgWtizmrYYbNZyIsq3LBzVTnSAfJHYjiHAVgiwtndSYz9xembIJ27z9f1mmxJtTo54
 j5bUIbobYxthvhQtd7pLGYz7Qa2drH3TIvTX9eHzlFsJ8VY2DbJIZeK1aaDfzfyf+7VTsi
 9LD1DHLHdpg8Yf4Tb9rUXCGkd42aARA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628087958;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YPfBuy9qNisiGh1dGFftOiigHNk8S4YXKc5FNJ2M9Fc=;
 b=LXW/3czkXx5AoDuNtuu9t6vps5ksVWddPFB2Vw6L+Q1Xwc/FwzuHBmp+aUw8rPJw6pKEkH
 Z5sFjknUY5Ghc4BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CDBE13B3C;
 Wed,  4 Aug 2021 14:39:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OXP3DZamCmFNcwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 04 Aug 2021 14:39:18 +0000
Date: Wed, 4 Aug 2021 16:39:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Message-ID: <YQqmnkRd/AWgQthp@yuki>
References: <20210804093918.1087-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804093918.1087-1-bogdan.lezhepekov@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
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
Pushed with a minor change, thanks.

The inline variable definition is valid on in C99 and we still have to
support old distributions that compile LTP with GNU89 which does not
allow it. I've also changed the type to unsigned in order to avoid a
warning.

Full diff:

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
index 7856c2b8e..effd33799 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -110,10 +110,11 @@ static void setup(void)
 	pw = SAFE_GETPWNAM("nobody");
 
 	if (!hugetlbfs_supported()) {
+		unsigned int i;
 
 		tst_res(TINFO, "SHM_HUGETLB not supported by kernel");
 
-		for (int i = 0; i < ARRAY_SIZE(tcases); i++) {
+		for (i = 0; i < ARRAY_SIZE(tcases); i++) {
 			if (tcases[i].flags & SHM_HUGETLB)
 				tcases[i].exp_err = EINVAL;
 		}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
