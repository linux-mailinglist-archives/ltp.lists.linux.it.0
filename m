Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 615547FC51
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 16:36:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 088783C207D
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 16:36:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E3EFB3C1E27
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 16:36:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BCE98141C41D
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 16:36:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13C96B603
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 14:36:06 +0000 (UTC)
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-2-chrubis@suse.cz>
 <1879623564.3992300.1564655982672.JavaMail.zimbra@redhat.com>
 <87a7crd606.fsf@rpws.prws.suse.cz> <20190802135944.GA17684@rei>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20190802135944.GA17684@rei>
Date: Fri, 02 Aug 2019 16:36:06 +0200
Message-ID: <877e7vd489.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
>> >> This commit adds a support for guarder buffers. Guarded buffer is a
>> >> buffer allocated so that there is PROT_NONE page immediatelly after the
>> >> end of the buffer i.e. any access after the buffer generates
>> >> SEGFAULT/EFAULT etc.
>> >> 
>> >> The library is hooked into the tst_test structure so that all you need
>> >> is to fill up an NULL terminated array of buffer pointers and sizes to
>> >> get the respective buffers allocated. The library supports allocating
>> >> memory in test runtime as well as well as allocating more complex
>> >> buffers, which currently are iovec vectors.
>> >
>> > Runtime alloc in loop could be an issue, do we need also runtime free?
>> 
>> I think tst_alloc needs a bit more documentation at the least.
>
> I will write an paragraph to test-writing-guidelines.txt about this
> functionality.
>
>> If we have runtime free then we need to figure out which map the
>> address belongs to or what its offset is (if any).
>
> That's easy, we will store the returned pointer to the map structure
> and use it for comparsion...

So that free() is an O(n) operation where n is the number of maps or you
will use a hash map to make it O(1)?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
