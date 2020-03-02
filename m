Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B617573B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 10:36:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E12103C6804
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 10:36:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 11F443C67E9
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 10:36:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 807F7600ED2
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 10:36:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5AF3AC7C;
 Mon,  2 Mar 2020 09:36:22 +0000 (UTC)
Date: Mon, 2 Mar 2020 10:36:22 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200302093622.GA5288@rei.lan>
References: <b927e5f2cd36ec2dd57202b492563922b1a94e77.1582886993.git.viresh.kumar@linaro.org>
 <20200228132210.GC8324@rei>
 <20200302063714.claovt5uyi7gxf2o@vireshk-i7>
 <20200302084651.GA4736@rei.lan>
 <20200302090718.hmyxgbmrwltxiz56@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302090718.hmyxgbmrwltxiz56@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
> > Hmm, I guess that it makes sense to add the pointer to how to the tcase
> > structure and allocate exact size for the E2BIG case. That should work
> > fine, right?
> 
> We need to hack it a bit more to initialize rest of the memory as
> well. This is what I did before I dropped the idea.

Looking at the kernel the code that we are trying to trigger is
copy_struct_from_user() in include/linux/uacess.h. And indeed the area
after the kernel how structure has to be non-zero in order for the
structure to be deemed incompatible.

I guess that the easier way how to test this would be:

* Create an extended how structure
* Set bytes at the end of the extended structure to non-zero

The code you had there in the first place was passing by accident
because the were non-zero bytes on the stack after the structure, which
is pretty bad, because if it started to fail randomly nobody would know
why.

I guess that it would make sense to put this in a separate test and test
that everthing works fine as long as padd is zero and that we got a
failure with padd != 0.

So something as:

struct how_ext {
	uint64_t flags;
	uint64_t mode;
	uint64_t resolve;
	char padd[20];
};

Then setup the flags, mode and resolve and do two calls to openat2() one
with padd 0 => should work and one with pad != 0 should fail.

Does that sound reasonable?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
