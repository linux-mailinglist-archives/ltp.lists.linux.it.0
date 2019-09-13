Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA8B1BBA
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 12:46:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F0FC3C2077
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 12:46:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 288193C1048
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 12:46:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B9A041BCB021
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 12:46:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0F55B01F;
 Fri, 13 Sep 2019 10:46:42 +0000 (UTC)
Date: Fri, 13 Sep 2019 12:46:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cristian Marussi <cristian.marussi@arm.com>
Message-ID: <20190913104641.GB598@dell5510>
References: <20190912201318.30931-1-pvorel@suse.cz>
 <20190912201318.30931-3-pvorel@suse.cz>
 <61c28ae1-d696-3910-d1c5-07ee5e13c754@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61c28ae1-d696-3910-d1c5-07ee5e13c754@arm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] shell: Introduce LTP_TIMEOUT variable
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

Hi

<snip>
> > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > index ca63745fd..f427cd459 100644
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -379,9 +379,31 @@ _tst_rescmp()

> >  _tst_setup_timer()
> >  {
> > +	TST_TIMEOUT=${TST_TIMEOUT:-300}
> >  	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}

> > -	local sec=$((300 * LTP_TIMEOUT_MUL))
> > +	if [ "$LTP_TIMEOUT_MUL" = -1 ]; then
> > +		tst_res TINFO "Timeout per run is disabled"
> > +		return
> > +	fi
> > +
> > +	local err
> > +	tst_is_num || err=1

> Not sure to understand what's going on here ....tst_is_num needs at least an arg right ?
Good point, it should have been
tst_is_num "$TST_TIMEOUT" || err=1

And I omit to grep TIMEOUT" in tst_run() in tst_test.s.

> > +	if tst_is_int; then
> > +		[ "$LTP_TIMEOUT_MUL" -ge 1 ] || err=1

> ....same for tst_is_int .... and I can see no trace of code handling the new LTP_TIMEOUT
> around this patch...am I missing something ?
Sorry, s/LTP_TIMEOUT/TST_TIMEOUT in docs and tests. Will be in v2.

> Cheers 

> Cristian

Kind regards,
Petr

PS: please snip the unrelated content in long patches like this one
(easier to read in both mail and patchwork).

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
