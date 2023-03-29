Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D06CD1A7
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Mar 2023 07:33:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61CE33CB64F
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Mar 2023 07:33:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 289A23CA375
 for <ltp@lists.linux.it>; Wed, 29 Mar 2023 07:33:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 553D0600764
 for <ltp@lists.linux.it>; Wed, 29 Mar 2023 07:33:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6715219F3;
 Wed, 29 Mar 2023 05:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1680068005;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x84aafFomkIzBOi+phuKl2A5CZosFDu7/Pv4uSp5Rfk=;
 b=bqbMiPRlgAHmrWd+HpMwaX0/WC1DefNbk9Tm+X8ICHa7ZLohgWaaiZx2blQfIFGZ9S+WWL
 +iL88WE7DbPz/1/reZbFv/EHlnVp+ivPob4YpdZSX7hO9P50Ksz1B0CZHyoqVMk4iltpgw
 fCvMbwPKZ4JCLyW9DFIQGb1tOLsE7wM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1680068005;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x84aafFomkIzBOi+phuKl2A5CZosFDu7/Pv4uSp5Rfk=;
 b=DV6pNzdWTSTbRQTpKSYAdf+lIOVnitLYtTidon12P/rp+BrEOH7YOzCGKR716t+srIJW1Z
 hWhg63OpPhX/bVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BEC613902;
 Wed, 29 Mar 2023 05:33:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Yni/JKXNI2QVBAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 29 Mar 2023 05:33:25 +0000
Date: Wed, 29 Mar 2023 07:33:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20230329053324.GA807387@pevik>
References: <20230228124348.13164-1-andrea.cervesato@suse.com>
 <877cvl6jw9.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877cvl6jw9.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Remove ltp_clone_quick usage from pidns suite
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> >  static void run(void)
> >  {
> > -	int ret;
> > +	const struct tst_clone_args args = { CLONE_NEWNS, SIGCHLD };

> At some point CLONE_NEWNS was substituted for CLONE_NEWPID. It still
> passes because TST_EXP_PASS expects a zero return val. It should be
> TST_EXP_EXPR or similar.

Good catch. I suppose copy paste error. These were introduced during testsuite
rewrite, later Andrea fixed the docparse description in 3fc912172, but not the
actual value in tst_clone_args.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
