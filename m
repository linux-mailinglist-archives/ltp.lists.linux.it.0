Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E09DAE13CD
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 10:11:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DA943C2296
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 10:11:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6430B3C220B
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 10:11:49 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 76FAA600D0D
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 10:11:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34004BB82;
 Wed, 23 Oct 2019 08:11:47 +0000 (UTC)
References: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
 <20191022121222.GA15798@rei>
 <382857de8dca46e996b06ceb482cb911@apsanexr02f.ap.qualcomm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Xiang Li <lixian@qti.qualcomm.com>
In-reply-to: <382857de8dca46e996b06ceb482cb911@apsanexr02f.ap.qualcomm.com>
Date: Wed, 23 Oct 2019 10:11:47 +0200
Message-ID: <87d0enop8c.fsf@rpws.prws.suse.cz>
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Xiang Li <lixian@qti.qualcomm.com> writes:

> Hi,
>
> Thanks for Richard's suggestion. I've put it in the patch.
> Please check the attached patch file for review.

Thanks, LGTM.

However please do not send patches as attachments; we like to respond
with review comments inline.

>
> Regards,
> Xiang
>
>
> -----Original Message-----
> From: Cyril Hrubis <chrubis@suse.cz> 
> Sent: Tuesday, October 22, 2019 8:12 PM
> To: Xiang Li <lixian@qti.qualcomm.com>
> Cc: ltp@lists.linux.it
> Subject: [EXT] Re: [LTP] Bug report in read_all.c
>
> Hi!
>> Modifying i + 1 to (i + 1) % QUEUE_SIZE at the source code Line#123 can easily fix it.
>> This bug is not triggered on every machine because the files are different between target machine.
>> Adjust the length of the QUEUE_SIZE will help you reproduce this bug.
>
> Can you send a patch that I can apply (ideally with the suggestion from Ritchie as well)?


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
