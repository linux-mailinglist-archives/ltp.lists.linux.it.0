Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D905229C3E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:57:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C31493C7709
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:57:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2F4ED3C2879
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:57:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8A409140017C
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:57:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6651CAD39;
 Wed, 22 Jul 2020 15:57:54 +0000 (UTC)
Date: Wed, 22 Jul 2020 17:58:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Erico Nunes <ernunes@redhat.com>
Message-ID: <20200722155808.GA3864@yuki.lan>
References: <20200720194920.22784-1-ernunes@redhat.com>
 <CAEemH2c1Sz+pkcLnCoWWCaMCte7QsmUTOoUxU6fzCF32nrrG+w@mail.gmail.com>
 <98eaa723-1349-272d-3021-d2fef6e1abdd@redhat.com>
 <CAEemH2e0nwt_aOytJz0WzB3CYSirxa4myOZoQqCPTAVBL11gbQ@mail.gmail.com>
 <8c72fb72-c7aa-f21f-e08c-d97c28e4c375@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c72fb72-c7aa-f21f-e08c-d97c28e4c375@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > So maybe we could simply do detect the /sys/kernel/../loackdown file as
> > your patch,
> > but adding an extra warning print when test failed on older than
> > kernel-v5.4.
> 
> I like the idea of the warning. The only thing to consider is that the
> warning would also show up on all old kernels that don't even support
> lockdown and then don't have the file. So would you suggest this message
> to be something like a tst_res(TWARN, ...) or TINFO or some other less
> noisy way?

TWARN will cause the test to exit with non-zero status, which will
probably show up as a failure in some environments, so I would go for
TINFO.

> I also thought about limiting to some kernel version but that wouldn't
> work with distribution kernels like RHEL which have an earlier version
> number but also have the feature...

We also have an interface to match different kernel versions per
distribution, have a look at tst_kern_exv structure in inotify04.c
testcase.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
