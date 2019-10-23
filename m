Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0A8E227D
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 20:28:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21B7E3C2216
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 20:28:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AC7D13C134F
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 20:28:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 448B66005E6
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 20:28:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8082AE89;
 Wed, 23 Oct 2019 18:28:48 +0000 (UTC)
Date: Wed, 23 Oct 2019 20:28:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191023182845.GA2863@x230>
References: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
 <20191023121901.GA25868@dell5510>
 <463301336.8732968.1571837306503.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <463301336.8732968.1571837306503.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower
 false positives
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

Hi Jan,

> > > -	tst_res TPASS "'lsmod' passed."
> > > +lsmod_test()
> > > +{
> > > +	for i in $(seq 1 5); do
> > > +		if lsmod_matches_proc_modules; then
> > > +			tst_res TPASS "'lsmod' passed."
> > > +			return
> > > +		fi
> > > +		tst_res TINFO "Trying again"
> > > +		sleep 1
> > > +	done
> > This is similar pattern to TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF()
> > (for both shell and C). I wonder if we also have use for TPASS/TFAIL
> > instead of just TBROK and specifying number of tries instead of time to be
> > setup.

> I think TFAIL fits more here, it's outcome of what we are testing.
> TBROK in my mind is failure unrelated to subject of test.
I express myself wrong. Sure, I meant to have TPASS/TFAIL,
just to use some helper function instead of writing the wrapper in the test.

> But functionally TST_RETRY_FUNC should work too. 

> > C and shell usage is a bit different, so maybe
> > TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF() doesn't make much sense for shell

> I see it used in mkswap01.sh and numa01.sh.
Sorry, I searched just TST_RETRY_FN_EXP_BACKOFF.
Correct, TST_RETRY_FUNC is used there.

> I wonder if we need to TBROK in TST_RETRY_FUNC(). We could just return
> what the FUNC returns and let the test decide.
> TST_RETRY_FUNC_BRK() could be a wrapper that TBROKs on timeout.
That could work (apart from the fact it diverges the functionality from C).
+ there could be the third one, which TPASS/TFAIL (instead of nothing/TBROK).

But this should be based on TST_RETRY_FN_EXP_BACKOFF (TST_RETRY_FUNC is reusing
TST_RETRY_FN_EXP_BACKOFF) + add also TST_RETRY_FUNC wrappers.

Do we need similar functionality in C?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
