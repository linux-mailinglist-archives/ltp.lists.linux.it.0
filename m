Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 643CE3F4C74
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 16:35:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B70B63C9E88
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 16:35:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2AB663C18F7
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 16:35:00 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AA04E1400F99
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 16:34:59 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 09EA31F41FB9
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Matthew Bobrowski <repnop@google.com>
Organization: Collabora
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
 <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
 <87fsvphksu.fsf@collabora.com>
 <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
 <YR+CH2+GYzwU2/SG@pevik> <YSAlb7XGUNoc73ZJ@google.com>
Date: Mon, 23 Aug 2021 10:34:54 -0400
In-Reply-To: <YSAlb7XGUNoc73ZJ@google.com> (Matthew Bobrowski's message of
 "Sat, 21 Aug 2021 07:58:07 +1000")
Message-ID: <87o89o2prl.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
Cc: kernel@collabora.com, Khazhismel Kumykov <khazhy@google.com>,
 Jan Kara <jack@suse.com>, Ext4 <linux-ext4@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Matthew Bobrowski <repnop@google.com> writes:

> Hey Gabriel,
>
> On Fri, Aug 20, 2021 at 12:21:19PM +0200, Petr Vorel wrote:
>> Hi all,
>> 
>> > No problem. That's what review is for ;-)
>> 
>> > BTW, unless anyone is specifically interested I don't think there
>> > is a reason to re post the test patches before the submission request.
>> > Certainly not for the small fixes that I requested.
>> 
>> > I do request that you post a link to a branch with the fixed test
>> > so that we can experiment with the kernel patches.
>> 
>> > I've also CC'ed Matthew who may want to help with review of the test
>> > and man page that you posted in the cover letter [1].
>> 
>> @Amir Thanks a lot for your review, agree with all you mentioned.
>> 
>> @Gabriel Thanks for your contribution. I'd also consider squashing some of the
>> commits.
>
> Is the FAN_FS_ERROR feature to be included within the 5.15 release? If so,
> I may need to do some shuffling around as these LTP tests collide with the
> ones I author for the FAN_REPORT_PIDFD series.
>

Matthew,

Hi, sorry for the delay.  I took a short vacation and couldn't follow
up.  I think it is too late for 5.15, please go ahead with
FAN_REPORT_PIDFD series and I will consider them in my future
submission.

Thank you,


-- 
Gabriel Krisman Bertazi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
