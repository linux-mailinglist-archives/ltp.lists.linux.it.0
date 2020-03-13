Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65888184929
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:20:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB9543C5933
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:20:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 598A33C58F1
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:20:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0FCFE6009AE
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:20:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C7C8AFD7;
 Fri, 13 Mar 2020 14:20:47 +0000 (UTC)
Date: Fri, 13 Mar 2020 15:20:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200313142045.GB24523@dell5510>
References: <08f6f9f8af7b8f999136cc2a30744a8d678d2b5f.1584000268.git.viresh.kumar@linaro.org>
 <20200312134300.GB3803@rei.lan>
 <20200313041947.2ua6abqerhdo6wfv@vireshk-i7>
 <20200313134215.GA7318@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313134215.GA7318@rei.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clone3: New tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > - pidfd: Kernel doesn't check this pointer and we get EFAULT.
> > - child_tid: Kernel checks for valid pointer and doesn't use the
> >   variable if NULL, so test passes unexpectedly.

> We do have tst_get_bad_addr() that produces PROT_NONE mapped page that
> should get you EFAULT in both cases here.
I was thinking about it, then didn't write it.

+ we should add tst_get_bad_addr() to doc/test-writing-guidelines.txt.
I'll try to remember to send patch on Monday.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
