Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2634386615
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 17:41:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D24D13C1D1E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 17:41:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B35BA3C1C90
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 17:41:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A496110014D9
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 17:41:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C56E7AC2E
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 15:41:52 +0000 (UTC)
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-2-chrubis@suse.cz> <871rxyd5tc.fsf@rpws.prws.suse.cz>
 <20190808090635.GA11500@rei.lan>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20190808090635.GA11500@rei.lan>
Date: Thu, 08 Aug 2019 17:41:52 +0200
Message-ID: <87zhkjbr5r.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/9] lib: Add support for guarded buffers
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
>> > +void tst_free_all(void)
>> > +{
>> > +	struct map *i = maps;
>> > +
>> > +	while (i) {
>> > +		struct map *j = i;
>> > +		tst_res(TINFO, "Freeing %p %zu", i->addr, i->size);
>> 
>> This seems like debug info to me. Not really useful most of the time.
>
> Yes, this is a leftover.
>
> I do wonder if we should print a message first time the tst_alloc() is
> called so that it's clear that the test is using guarded buffers.

Maybe some summary info.

>
>> > +		SAFE_MUNMAP(i->addr, i->size);
>> > +		i = i->next;
>> > +		free(j);
>> > +	}
>> > +
>> > +	maps = NULL;
>> > +}
>> 
>> -- 
>> Thank you,
>> Richard.
>> 
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
