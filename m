Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE35E0392
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:05:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB7B63C2208
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:05:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 78A3E3C12EB
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:05:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7944B600B05
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:05:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE55BAC93;
 Tue, 22 Oct 2019 12:05:26 +0000 (UTC)
References: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
Date: Tue, 22 Oct 2019 14:05:26 +0200
Message-ID: <87ftjlnfy1.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Bug report in read_all.c
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
Cc: Cyril Hrubis <chrubis@suse.com>, Xiang Li <lixian@qti.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Xiang Li <lixian@qti.qualcomm.com> writes:

> Hi,
>
> I would like to report a bug I found lately in LTP testcase source code.
> The bug is located at: https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/read_all/read_all.c#L123
> This bug may cause the read_all testcase terminated unexpectedly before the reading thread complete its job.
>
> In the source code, at the end of the function queue_pop(), it stores i + 1 into the q->front to update the front indicator.
> But under some circumstances it will store 16384 which is the default length of the queue size.
> When this happens, the next time queue_pop() is called, it will perform a read action that overstep the array boundary which is q->data[16384].
> If the value stored there is 0, the queue_pop() will immediately return 0 and the whole testcase is broken.
> This happens when there is a whole file path stores exactly at the end of the data array. In this situation, i equals 16383 when while() ends.
>
> Modifying i + 1 to (i + 1) % QUEUE_SIZE at the source code Line#123 can easily fix it.
> This bug is not triggered on every machine because the files are different between target machine.
> Adjust the length of the QUEUE_SIZE will help you reproduce this bug.

Thanks! This looks correct. Also we can replace

if (++i >= QUEUE_SIZE)
   i = 0;

with

i = (i + 1) % QUEUE_SIZE;

for consistency
	

>
>
> Regards,
> Xiang


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
