Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A716F8BD
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 08:47:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A58883C25C4
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 08:47:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B73F43C0823
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 08:47:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4F14E6008E1
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 08:47:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3231DACC3;
 Wed, 26 Feb 2020 07:47:31 +0000 (UTC)
Date: Wed, 26 Feb 2020 08:47:29 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200226074729.GA15207@dell5510>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <e12560056ebc632918426194172a6cba48953d4e.1582612624.git.viresh.kumar@linaro.org>
 <20200225135709.GC62318@gacrux.arch.suse.de>
 <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226022758.ls35mblsetg4nk6f@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 08/10] syscalls/move_mount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> On 25-02-20, 14:57, Petr Vorel wrote:
> > > +	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> > > +	if (TST_RET == -1) {
> > > +		SAFE_CLOSE(fd);
> > > +		tst_res(TBROK | TERRNO, "fsconfig() failed");
> > These should be TFAIL otherwise it 1) breaks all tests 2) does not report any
> > result:

> > move_mount02.c:37: BROK: fsopen() failed: SUCCESS (0)
> > tst_test.c:1051: BROK: Test 0 haven't reported results!

> I am a bit confused about TBROK and TFAIL to be honest. The test
> writing guideline says this:

> | 'TFAIL' | Test has failed.
> | 'TBROK' | Something has failed in test preparation phase.

> And so in my code I have been using TFAIL only for the failures for the
> actual syscalls that we are testing, like move_mount here. And I have
> been using TBROK for pretty much everything else.
Your idea is correct, but IMHO it's not good to skip all the tests, which is
done due
tst_test.c:1051: BROK: Test 0 haven't reported results!
if you use tst_res(TBROK ...).

You can use tst_brk(TBROK) to avoid no reported results, but that's obviously
exit the test either.

tst_brk(TBROK) is used for setup, where you create some resource, which is then
reused by all test runs, but this preparation fails.

NOTE: There are some tests which are using tst_res(TBROK). At least some of them are
wrong. IMHO in testcases/kernel/syscalls/request_key/request_key04.c
	TST_ERR = saved_errno;
	if (TST_ERR == EACCES) {
		tst_res(TPASS, "request_key() failed with EACCES as expected");
	} else {
		tst_res(TBROK | TTERRNO,
			"request_key() failed with unexpected error code");
	}

IMHO it should be
	TST_ERR = saved_errno;
	if (TST_ERR == EACCES) {
		tst_res(TPASS, "request_key() failed with EACCES as expected");
	} else {
		tst_res(TFAIL | TTERRNO,
			"request_key() failed with unexpected error code");
	}
Otherwise if it fails at unexpected error code, you get:
request_key04.c:68: BROK: request_key() failed with unexpected error code: EACCES (13)
tst_test.c:1036: BROK: Test haven't reported results!

Thus I'd try to avoid TBROK with tst_res().

> Would be good if you and Cyril can explain what's the correct usage
> model for these is.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
