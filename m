Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8640F5C1
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Sep 2021 12:18:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7BFF3C883A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Sep 2021 12:18:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2DC8F3C1D1D
 for <ltp@lists.linux.it>; Fri, 17 Sep 2021 12:18:29 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7B6AB1000608
 for <ltp@lists.linux.it>; Fri, 17 Sep 2021 12:18:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ACCA81FD6B;
 Fri, 17 Sep 2021 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631873908;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HccEXP3qa7ZiYUqYAJYlFEA1NyTfJI0GzzmRPHS1tkw=;
 b=p0MsJeRBvJpvOxVnhZAsYj0+KIgKHbedk4AcaoCqvzmwWsHyBVzzAkTSSGy1cUblhCxnpf
 kEVwem5j1msR7zBiyqEqMLNa/b55q/GbNB6ut4jjoxWGT21M+QrEUnR44WWBUOJoAVEd/E
 MBwthNCiDI4BzWXvycBBDjxqI7zenks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631873908;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HccEXP3qa7ZiYUqYAJYlFEA1NyTfJI0GzzmRPHS1tkw=;
 b=tAGwMYMsA7U7NJjTr8Q58QxeijQorFLBfwLvg4EJ8rH0Z2AETw7uNvDleciLtyJ3nSvgTq
 AnISWEidTP4AUzCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D73B13A91;
 Fri, 17 Sep 2021 10:18:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QABQEHRrRGGQdgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 17 Sep 2021 10:18:28 +0000
Date: Fri, 17 Sep 2021 12:18:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YURrcrX9RQYIMt4V@pevik>
References: <20210519085812.27263-1-liwang@redhat.com> <YUJ2XA7W3JPODyNC@pevik>
 <YUJ7SC/FoA8wTaf2@pevik> <YURW7NKNSSr0J6pL@yuki>
 <YURdMRsvyGRcF77X@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YURdMRsvyGRcF77X@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi Cyril,

> > Hi!
> > > setup()
> > > {
> > > 	tst_brk TCONF "quit now!"
> > > }

> > > do_test()
> > > {
> > > 	tst_res TPASS "pass :)"
> > > }

> > > tst_run
> > > EOF

> > > # while true; do ./debug.sh; done

> > I managed to reproduce this in dash. I bet that this is a bug where
> > signal handler inside dash is temporarily disabled when we install the
> > trap and if we manage to hit that window the signal is discarded. At
> > least that is my working theory. After I've installed debug prints, in
> > the cases where it hangs the signal was sent just before have installed
> > the trap. And in some cases when the signal arrives the timer process is
> > killed but the trap is not invoked. So it really looks like signal
> > handling in dash is simply broken. Not sure what we can do about bugs
> > like this apart from switching to a real programming language.
Which version of bash and dash are you testing on?

> Thanks for the debugging. *bash* is also affected, at least some releases.
> I reproduced it also on some older SLES, with bash 4.4.
dash 0.5.11.4 and 5.1.8 on my Tumbleweed laptop are OK.

I tested it on various my VM:

dash *failing*: 0.5.8 (SLES), 0.5.11.3 (Tumbleweed), 0.5.11+git20200708+dd9ef66-5 (Debian), 0.5.7-4+b1 (Debian)
dash *OK*: 0.5.11.2 (SLES 15), 0.5.10.2 (CentOS)

bash *failing*: 5.1.4-1.4 (Tumbleweed), 4.4-9.7.1 (SLES 15)
bash *ok*: 4.4-17 (SLES 15), 4.3-83 (SLES 12), 4.3-11+deb8u (Debian), 5.1-2+b3
(Debian), 4.2.46-34 (CentOS)

I have no idea what it causes, whether really some bash and dash versions are
buggy or it's reproducible only on certain environment.

Any tip what to search for?

Kind regards,
Petr

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
