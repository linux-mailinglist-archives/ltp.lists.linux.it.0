Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C31B6085
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 11:40:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C05D3C20FA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 11:40:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0C53D3C2080
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 11:40:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DA2BC1A0177F
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 11:40:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F4114AE4B;
 Wed, 18 Sep 2019 09:40:40 +0000 (UTC)
Date: Wed, 18 Sep 2019 11:40:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20190918094039.GB11711@x230>
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <1568629595.3028.13.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568629595.3028.13.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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

Hi Clements,

> Hi Petr,
> only some small comments below.

> On Fri, 2019-09-13 at 14:58 +0200, Petr Vorel wrote:
> > <snip>
> > -2.3.2 Library variables
> > -^^^^^^^^^^^^^^^^^^^^^^^
> > +2.3.2 Library environment variables for shell
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> >  Similarily to the C library various checks and preparations can be
> > requested
> >  simply by setting right '$TST_NEEDS_FOO'.
> > @@ -2047,6 +2058,14 @@ simply by setting right '$TST_NEEDS_FOO'.
> >                         the test (see below).
> >  | 'TST_NEEDS_MODULE' | Test module name needed for the test (see
> > below).
> >  | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
> > +| 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must
> > be float

>       ^
> I think TST_TIMEOUT isn't evaluated in c at all. There we have `(struct
> tst_test*)->timeout` which is `int`,
> tst_test*)->timeout (BTW it's *unsigned* int).
Correct, thanks!
This is a proposed description, which I'll post to v3.
(using tst_test.timeout to be short enough, is that ok?):
| 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must be int >= 1,
                       or -1 (special value to disable timeout), default is 300.
                       Variable is meant be set in tests, not by user.
                       It's equivalent of `tst_test.timeout` in C.
| 'LTP_TIMEOUT_MUL'  | Multiply timeout, must be number >= 1 (> 1 is useful for
                       slow machines to avoid unexpected timeout).
                       Variable is also used in C tests.
                       It's meant to be set by user, not in tests.
...
> > +	local sec
> > +	if [ "$is_float" ]; then
> > +		sec=`echo |awk '{printf("%d\n", '$TST_TIMEOUT' * 

>                           ^
>                           nit, space after |
Sure :).

> > '$LTP_TIMEOUT_MUL')}'`

>                    ^
>                    + 0.5
> In C implementation we round up. Maybe we should do the same in shell.
Correct, thanks!


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
