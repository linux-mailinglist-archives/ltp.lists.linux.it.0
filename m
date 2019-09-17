Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30CB4CB7
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 13:22:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 433833C20A7
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 13:22:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 30C1B3C2096
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 13:22:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2F533140182B
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 13:22:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2FBE5B0E6;
 Tue, 17 Sep 2019 11:22:27 +0000 (UTC)
Date: Tue, 17 Sep 2019 13:22:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20190917112225.GA12139@x230>
References: <20190913125823.17314-1-pvorel@suse.cz>
 <1568630275.3028.23.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568630275.3028.23.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] LTP_TIMEOUT for shell API
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

Hi,

> <snip>
> > Questions:
> > * I don't know how to detect TST_TIMEOUT settings made by user.
> > That's
> > the difference from C, where user cannot overwrite tst_test->test.
> > Am I missing something or it's not possible to detect whether
> > variable
> > was set in code or by user?
> > Maybe that was the reason TST_TIMEOUT wasn't set, but rather fixed.

> Maybe we could initialize all variables in tst_test.sh. So we overwrite
>  values given by user/environment.
But that's also overwrite setting in the test (in this patchset it's added in
memcg_stress_test.sh). I.e. library don't know whether variable is set by user
or a test.

> But I in general I think, if someone
> play with TST_* variables, it's up to him what happen.
> And you already added this WARNING!
Yep.

> > * Code allowing $LTP_TIMEOUT_MUL being also float making code a bit
> > complex. If you don't like it, I suggest to change $LTP_TIMEOUT_MUL
> > being for both C and shell integer, but I'd prefer the possibility to
> > be float.
> > (it's might be handy being able to set timeout 1.33x which is far
> > less
> > than 2x for int).

> I also don't see the need of such fine granular multiplier.
Then it should be unified, i.e. force to use int instead of float also in C API.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
