Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB141815A8
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 11:20:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09A173C5F32
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 11:20:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CED113C5F28
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 11:20:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3B84320137F
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 11:20:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 826E9B1A6;
 Wed, 11 Mar 2020 10:20:40 +0000 (UTC)
Date: Wed, 11 Mar 2020 11:20:38 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200311102038.GA3802@rei.lan>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
 <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
 <20200311073113.q7e7jauldjyizz2q@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311073113.q7e7jauldjyizz2q@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I'm afraid strcmp() can not satisfy the requirement for us. As you know LTP
> > creates the MNTPOINT in temp dir that means it could not accurately match
> > the string path which extracts from /proc/mounts with a slash.
> > 
> > e.g
> > #define MNTPOINT "fallocate"
> > ...
> > /dev/loop4 on /tmp/FPp7kh/fallocate type xfs
> > (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
> > ...
> > strcmp("/tmp/FPp7kh/fallocate", MNTPOINT) will never ruturn 0 to us.
> > 
> > What I can think of is to use strrchr() to cut the string after last '/',
> > but that can only work for test mount fs in LTP ways. Other situations
> > might not satisfy.
> 
> @Cyril, can we please finalize what you guys want me to do here ? I
> don't really want to repost the patch, which still has issues :)

Sorry for the back and forth.

I remmebered yesterday that there is setmntent() in libc, so i we call
that on /proc/mounts, the whole problem would be reduced to a path
comparsion.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
