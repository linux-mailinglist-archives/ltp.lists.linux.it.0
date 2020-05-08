Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A21CA499
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 08:55:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8A763C5715
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 08:55:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 937653C2464
 for <ltp@lists.linux.it>; Fri,  8 May 2020 08:55:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0B87E1A0152D
 for <ltp@lists.linux.it>; Fri,  8 May 2020 08:55:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A6B4AD73;
 Fri,  8 May 2020 06:55:24 +0000 (UTC)
Date: Fri, 8 May 2020 08:55:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200508065519.GA2556@x230>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
 <379f4d58e86b5249f56ff58e1907dee69d67e451.1588669892.git.viresh.kumar@linaro.org>
 <20200507145258.GA16940@dell5510>
 <20200508033034.cyem2olxb7kpvu4s@vireshk-i7>
 <20200508042455.xmf57rcdhtmxqeec@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508042455.xmf57rcdhtmxqeec@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/8] syscalls/futex: Add support for time64 tests
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> > Will it be easier if I resend all my patches again in a single series
> > ? I can also add the new tests I have converted then.

> Okay, I cleaned up the GPL licensing thing and resent everything in a
> single series. That should simplify everyone's life.
Thanks a lot!

It might not make it to this release (freeze should be from Monday and probably
nobody from reviewers work on the weekend + there is a bank holiday today for
some countries).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
