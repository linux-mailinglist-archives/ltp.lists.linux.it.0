Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD54E45F3
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 19:25:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D97A3C8A8D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 19:25:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 784A73C006A
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 19:25:45 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D6E39600853
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 19:25:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5D8C210E9;
 Tue, 22 Mar 2022 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647973543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlSdDHZKoLYItk8mVmEIcKUHi7VJ5n9VL+dP6HBMvt4=;
 b=hxphnnpwFY04j0g+Z6u/pwrhYsexHboZAEgbG3CVQAcuc/e++Oo5tlLV6NFOT2MkK9bV2A
 bqzbxU1mlIuu2i4J7y3uoA38T8lpuc6b0Xyk0Gpgj4h2r1NvXAM/aT+6AGLMJPGwnc7vGg
 JtGk7FODciLzmh8irJ/qUCYVVs9cJbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647973543;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlSdDHZKoLYItk8mVmEIcKUHi7VJ5n9VL+dP6HBMvt4=;
 b=H1BwgG1c59fHWlaO92q+9jM2KOmSOAuCKeuUlKRTfkCzHp7FqF3wuFRoBAw3HQJl0/8OvR
 rqfabtR6m1otfHBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7818133B6;
 Tue, 22 Mar 2022 18:25:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T0YOK6cUOmKuHAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 22 Mar 2022 18:25:43 +0000
Date: Tue, 22 Mar 2022 19:25:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YjoUprPfTYN1nlt4@pevik>
References: <20220204194648.32165-1-pvorel@suse.cz>
 <20220204194648.32165-3-pvorel@suse.cz> <Yh98mQNybj1R1Kga@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yh98mQNybj1R1Kga@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] broken_ip-nexthdr.sh: Check IPv6 support
 before forcing it
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

Hi Cyril,

> Hi!
> > diff --git a/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh b/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
> > index ec6643af66..cb4a3dd399 100755
> > --- a/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
> > +++ b/testcases/network/stress/broken_ip/broken_ip-nexthdr.sh
> > @@ -11,6 +11,7 @@ TST_TESTFUNC="do_test"
> >  do_test()
> >  {
> >  	# not supported on IPv4
> > +	tst_net_require_ipv6
> >  	TST_IPV6=6
> >  	TST_IPVER=6

> I was looking at the code if we can simply instead do:

> [ "$TST_IPVER" == 6 ] && tst_net_require_ipv6

> in the test library, but it looks like the parameters are parsed in the
> tst_test.sh in the tst_run() function. Which means that the TST_IPVER is
> not actually set until the test starts and the library has no way of
> knowing the variable value beforehand.

> I guess that we can actually move the option parsing code in the
> tst_test.sh so that it happens just right after the script is sourced,
> which would make things much easier as the TST_IPVER would end up being
> defined in the tst_network.sh and we coud simply use the statement above
> without any further hacks like this patch adds.

> As a side effect we could clean up the test option parsing code since we
> do actually have two different getopts loop in the tst_test.sh library
> and as far as I can tell we can do just with one.

I tried to implement this [1] (or [2] if I force push), and using getopts the
end of the script only would require also to move loading '. tst_test.sh' at the
end of *all* the test scripts because setup functions needs to be loaded before
sourcing tst_test.sh. Do we want this?

Kind regards,
Petr

[1] https://github.com/pevik/ltp/commit/9d77e5d964751ea3f0c8d22c4265c0041e2ebbc9
[2] https://github.com/pevik/ltp/commits/tst_test.sh/cleanup-getopts

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
