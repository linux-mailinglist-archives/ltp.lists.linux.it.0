Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC557DAB3
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 13:54:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 664973C201D
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 13:54:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 09A693C1E0D
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 13:54:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3E1DC600BDC
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 13:54:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 07030AF0B;
 Thu,  1 Aug 2019 11:54:19 +0000 (UTC)
Date: Thu, 1 Aug 2019 13:54:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190801115418.GB23916@rei>
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-3-chrubis@suse.cz>
 <1516778317.3992530.1564656190448.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1516778317.3992530.1564656190448.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/9] lib: Add a canary for guarded buffers
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
> > In a case that the buffer size is not a multiple of a page size there is
> > unused space before the start of the buffer. Let's fill that with
> > center mirrored random bytes and check that the buffer wasn't modified
> > before we unmap it.
> > 
> >  void *tst_alloc(size_t size)
> >  {
> >  	size_t page_size = getpagesize();
> > @@ -34,9 +61,13 @@ void *tst_alloc(size_t size)
> >  	maps = map;
> >  
> >  	if (size % page_size)
> > -		ret += page_size - (size % page_size);
> > +		map->buf_shift = page_size - (size % page_size);
> > +	else
> > +		map->buf_shift = 0;
> > +
> > +	setup_canary(map);
> >  
> > -	return ret;
> > +	return ret + map->buf_shift;
> 
> My concern here is alignment.

I'm aware of that. My reasoning here is that:

* The end of the page is aligned by definition to 2^page_order

* Any primitive types such as integer, etc. are hence aligned

* Structures are padded so that the total size is multiple of
  the largest alignment required (because otherwise arrays of
  structures would end up causing unaligned access as well).

That leaves out things such as buffers for direct I/O, the only way to
allocate aligned buffers there is to make the size to be multiple of
the block size.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
