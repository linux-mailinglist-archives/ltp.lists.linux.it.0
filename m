Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA11A2002
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 13:40:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AE023C2D1F
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 13:40:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 906453C2D12
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 13:40:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 730601A0123F
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 13:40:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06DB2AF48;
 Wed,  8 Apr 2020 11:40:29 +0000 (UTC)
References: <20200408090635.4686-1-rpalethorpe@suse.com>
 <d950a46d-b65a-ac33-e71b-f93a2dce7620@cn.fujitsu.com>
 <1200091233.7615565.1586341144193.JavaMail.zimbra@redhat.com>
 <87v9maz1fj.fsf@our.domain.is.not.set>
 <1212083323.7622450.1586344729154.JavaMail.zimbra@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <87k12qyzmq.fsf@our.domain.is.not.set>
In-reply-to: <1212083323.7622450.1586344729154.JavaMail.zimbra@redhat.com>
Date: Wed, 08 Apr 2020 13:40:28 +0200
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] add_key05: Avoid race with key garbage
 collection
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
Cc: Li Wang <liwan@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Jan Stancek <jstancek@redhat.com> writes:

> ----- Original Message -----
>> Hello,
>> 
>> Jan Stancek <jstancek@redhat.com> writes:
>> 
>> > ----- Original Message -----
>> >> Hi Richard
>> >>
>> >> > The key subsystem independently tracks user info against UID. If a user
>> >> > is
>> >> > deleted and the UID reused for a new user then the key subsystem will
>> >> > mistake
>> >> > the new user for the old one.
>> >
>> > Thanks for raising this problem Richard. This matches CKI failure
>> > we seen recently. (CC Li and Rachel)
>> >
>> >> Does any documentation or kernel comment mentioned this? I didn't notice
>> >> this before.
>> >> >
>> >> > The keys/keyrings may not be accessible to the new user, but if they are
>> >> > not
>> >> > yet garbage collected (which happens asynchronously) then the new user
>> >> > may
>> >> > be
>> >> > exceeding its quota limits.
>> >> >
>> >> > This results in a race condition where this test can fail because the
>> >> > old
>> >> > thread keyring is taking up the full quota. We should be able to avoid
>> >> > this
>> >> > by
>> >> > creating two users in parallel instead of sequentially so that they have
>> >> > different UIDs.
>> >> I guess you may want to creat two user, so next, the key subsystem
>> >> think the new user is different from  the last deleting user. It can
>> >> avoid race.
>> >>
>> >> But you patch overrides ltpuser, in actually, we still use
>> >> ltp_add_key05_1 in SAFE_SETUID.
>> >>
>> >> Also, this patch doesn't handle delete user when we using -i parameters.
>> >
>> > -i might be problem, but other than that I think it works, at least for
>> > default run.
>> >
>> > Though I'm wondering, shouldn't the test delete keys it creates,
>> > rather than relying on garbage collection?
>> 
>> I'm assuming the keys are 'deleted' when the thread keyring is destroyed
>> when the child process exits. However they are not freed until later by
>> garbage collection (maybe I am confusing deferred freeing with 'garbage
>> collection'?).
>
> Do you know how large is the race window?
>
> Default /proc/sys/kernel/keys/gc_delay is 300, so if it's tied to this
> garbage collect, I'd expect it to fail almost all the time.

It doesn't appear to be tied to that.

>
>> 
>> We could explicitly delete/revoke the individual keys, but AFAICT there
>> would still be a race because freeing is still asynchronous. Ofcourse
>> there might be a reliable way to force freeing?
>
> gc_delay is only one I recall.
>
> If it's tied to process being around, I can try similar approach from 
> e747d0456adc ("syscalls/tgkill03: wait for defunct tid to get detached")
> where we wait for /proc/<pid>/task/<tid> to disappear.


This might work as the work is scheduled to be done in process context,
so the task may remain until the keys have been freed.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
