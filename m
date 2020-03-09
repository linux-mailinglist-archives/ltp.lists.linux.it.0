Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172C17DADB
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 09:29:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4CEE3C6128
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 09:28:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B9EE83C60FA
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 09:28:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 27C871000D53
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 09:28:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 621F3B1FB;
 Mon,  9 Mar 2020 08:28:51 +0000 (UTC)
Date: Mon, 9 Mar 2020 09:28:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200309082849.GA322685@x230>
References: <1583311467-2379-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1583311467-2379-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200309074701.GA299736@x230>
 <fd1bed86-4590-cf73-a121-b9f9f0271e13@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd1bed86-4590-cf73-a121-b9f9f0271e13@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] syscalls/settimeofday02: convert to new
 library
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

Hi Xu,

> > > +static void verify_settimeofday(unsigned int n)
> > ...
> > > +	struct tcase *tc = &tcases[n];
> > > +
> > > +	flag = 0;
> > > +	tst_res(TINFO, "%s", tc->message);
> > > +	TEST(settimeofday(&tc->tv, NULL));
> > > +	if (TST_RET != -1) {
> > > +		tst_res(TFAIL, "settimeofday() succeeded unexpectedly");
> > Maybe add TTERRNO here as well?
> Why? When run into here, settimeofyday succeeded unexpectedly, errno should
> be 0.
Correct. I'm sorry, I read != as ==.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
