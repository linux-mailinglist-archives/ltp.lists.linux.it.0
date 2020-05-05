Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E71C5A5A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:02:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92E573C57F3
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:02:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C4F513C2646
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:01:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 590DD200D1C
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:01:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E17AABE6;
 Tue,  5 May 2020 15:02:00 +0000 (UTC)
Date: Tue, 5 May 2020 17:01:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200505150155.GA3620@dell5510>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505133746.GB21884@dell5510>
 <87d07isaka.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d07isaka.fsf@our.domain.is.not.set>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

> This looks similar to the issue reported by Jan:

> https://github.com/linux-test-project/ltp/issues/674

> Is this the full output?
Yes, it's exactly the same issue. Thanks for info, I overlooked this bug.

> Thinking aloud: the following (probably) happens when writing to the PTY

> write() -> PTY -> SLIP/SLCAN -> netdev -> read()

> Writing to the PTY causes the PTY to write to the line discipline. What
> I found was that when the line discipline receive buffer got full and the PTY
> send buffer got full. The write would go to sleep and never wake up
> because the line discipline drained the receive buffer, but doesn't
> signal it is ready for more data (with tty_unthrottle). So I used
> nonblocking writes which just retry writing.

> From Jan's errors it looks like it might just be reading that is failing
> in one case and that writing is also failing in the other until we
> cancel the read. I doubt this is anything to do with the netdev code
> because it is generic networking code AFAICT and should work correctly
> with blocking reads...
Hm, I'm not familiar with the code, but also thing it's not netdev related.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
