Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3840F664
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Sep 2021 12:59:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EE303C884D
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Sep 2021 12:59:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B469A3C1D1E
 for <ltp@lists.linux.it>; Fri, 17 Sep 2021 12:59:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9C58E600A55
 for <ltp@lists.linux.it>; Fri, 17 Sep 2021 12:59:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C198C2228A;
 Fri, 17 Sep 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631876370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WdR/3JL1oBaVKtW+w7ncPgAUa+tTCenNFkZwsdxlJpk=;
 b=SEAoF+/QAY4x/y6lNM+xS8pTiTsjvn7FAOWj3DvsdVhgYehqosgfcGBlIxvpgsJZA44NEs
 6mnf6uvHOlwpISD3vlG2jQJS3Uxz63WGaPgohTpMtbX0gUP2FMP7+3xQx3hSTg1f8wxeRT
 RELXncIAGoTDYLxoFXPYF8452+sEjXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631876370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WdR/3JL1oBaVKtW+w7ncPgAUa+tTCenNFkZwsdxlJpk=;
 b=1HYbhKOTAzoee2NLL+lJ86OeMChHxHKe6j7Acqb3sU/3ZWF5D7o9KSJhrU3oN1AnIpsVCd
 N7z52FuyxMp0fNAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FB3A14074;
 Fri, 17 Sep 2021 10:59:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cPFRJRJ1RGHnEQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 17 Sep 2021 10:59:30 +0000
Date: Fri, 17 Sep 2021 12:59:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YUR1K7XE3QmTFxT7@yuki>
References: <20210519085812.27263-1-liwang@redhat.com> <YUJ2XA7W3JPODyNC@pevik>
 <YUJ7SC/FoA8wTaf2@pevik> <YURW7NKNSSr0J6pL@yuki>
 <YURdMRsvyGRcF77X@pevik> <YURrcrX9RQYIMt4V@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YURrcrX9RQYIMt4V@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_test: using SIGTERM to terminate process
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > I managed to reproduce this in dash. I bet that this is a bug where
> > > signal handler inside dash is temporarily disabled when we install the
> > > trap and if we manage to hit that window the signal is discarded. At
> > > least that is my working theory. After I've installed debug prints, in
> > > the cases where it hangs the signal was sent just before have installed
> > > the trap. And in some cases when the signal arrives the timer process is
> > > killed but the trap is not invoked. So it really looks like signal
> > > handling in dash is simply broken. Not sure what we can do about bugs
> > > like this apart from switching to a real programming language.
> Which version of bash and dash are you testing on?
> 
> > Thanks for the debugging. *bash* is also affected, at least some releases.
> > I reproduced it also on some older SLES, with bash 4.4.
> dash 0.5.11.4 and 5.1.8 on my Tumbleweed laptop are OK.
> 
> I tested it on various my VM:
> 
> dash *failing*: 0.5.8 (SLES), 0.5.11.3 (Tumbleweed), 0.5.11+git20200708+dd9ef66-5 (Debian), 0.5.7-4+b1 (Debian)
> dash *OK*: 0.5.11.2 (SLES 15), 0.5.10.2 (CentOS)
> 
> bash *failing*: 5.1.4-1.4 (Tumbleweed), 4.4-9.7.1 (SLES 15)
> bash *ok*: 4.4-17 (SLES 15), 4.3-83 (SLES 12), 4.3-11+deb8u (Debian), 5.1-2+b3
> (Debian), 4.2.46-34 (CentOS)
> 
> I have no idea what it causes, whether really some bash and dash versions are
> buggy or it's reproducible only on certain environment.

bash 5.1.8 seems to work okay, dash 0.5.11.3-r2 seems to fail here.

> Any tip what to search for?

Not really, apart from reading source code and figuring out exactly what
happens here.

I guess that we can make things more predictable and easier to read by
shifting parts of the shell library to a C process.

For instance if we wrote an utility that would implement all the
tst_kill_test and timeout process in C we would simplify things greatly.

Something as:

tst_timeout_kill

that would be used as:


tst_timeout_kill 300 12342
                  ^    ^
		  |    process group leader pid
		  timeout in seconds


That would implement both the loop for killing tests and timeout
processing as well. That way we would get rid of the trap in the
subshell and we would end up with a single pid for the whole timeout
process and avoid the recursive sigkill to begin with.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
