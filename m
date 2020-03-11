Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB071815B9
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 11:26:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C5443C5F33
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 11:26:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 750E93C5F29
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 11:26:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AEFA71400C51
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 11:26:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CEEBFAE4B;
 Wed, 11 Mar 2020 10:26:20 +0000 (UTC)
Date: Wed, 11 Mar 2020 11:26:20 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200311102620.GB3802@rei.lan>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
 <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Also this does not even handle the case that the command is missing.
> >
> > Looking at the v4 version, all we need is to correctly parse each line
> > from from /proc/mounts. I would just use strsep() with space as a
> > delimited and took first token that starts with a slash i.e. '/', then
> > we can just strcmp() it against the path. Or do I miss something?
> >
> 
> I'm afraid strcmp() can not satisfy the requirement for us. As you know LTP
> creates the MNTPOINT in temp dir that means it could not accurately match
> the string path which extracts from /proc/mounts with a slash.
> 
> e.g
> #define MNTPOINT "fallocate"
> ...
> /dev/loop4 on /tmp/FPp7kh/fallocate type xfs
> (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
> ...
> strcmp("/tmp/FPp7kh/fallocate", MNTPOINT) will never ruturn 0 to us.
> 
> What I can think of is to use strrchr() to cut the string after last '/',
> but that can only work for test mount fs in LTP ways. Other situations
> might not satisfy.

Hmm, for that we have to have compose the path for the comparsion
anyways, since unless we pass an absoule path we can never be user if we
have a right match or not. There may be leftover mount points from a
failed tests that have faile to cleanup properly as well.

So I guess that we need one more function, with tmpdir in name, that
would compose the right path for us and then call the tst_is_mntpoint().

I would have called that:

int tst_is_mntpoint_at_tmpdir(const char *path);

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
