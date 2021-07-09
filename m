Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F63C2134
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 11:06:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BADDF3C681B
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 11:06:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0F1F33C4D3F
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 11:05:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6B8EF1A01771
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 11:05:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CFCD52027F;
 Fri,  9 Jul 2021 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625821557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C7TZlZBGJ5XQDNYPTwZaxxRMKk8l4OMDezE+s2WYvjs=;
 b=Z/lBepC01/RFVP6VpEpvJRjYL56eoEQp/KrBZ4A/vZBmnzGhe+umt1E6NEeKI/I8XEvi78
 t6tEnEqvF2uHKn/H/FsiCVjU9XBIeCTPl6ESSiyXbRA42xxxYF8HRhwT5iPVsEuhiSYQ/G
 L/dlf4tXgW+bcDYs5wQGzuyAL/o06l0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625821557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C7TZlZBGJ5XQDNYPTwZaxxRMKk8l4OMDezE+s2WYvjs=;
 b=2P5XceXtNBI4o7ZVoWnze8JqJ9Bt7wR5n6ysdSmFpS8SFZ9YD+I+lmgHztZrSaRvwYrBa1
 zghAaEBMJyGDkFBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA6EB13A6E;
 Fri,  9 Jul 2021 09:05:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vynxLHUR6GA6XAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 09 Jul 2021 09:05:57 +0000
Date: Fri, 9 Jul 2021 10:40:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: David Hu <xuehaohu@google.com>
Message-ID: <YOgLd8W1qbNtisi0@yuki>
References: <CAPd9Lg-feW5KF=BDUzfGnqZPYs4S4ypBemb3b=qgG2z-9YsCiw@mail.gmail.com>
 <YObGwky3Nb6cN6R6@yuki>
 <CAPd9Lg-1zDJXbKYb_veAGaR78MXgTiAUZ3jm-WVneo25EcWs2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPd9Lg-1zDJXbKYb_veAGaR78MXgTiAUZ3jm-WVneo25EcWs2g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Existing kexec tests
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>    I am starting from scratch trying to come up with tests for kexec, so
> there is not a
>    specific framework I am working with now. any pointers / examples I can
> look into
>    to get a kexec test up on top of LTP ?
> 
>    The motivation is to improve kexec to address issues from this list
> https://docs.google.com/document/d/1cbTOapDAA1MfDSS5bggvEGcqNCFsrsFnAM2xX1wsOnk/edit?ts=60ca3192#heading=h.4gti11dn65un

The problems with kexec() (and similar tests) are twofold.

First of all we have to prepare the environment correctly, i.e. find
kernel image and initrd and so on. This varies a lot between
distributions but it's still the easier part.

Secondly the test execution framework has to be aware of the fact that
particular test reboots the machine and has to be able to handle the
situation gracefully. I've been putting the pieces together for last few
years and we are quite close to a generic solution. Let me try to describe
what we have in LTP so far.

First piece of the puzzle is a way to make the execution framework aware
of the fact that a particular test causes a reboot. At this point LTP
produces JSON file at build with various metadata parsed from the C
testcases, see the docparse/ directory in the LTP tree. So in this case
we would have to add a .reboots_machine flag to the tst_test structure
in the include/tst_test.h and the metadata parser will include it in the
metadata.json file if set in the test.

Second piece is a testruner that is able to run on a server in a lab so
that it's not taken down by the reboot. I've been working on
runltp-ng[1] for quite some time and I hope to include it in the LTP git
soon enough.

Third piece is to make use of the metadata in the testrunner. Generally
the runltp-ng would extract the metadata file from the machine that is
under the test as it does for rest of the files and load it. This is so
far missing, but should be quite easy as most of the infrastructure is
in place. I need this for different purposes as well, but so far I
haven't had time write the code.

Finally once third piece is in place the testrunner can check the
reebots_machine flag in the JSON before executing a test and if it's set
it would expect the machine to close connections and come up again.
Again if not all most of the infrastructure is in place since runltp-ng
can wait for machine to boot already.

[1] https://github.com/metan-ucw/runltp-ng

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
