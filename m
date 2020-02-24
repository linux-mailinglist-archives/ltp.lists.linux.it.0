Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A1C16A82F
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 15:20:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21513C24B7
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 15:20:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 65E8F3C2381
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 15:20:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3E0A76003CC
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 15:20:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83C45B280;
 Mon, 24 Feb 2020 14:20:35 +0000 (UTC)
Date: Mon, 24 Feb 2020 15:20:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200224142034.GA2210@rei>
References: <20200127162016.GD30831@rei.lan>
 <1580969073-27367-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200221160351.GA26393@rei.lan>
 <8d1a7c73-7122-2c3d-6a73-024bed066966@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d1a7c73-7122-2c3d-6a73-024bed066966@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] syscalls/fcntl30: clean up && add more
 range test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I was playing with the test and it seems that the kernel allocation may
> > fail even for much smaller sizes for various reasons. I guess that
> > memory framentation on long running systems may be the culprit here
> > because kmalloc() allocates physically continuous memory.
> > 
> > I guess that the safest bet here would be limiting the maximal size we
> > try to resize the pipe and succeed to something as 8MB which would be
> > something as 32 pages to allocate.
> > 
> Agree.
> > At the same time I would just define the size we expect to fail with
> > ENOMEM to 1<<30 and that would save us from this architecture specific
> > trickery that will probably fail on stranger architectures anyway.
> On 64kb page size, it will over 1 <<30 for ENOMEM error .I think we can 
> test MAX_SIZE+pg_size(< 1<<31) for ENOMEM error. If  beyond 1<<31, 
> expect EINVAL error.

Hmm, maybe we can just double the size in a loop until we hit either
ENOMEM or EINVAL then and fail the test if we hit them too soon.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
