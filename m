Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C743FED29
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:51:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9D2E3C9956
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:51:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F19343C29D1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:50:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E1E4260085F
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:50:56 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 21B6C225FB;
 Thu,  2 Sep 2021 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630583456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cCzkzEy42tfQe+xaPAhX//Wxbg4yQWODycC2oth+nzk=;
 b=iFjJ1HHi1bXraDL3+hyJZGnlGRtl1NFQiBK9ugr17d0RL0BjsVZs1y8F4cuajgub2lMB8O
 7og+CJpITC3fmwye2MBSYTATqF2SHjcb4uL2J4JY/4PV9Uuc60jUUB9tUI/jBWwDVOmex4
 hCUrQo4ikpERMLHZOMs2ClcPMi5+fy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630583456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cCzkzEy42tfQe+xaPAhX//Wxbg4yQWODycC2oth+nzk=;
 b=vTxf1qc09/0uvk9ZO3ogIN1NjDCUNIQHdVkvqP/P3+DoKgcB5FbGyLJueNzaKCj5cFwJ3p
 RV2cKWhfH/Y0mdBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C5F1413732;
 Thu,  2 Sep 2021 11:50:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 4458K5+6MGHkegAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 11:50:55 +0000
Date: Thu, 2 Sep 2021 13:50:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YTC6nujBQURztwei@pevik>
References: <20210902103740.19446-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210902103740.19446-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/4] checkbashisms.pl in make check + fixed docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi All,

> checkbashisms.pl has problem with type. Although it's in POSIX [1] even
> in old one from 2004 [2] and it's supported by all common shells (i.e.
> bash, zsh, dash, busybox sh, mksh; even in ksh; maybe just csh does not
> support it) checkbashisms.pl complains about it:

> $ make check-tst_test.sh
> CHECK testcases/lib/tst_test.sh
> possible bashism in tst_test.sh line 33 (type):
> 		if type $TST_CLEANUP >/dev/null 2>/dev/null; then
> possible bashism in tst_test.sh line 694 (type):
> 		if type $TST_SETUP >/dev/null 2>/dev/null; then
> possible bashism in tst_test.sh line 726 (type):
> 		if type ${TST_TESTFUNC}1 > /dev/null 2>&1; then
> make: [../../include/mk/rules.mk:58: check-tst_test.sh] Error 1 (ignored)


> Should I report it to Debian (the upstream)? Or at least ask for way to
> suppress the warning?

type is part of POSIX, but as part of the X/Open Systems Interfaces option
(XSI). The checkbashisms man page explicitly says:

	Note that the definition of a bashism in this context roughly equates to "a
	shell feature that is not required to be supported by POSIX"; this means that
	some issues flagged may be permitted under optional sections of POSIX, such as
	XSI or User Portability.

=> type is flagged because it is an optional feature.

I just send a patch which disabled it from source code.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
