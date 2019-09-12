Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 188EAB1219
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 17:28:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C771F3C2090
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 17:28:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B59953C0067
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 17:28:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CAF2F62CC25
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 17:28:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12E20ADDC;
 Thu, 12 Sep 2019 15:28:22 +0000 (UTC)
Date: Thu, 12 Sep 2019 17:28:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cristian Marussi <cristian.marussi@arm.com>
Message-ID: <20190912152820.GB1064@dell5510>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
 <1568279073.3621.12.camel@suse.de>
 <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
 <e07d08e2-df58-2114-0278-8f1e50f2ac3a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e07d08e2-df58-2114-0278-8f1e50f2ac3a@arm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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
Cc: cfamullaconrad@suse.com, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > @Petr and @Cristian, If I misunderstand anything, please correct me.

> my understanding was that:

> - we should already be able to set a non default per-test timeout using
>   the existing global LTP_TIMEOUT_MUL (and we are)

> - in this test we hardcoded such LTP_TIMEOUT_MUL to 7 because is the minimum sane
>   value for this test (less than 7 and it fails 100%)

> - we want to allow again the user to specify its own LTP_TIMEOUT_MUL if he wants
>   BUT also being able to enforce on a test by test basis a MINIMUM allowed value:
>   so we would define LTP_TIMEOUT_MUL_MIN=7 here, and then a user would be free to 
>   run LTP with a different global LTP_TIMEOUT_MUL but when running this test

>   + if LTP_TIMEOUT_MUL < LTP_TIMEOUT_MUL_MIN ===> use local LTP_TIMEOUT_MUL_MIN
>   + if LTP_TIMEOUT_MUL >= LTP_TIMEOUT_MUL_MIN  ===> use global LTP_TIMEOUT_MUL

LTP_TIMEOUT_MUL is only for user, LTP_TIMEOUT_MUL_MIN is only for library.
It's similar to way which is used in virt_lib.sh (VIRT_PERF_THRESHOLD_MIN).
See
https://patchwork.ozlabs.org/patch/1155460/

I'll probably sent this patch today although so you can base the work on it.
Is that ok?

Kind regards,
Petr

> This way you don't break specific tests' needs while allowing the user to global reduce
> run-time....now basically the user cannot enforce a higher timeout on this test
> using the global LTP_TIMEOUT_MUL even if it should be allowed to since this wouldn't
> break the test.

> ...unless I misunderstood too o_O :D

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
