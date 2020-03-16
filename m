Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7841864F8
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 07:22:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C13203C5694
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 07:22:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 22ACB3C0489
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 07:22:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9553820009F
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 07:22:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5FA0AAE99;
 Mon, 16 Mar 2020 06:22:40 +0000 (UTC)
Date: Mon, 16 Mar 2020 07:22:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200316062238.GA2616854@x230>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
 <824c287cd06190cf0a489535fd4617aff8742b03.1584014172.git.viresh.kumar@linaro.org>
 <20200312191025.GD3803@rei.lan>
 <20200313040012.bvkzfbxlvrwkkltd@vireshk-i7>
 <20200313080334.GA6597@rei.lan>
 <20200313084853.lnfi4dnyoht5yupi@vireshk-i7>
 <20200313120943.GA32033@dell5510>
 <20200316060950.6o52idjfocdibrn6@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316060950.6o52idjfocdibrn6@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 05/10] syscalls/fsconfig: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> > > I didn't knew about the -i option, yeah your change makes sense now :)
> > NOTE: all test (both C and shell) should support -h (inherited from the
> > library), to display options.

> I didn't thought about that as well earlier, but then tried -h option
> with the executable earlier before your mail came and it worked. So I
> assume I don't have to do anything special to support the -h option as
> it is already working fine right now ?
Yes, that's automatically done by library (a nice feature of new C library API).
See parse_opts() in lib/tst_test.c. And even better: you can very easily extend
it, see 2.2.5 Test specific command line options [1].

Cyril also recently described LTP library model in his blog [3].

We were thinking to separate the library so it can be reused in other projects
(similarly like kernel's kconfig is used in other projects). But it'd be good
first to rewrite all tests which uses legacy API, which allows remove legacy API
itself.

BTW We also try to keep shell API to be similar to C API (when possible),
therefore getopt support it's there as well, see 2.3.3 Optional command line
parameters [2].

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#225-test-specific-command-line-options
[2] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#233-optional-command-line-parameters
[3] https://people.kernel.org/metan/the-ltp-test-driver-model

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
