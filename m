Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F73D295C7F
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 12:13:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22F3E3C318D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 12:13:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E4DEB3C25E8
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 12:13:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7589114011A6
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 12:13:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDFCEAAB2;
 Thu, 22 Oct 2020 10:13:05 +0000 (UTC)
Date: Thu, 22 Oct 2020 12:13:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20201022101336.GC2427@yuki.lan>
References: <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
 <63646c1ba9e1a3061b44be4f1f9a29d9d6d03f2e.1603254560.git.viresh.kumar@linaro.org>
 <20201021120434.GB10861@yuki.lan>
 <20201022045406.4m6pgqfmwvyx7mh2@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022045406.4m6pgqfmwvyx7mh2@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 2/3] syscalls: select: Verify that data is
 available to read
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
> > I guess that we still need a test where select would clear the bits from
> > fd->set though, I supposes that the easiest solution would be to add
> > select04.c for that...
> 
> I am not sure how to do that and why would that matter ? :)

So the tests we do have now are checking that the bits in the fdset are
not cleared when there are data ready to be read/written from/to the
filke descriptor, right?

What we need is a test where we ask for a data to be read from an empty
pipe, ask for data to be written to a pipe filled with data (write there
till we get EAGAIN in setup), etc. We can do this with a very short
timeout or even with a timeout set to zero (polling) and check that the
bits were cleared once we have returned from the call.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
