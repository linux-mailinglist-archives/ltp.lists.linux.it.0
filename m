Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CF31A04E
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 15:09:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FBD53C8D4B
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 15:09:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3DBE53C6BA3
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 15:09:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CB7C01000D96
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 15:09:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 208E4B090
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 14:09:07 +0000 (UTC)
References: <20210211174543.25003-1-rpalethorpe@suse.com>
 <20210211174543.25003-6-rpalethorpe@suse.com> <YCaBOqMhTqNlRhH5@yuki.lan>
User-agent: mu4e 1.4.15; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YCaBOqMhTqNlRhH5@yuki.lan>
Date: Fri, 12 Feb 2021 14:09:06 +0000
Message-ID: <871rdl5qf1.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/5] close_range: Add test
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
> Pushed with small changes, thanks.
>
> * Added a runtest file entry
>
> * Add .needs_root which is what we have for tests that utilize loop
> devices

Ah, of course. I guess in that case we may also want to drop
CAP_SYS_ADMIN in caps.

>
> * Reformatted the top level comment so it's picked by docparser
>
> * Shortened the git hash to 12 characters, since that's what we have in
>   the rest of the tests
>

Ah, OK.

>
> Also we are missing simple test for a negative cases, that is:
>
> * Check that EINVAL is returned if we pass ~0 to flags
>
> * And check that EINVAL is returned when fd < fd_max as well
>
>
> And one more a bit more complicated test:
>
> We should also get EMFILE if we do CLOSE_RANGE_UNSHARE and the parent
> rlimit is exhausted.

Indeed those may be missing in the self tests as well.

>
>
> Will you write these tests as well, or should I have a look?

If you want to do it today very quickly, then feel free. Otherwise I
will do it next week.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
