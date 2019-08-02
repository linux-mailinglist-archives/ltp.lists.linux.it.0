Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F907F23D
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 11:47:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E31FF3C1E12
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 11:47:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 63EF83C1DFC
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 11:47:11 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0861120298D
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 11:47:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 415DAB066;
 Fri,  2 Aug 2019 09:47:09 +0000 (UTC)
Date: Fri, 2 Aug 2019 11:47:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190802094708.GA27727@rei>
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-3-chrubis@suse.cz>
 <1516778317.3992530.1564656190448.JavaMail.zimbra@redhat.com>
 <20190801115418.GB23916@rei>
 <1801920982.4081964.1564677172725.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1801920982.4081964.1564677172725.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
> > I'm aware of that. My reasoning here is that:
> > 
> > * The end of the page is aligned by definition to 2^page_order
> > 
> > * Any primitive types such as integer, etc. are hence aligned
> > 
> > * Structures are padded so that the total size is multiple of
> >   the largest alignment required (because otherwise arrays of
> >   structures would end up causing unaligned access as well).
> > 
> > That leaves out things such as buffers for direct I/O, the only way to
> > allocate aligned buffers there is to make the size to be multiple of
> > the block size.
> 
> I don't have concrete example at hand, but I foggily recall
> s390 issue from couple years back, where it didn't like odd addresses.
> Can't recall if it was data or code pointer.

Data should be fine as far as they are aligned accordingly to the type sizes.

I.e. one byte acces is fine on odd addresses, otherwise most of the
functions in string.h wouldn't work.

For shorts i.e. two byte integers odd addresses are slower on x86 and
x86_64 however does not work at all on many architectures. I remember
that 32bit arm used to have in-kernel emulation that mostly did the
right job but sometimes you got wrong results, so unaligned accesses are
better to be avoided.

The question is if kernel expects some alignment for buffers for things
such as read()/write() etc. I doubt so, since that would still break
things like write(fd, "aabbcc" + 1, 3) which I would expect is still
valid code.

Or do you have anything else in mind that may break?

> Could we apply/enforce some minimum alignment, similar to what glibc
> does for malloc?

That would be against the purpose of this patchset, i.e. catching
off-by-one bugs, since the page boundary would be a few bytes after the
end of the buffer in some cases. Well I guess that most of the
allocations would be as a matter of fact aligned and even these that are
not could be easily fixed by choosing buffers that are multiples of
four.

I would be fine with aligning the buffers for architectures that turn
out to be problematic if we find some. However I would like to avoid to
"just in case" modifications.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
