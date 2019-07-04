Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D55F9C0
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 16:08:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 927EB3C1D4E
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 16:08:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 89CD63C1D2E
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 16:08:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F2F911400BE7
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 16:08:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D8B6ACD8;
 Thu,  4 Jul 2019 14:08:50 +0000 (UTC)
Date: Thu, 4 Jul 2019 16:08:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190704140849.GB11528@rei.lan>
References: <47b8b48060353711ff8d3695a7d3702f1aced12a.1562224996.git.jstancek@redhat.com>
 <20190704130119.GA11421@rei.lan>
 <594163584.31676743.1562246342334.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <594163584.31676743.1562246342334.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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

Hi!
> > > diff --git a/include/lapi/mmap.h b/include/lapi/mmap.h
> > > index 18547c0d47ed..98b6ade1e2ab 100644
> > > --- a/include/lapi/mmap.h
> > > +++ b/include/lapi/mmap.h
> > > @@ -19,6 +19,8 @@
> > >  #ifndef LAPI_MMAP_H__
> > >  #define LAPI_MMAP_H__
> > >  
> > > +#include "config.h"
> > > +
> > >  #ifndef MAP_HUGETLB
> > >  # define MAP_HUGETLB 0x40000
> > >  #endif
> > 
> > Huh, this looks completely unrelevant to the patch itself, or do I miss
> > something?
> 
> This fixes the original problem of bad alignment.
> Hunk below improves on it by removing MAP_FIXED altogether.

Ah, that is needed for the HAVE_SYS_SHM_H.

> I could split it into 2 patches, if you prefer that.

Yes please, both are acked, so just push them.

> > > diff --git a/testcases/kernel/io/direct_io/diotest4.c
> > > b/testcases/kernel/io/direct_io/diotest4.c
> > > index e4616e400abd..bf200cd41a27 100644
> > > --- a/testcases/kernel/io/direct_io/diotest4.c
> > > +++ b/testcases/kernel/io/direct_io/diotest4.c
> > > @@ -352,18 +352,14 @@ int main(int argc, char *argv[])
> > >  	total++;
> > >  
> > >  	/* Test-10: read, write to a mmaped file */
> > > -	shm_base = (char *)(((long)sbrk(0) + (shmsz - 1)) & ~(shmsz - 1));
> > > -	if (shm_base == NULL) {
> > > -		tst_brkm(TBROK, cleanup, "sbrk failed: %s", strerror(errno));
> > > -	}
> > >  	offset = 4096;
> > >  	count = bufsize;
> > >  	if ((fd = open(filename, O_DIRECT | O_RDWR)) < 0) {
> > >  		tst_brkm(TBROK, cleanup, "can't open %s: %s",
> > >  			 filename, strerror(errno));
> > >  	}
> > > -	shm_base = mmap(shm_base, 0x100000, PROT_READ | PROT_WRITE,
> > > -			MAP_SHARED | MAP_FIXED, fd, 0);
> > > +	shm_base = mmap(0, 0x100000, PROT_READ | PROT_WRITE,
> > > +			MAP_SHARED, fd, 0);
> > >  	if (shm_base == (caddr_t) - 1) {
> > >  		tst_brkm(TBROK, cleanup, "can't mmap file: %s",
> > >  			 strerror(errno));
> > 
> > Agree here, the part that computes the mmap addres based on the sbrk()
> > output looks completely bogus to me.
> > 
> > --
> > Cyril Hrubis
> > chrubis@suse.cz
> > 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
