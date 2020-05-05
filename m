Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADF1C59EE
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 16:47:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AB153C57F3
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 16:47:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 130CD3C296E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 16:47:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5AA0E140075D
 for <ltp@lists.linux.it>; Tue,  5 May 2020 16:47:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 242C7AB3D;
 Tue,  5 May 2020 14:47:37 +0000 (UTC)
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505133746.GB21884@dell5510>
User-agent: mu4e 1.4.1; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20200505133746.GB21884@dell5510>
Date: Tue, 05 May 2020 15:47:33 +0100
Message-ID: <87d07isaka.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] pty04: Use guarded buffers for transmission
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

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richard,
>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> BTW Every second run with this patch it blocks after pty04.c:214: PASS: Read netdev 1
> and then:
> tst_checkpoint.c:147: BROK: pty04.c:249: tst_checkpoint_wait(0, 10000): ETIMEDOUT (110)
> tst_test.c:373: BROK: Reported by child (26650)
> safe_macros.c:258: BROK: pty04.c:215: read(5,0x7efebc306001,8191) failed, returned -1: ENETDOWN (100)
> pty04.c:139: PASS: Writing to PTY interrupted by hangup
> tst_test.c:373: WARN: Reported by child (26648)
>
> Tested on 5.7.0-rc3 in Tumbleweed.
> But it looks this is not caused by this change, but was here before, because the
> same behavior I see when testing pty04 *without* this patch on various kernels
> (5.3.7, 5.6.0-rc5) and some of the never SLES (4.12 based).
>
> Kind regards,
> Petr

This looks similar to the issue reported by Jan:

https://github.com/linux-test-project/ltp/issues/674

Is this the full output?

Thinking aloud: the following (probably) happens when writing to the PTY

write() -> PTY -> SLIP/SLCAN -> netdev -> read()

Writing to the PTY causes the PTY to write to the line discipline. What
I found was that when the line discipline receive buffer got full and the PTY
send buffer got full. The write would go to sleep and never wake up
because the line discipline drained the receive buffer, but doesn't
signal it is ready for more data (with tty_unthrottle). So I used
nonblocking writes which just retry writing.

From Jan's errors it looks like it might just be reading that is failing
in one case and that writing is also failing in the other until we
cancel the read. I doubt this is anything to do with the netdev code
because it is generic networking code AFAICT and should work correctly
with blocking reads...

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
