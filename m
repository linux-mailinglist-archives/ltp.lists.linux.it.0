Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5D07CC1DD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Oct 2023 13:35:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72A513CD1A1
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Oct 2023 13:35:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9CAD13CD106
 for <ltp@lists.linux.it>; Tue, 17 Oct 2023 13:35:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B5729600761
 for <ltp@lists.linux.it>; Tue, 17 Oct 2023 13:35:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67E1721CA7;
 Tue, 17 Oct 2023 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1697542511;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QMg4jhhKbDe2hOCUdxGa8eDTGsQ7glljYqQAU2SvCrk=;
 b=XHGfMmOwujpANlhT6gTjRQJyyIdj/lUZHpOKbGkHy7mIcTqvlHTSm2ZUf1mLOBkGh+pGAu
 ZoYFUWikWjEJzVNDBNuwwa8pXhjvtAI7zEBtcSIG/Xe2wnOgfigCnyCSYDCRLKvSX0H+zU
 O/QaldwWi6cgW3qbMk3FUSdQW2nPIvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1697542511;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QMg4jhhKbDe2hOCUdxGa8eDTGsQ7glljYqQAU2SvCrk=;
 b=A9cyiboxFyJ531L47708Ax111MytCbu0FCA8b/AxHKv3bE+D21FxTTMoDhQLSkuP1w4Vxn
 o+KBTEd+CjdNzdAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AAFC13584;
 Tue, 17 Oct 2023 11:35:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ajUPDW9xLmV+NQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 17 Oct 2023 11:35:11 +0000
Date: Tue, 17 Oct 2023 13:35:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20231017113509.GA931108@pevik>
References: <20230908141414.28359-1-andrea.cervesato@suse.de>
 <20230908141414.28359-3-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908141414.28359-3-andrea.cervesato@suse.de>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.03
X-Spamd-Result: default: False [-4.03 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.73)[83.74%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Refactor getegid02 using new LTP API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

This code is based on Cyril's suggestion in v1 [1]
	if (GID_SIZE_CHECK(st_egid))
		TST_EXP_EQ_LI(gid, st_egid);
	else
		tst_res(TPASS, "getegid() passed");

I wonder which system returns 16 bit gid?

man getgid(2) says that originally there was only 16 bit, than kernel 2.4 added
support for 32 bit and the glibc getegid() wrapper transparently deal with this.

Because even I compile as 32 bit:

$ file getegid01_16
getegid01_16: ELF 32-bit LSB pie executable, Intel 80386

I get comparison, thus 32 bit:
$ ./getegid01_16
...
getegid01.c:25: TPASS: gid == st_egid (1000)

What am I missing?

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/ZPCWWXXHG-oEB5qO@yuki/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
