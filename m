Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE627E03C
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 18:32:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6C943C2016
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 18:32:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 178EF3C1E27
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 18:32:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4B4521A00913
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 18:32:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36D6730C45BC;
 Thu,  1 Aug 2019 16:32:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CA27600C4;
 Thu,  1 Aug 2019 16:32:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6E6A1800202;
 Thu,  1 Aug 2019 16:32:52 +0000 (UTC)
Date: Thu, 1 Aug 2019 12:32:52 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1801920982.4081964.1564677172725.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190801115418.GB23916@rei>
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-3-chrubis@suse.cz>
 <1516778317.3992530.1564656190448.JavaMail.zimbra@redhat.com>
 <20190801115418.GB23916@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.4]
Thread-Topic: Add a canary for guarded buffers
Thread-Index: qf0yqtDc7hgbw/k51flL++LhliEE9w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 01 Aug 2019 16:32:53 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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



----- Original Message -----
> Hi!
> > > In a case that the buffer size is not a multiple of a page size there is
> > > unused space before the start of the buffer. Let's fill that with
> > > center mirrored random bytes and check that the buffer wasn't modified
> > > before we unmap it.
> > > 
> > >  void *tst_alloc(size_t size)
> > >  {
> > >  	size_t page_size = getpagesize();
> > > @@ -34,9 +61,13 @@ void *tst_alloc(size_t size)
> > >  	maps = map;
> > >  
> > >  	if (size % page_size)
> > > -		ret += page_size - (size % page_size);
> > > +		map->buf_shift = page_size - (size % page_size);
> > > +	else
> > > +		map->buf_shift = 0;
> > > +
> > > +	setup_canary(map);
> > >  
> > > -	return ret;
> > > +	return ret + map->buf_shift;
> > 
> > My concern here is alignment.
> 
> I'm aware of that. My reasoning here is that:
> 
> * The end of the page is aligned by definition to 2^page_order
> 
> * Any primitive types such as integer, etc. are hence aligned
> 
> * Structures are padded so that the total size is multiple of
>   the largest alignment required (because otherwise arrays of
>   structures would end up causing unaligned access as well).
> 
> That leaves out things such as buffers for direct I/O, the only way to
> allocate aligned buffers there is to make the size to be multiple of
> the block size.

I don't have concrete example at hand, but I foggily recall
s390 issue from couple years back, where it didn't like odd addresses.
Can't recall if it was data or code pointer.

Could we apply/enforce some minimum alignment, similar to what glibc
does for malloc?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
