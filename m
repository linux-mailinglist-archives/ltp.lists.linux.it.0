Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FB1B4753
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 16:28:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81EA43C2974
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 16:28:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 921F93C2962
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 16:28:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 07AD510005C5
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 16:28:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2154AC1D;
 Wed, 22 Apr 2020 14:28:47 +0000 (UTC)
Date: Wed, 22 Apr 2020 16:29:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200422142907.GB9086@yuki.lan>
References: <cover.1587033556.git.viresh.kumar@linaro.org>
 <08a307591b531593bbaa5b1e8a4c841e80493937.1587033556.git.viresh.kumar@linaro.org>
 <20200421154006.GA14036@yuki.lan> <20200422131801.GA9146@dell5510>
 <20200422132642.GA9086@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422132642.GA9086@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 1/2] tst_timer: Add support for kernel's 64 bit
 timespec
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > $ gcc --version
> > gcc (GCC) 4.4.7 20120313 (Red Hat 4.4.7-18)
> 
> Looks like there are some problems with the anonymouns unions, probably
> gcc 4.4 does not support these. I will have a look later on.

Looking into the issue, anonymous unions are part of c11 standard so it
looks like gcc 4.4 is too old to support that. I have tested 4.4.5 which
definitelly lacks the support.

So I guess I will have to change the code so that the union has a name,
its not a big deal since we aren't touching the fields directly but only
in a few get/set functions.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
