Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 957C25F905
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 15:19:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D36F3C1DA7
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 15:19:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 64B6F3C1D3C
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 15:19:07 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 71C371400216
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 15:19:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E346B307D91E;
 Thu,  4 Jul 2019 13:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB4201001DC3;
 Thu,  4 Jul 2019 13:19:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3CF018433A0;
 Thu,  4 Jul 2019 13:19:05 +0000 (UTC)
Date: Thu, 4 Jul 2019 09:19:02 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <594163584.31676743.1562246342334.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190704130119.GA11421@rei.lan>
References: <47b8b48060353711ff8d3695a7d3702f1aced12a.1562224996.git.jstancek@redhat.com>
 <20190704130119.GA11421@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.29]
Thread-Topic: direct_io: diotest4: fix mips MAP_SHARED/MAP_FIXED mmap
Thread-Index: sZhT1cFUhaP4mDovKViZ2Eqgsv9nzQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 04 Jul 2019 13:19:05 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] direct_io: diotest4: fix mips
 MAP_SHARED/MAP_FIXED mmap
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



----- Original Message -----
> Hi!
> > diff --git a/include/lapi/mmap.h b/include/lapi/mmap.h
> > index 18547c0d47ed..98b6ade1e2ab 100644
> > --- a/include/lapi/mmap.h
> > +++ b/include/lapi/mmap.h
> > @@ -19,6 +19,8 @@
> >  #ifndef LAPI_MMAP_H__
> >  #define LAPI_MMAP_H__
> >  
> > +#include "config.h"
> > +
> >  #ifndef MAP_HUGETLB
> >  # define MAP_HUGETLB 0x40000
> >  #endif
> 
> Huh, this looks completely unrelevant to the patch itself, or do I miss
> something?

This fixes the original problem of bad alignment.
Hunk below improves on it by removing MAP_FIXED altogether.

I could split it into 2 patches, if you prefer that.

> 
> > diff --git a/testcases/kernel/io/direct_io/diotest4.c
> > b/testcases/kernel/io/direct_io/diotest4.c
> > index e4616e400abd..bf200cd41a27 100644
> > --- a/testcases/kernel/io/direct_io/diotest4.c
> > +++ b/testcases/kernel/io/direct_io/diotest4.c
> > @@ -352,18 +352,14 @@ int main(int argc, char *argv[])
> >  	total++;
> >  
> >  	/* Test-10: read, write to a mmaped file */
> > -	shm_base = (char *)(((long)sbrk(0) + (shmsz - 1)) & ~(shmsz - 1));
> > -	if (shm_base == NULL) {
> > -		tst_brkm(TBROK, cleanup, "sbrk failed: %s", strerror(errno));
> > -	}
> >  	offset = 4096;
> >  	count = bufsize;
> >  	if ((fd = open(filename, O_DIRECT | O_RDWR)) < 0) {
> >  		tst_brkm(TBROK, cleanup, "can't open %s: %s",
> >  			 filename, strerror(errno));
> >  	}
> > -	shm_base = mmap(shm_base, 0x100000, PROT_READ | PROT_WRITE,
> > -			MAP_SHARED | MAP_FIXED, fd, 0);
> > +	shm_base = mmap(0, 0x100000, PROT_READ | PROT_WRITE,
> > +			MAP_SHARED, fd, 0);
> >  	if (shm_base == (caddr_t) - 1) {
> >  		tst_brkm(TBROK, cleanup, "can't mmap file: %s",
> >  			 strerror(errno));
> 
> Agree here, the part that computes the mmap addres based on the sbrk()
> output looks completely bogus to me.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
