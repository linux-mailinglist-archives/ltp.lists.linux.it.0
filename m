Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B617581A
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 11:16:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A1F93C6806
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 11:16:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DE9CD3C67ED
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 11:16:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 501321001531
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 11:16:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49AB6AC22;
 Mon,  2 Mar 2020 10:16:29 +0000 (UTC)
Date: Mon, 2 Mar 2020 11:16:28 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200302101628.GB5288@rei.lan>
References: <b927e5f2cd36ec2dd57202b492563922b1a94e77.1582886993.git.viresh.kumar@linaro.org>
 <20200228132210.GC8324@rei>
 <20200302063714.claovt5uyi7gxf2o@vireshk-i7>
 <20200302084651.GA4736@rei.lan>
 <20200302090718.hmyxgbmrwltxiz56@vireshk-i7>
 <20200302093622.GA5288@rei.lan>
 <20200302100244.6syqeskptbsnyf6t@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302100244.6syqeskptbsnyf6t@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/openat2: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > The code you had there in the first place was passing by accident
> > because the were non-zero bytes on the stack after the structure, which
> > is pretty bad, because if it started to fail randomly nobody would know
> > why.
> 
> I know :)
> 
> What about this? This doesn't test the success case with pad = 0 though, as it
> is a success case. Don't want to add a separate file for it. :)

This has still one small drawback, the whole purpose of the test buffers
is that there is a PROT_NONE page allocated right behind the end of the
buffer. This is implemented so that we can make sure that kernel does
not touch any data outside of it. So the buffer has to be sized exactly
as the tc->size otherwise there is no point in using it. So I guess we
still need two buffers.

Also I guess that we can add the success case to the openat201.c test
but that would mean that we need two buffers there as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
