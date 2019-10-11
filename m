Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEEFD3A94
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:12:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF2F83C147F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:12:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B86C93C1443
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:12:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2D0E01400DD8
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:12:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9FA8DB0BA;
 Fri, 11 Oct 2019 08:12:03 +0000 (UTC)
Date: Fri, 11 Oct 2019 10:12:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191011081201.GA31207@dell5510>
References: <20190930145916.20465-1-pvorel@suse.cz>
 <20190930145916.20465-3-pvorel@suse.cz>
 <20191009143434.GE7561@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009143434.GE7561@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v4 2/5] shell: Introduce TST_TIMEOUT variable,
 add checks
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

...
> > +	if ! tst_is_int "$LTP_TIMEOUT_MUL"; then
> > +		tst_test_cmds cut

> I do not think that it's necessary to check for the presense of the cut
> command.
I wouldn't check for cut in tests, but in library I tend to be careful.
But sure, I'll delete it.

BTW we already check for basic commands in tst_run():
tst_test_cmds cut tr wc
_tst_setup_timer() is called later.
Do you want to drop some of these checks?

> > +		LTP_TIMEOUT_MUL=$(echo "$LTP_TIMEOUT_MUL" | cut -d. -f1)
> > +		LTP_TIMEOUT_MUL=$((LTP_TIMEOUT_MUL+1))
> > +		tst_res TINFO "ceiling LTP_TIMEOUT_MUL to $LTP_TIMEOUT_MUL"
> > +	fi
> > +	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
> > +
> > +	if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
> > +		tst_brk TBROK "TST_TIMEOUT must be int >= 1! ($TST_TIMEOUT)"
> > +	fi
> > +
> > +	local sec
> > +	if [ "$is_float" ]; then
> > +		sec=`echo | awk '{printf("%d\n", '$TST_TIMEOUT' * '$LTP_TIMEOUT_MUL'+ 0.5)}'`
> > +	else
> > +		sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
> > +	fi

> Is this a leftover? Now that LTP_TIMEOUT_MUL has been converted to int
> we can simply do what is done in the else branch.
Yes, thanks for catching this.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
