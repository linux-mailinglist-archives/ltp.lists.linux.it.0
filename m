Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 062BE95963
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 10:25:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B75AE3C1D01
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 10:25:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C60193C18F8
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 10:25:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BDA76200C6A
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 10:25:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D6F4ABBE
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 08:25:06 +0000 (UTC)
References: <20190812143941.8119-1-chrubis@suse.cz>
 <20190812143941.8119-2-chrubis@suse.cz> <877e79wmme.fsf@rpws.prws.suse.cz>
 <20190819124159.GA11715@rei.lan>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20190819124159.GA11715@rei.lan>
Date: Tue, 20 Aug 2019 10:25:06 +0200
Message-ID: <8736hww8f1.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 01/11] lib: Add support for guarded buffers
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
>> We could add guarded buffers to huge numbers of tests by wrapping the
>> user supplied buffer in various calls to SAFE_* macros and tst_*
>> functions. This could be configurable at compile time and it should be
>> detectable if a buffer is already guarded, so double wrapping should not
>> be an issue.
>
> Fair point. The detection would however be O(n), well we can do a little
> trick like maintaing the memory range in which all the mmaps were done
> and rule out any heap based allocation in O(1) easily, but anything that
> crosses the malloc threshold would be O(n).
>
>> However I am not sure the current API makes this easy. We should
>> probably have a tst_free(void *buf) and/or tst_buffer_alloc(struct
>> tst_buffer *buf) and tst_buffer_free(struct tst_buffer *buf) (which
>> could just put the buffer on a free list for reuse).
>
> I guess that this calls for completely different API since 99% time we
> will do with just single buffer.
>
> Unless we are:
>
> * The test is compiled with pthreads
>   and we managed to run two SAFE_MACROS() concurently
>
> * The buffer is bigger than one page
>
> * We call SAFE_MACROS() recursively, which we don't
>
> So all of this could be done by a tst_temp_alloc() and tst_temp_free()
> that would attempt to grab single pre-allocated buffer and only fall
> back to allocating/freeing new buffer when the buffer is currently in
> use.
>
>> I am not sure if this is something which needs to be addressed now or
>> can be left for another patch set. My main concern is that one of the
>> existing API functions will need to be changed.
>
> I guess that it would be easier to make these changes incrementally,
> because adding more functionality to this patchset would only make it
> harder to review and I would like to get this API in so that we can
> star making use of it.

OK, I am happy with this patchset except for the few minor comments on
the docs.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
