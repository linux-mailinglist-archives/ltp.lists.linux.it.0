Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A22FB609
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 13:15:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A7753C309B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 13:15:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2A5CC3C3071
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 13:15:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1AC771A00CBD
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 13:15:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 835A4AB9F;
 Tue, 19 Jan 2021 12:15:11 +0000 (UTC)
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <20201216100121.16683-3-rpalethorpe@suse.com>
 <CAEemH2ddomP4XO=61vNx5=3vQYNj4WOurUX2zcuC-46RxhMk0g@mail.gmail.com>
 <87eej1dpgm.fsf@suse.de>
 <CAEemH2diKwkvjZ=20+MGpNJsWzM3OskDbcyuY7MH3tEsGV4U=Q@mail.gmail.com>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2diKwkvjZ=20+MGpNJsWzM3OskDbcyuY7MH3tEsGV4U=Q@mail.gmail.com>
Date: Tue, 19 Jan 2021 12:15:10 +0000
Message-ID: <87eeihp1gx.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/5] CGroup API rewrite
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

> On Mon, Jan 4, 2021 at 5:24 PM Richard Palethorpe <rpalethorpe@suse.de>
> wrote:
>
>> Hello Li,
>>
>> Li Wang <liwang@redhat.com> writes:
>>
>> >>
>> >
>> > As I was mentioned in 0/5 that maybe we should create test_cgroup_dir
>> > for different progress so that the test could use the same controller
>> with
>> > various configurations in parallel.
>> >
>> > e.g. child_1 set SIZE to memory.limit_in_bytes
>> >        child_2 set SIZE/2 to memory.limit_in_bytes
>> >
>> > Any possibility to move this to tst_cgroup_move_current?
>>
>> Yes I suppose we can try this. Is there a test which already requires it?
>>
>
> So far we don't have such a test, I remember that in the previous Lib is
> also to keep expandability.

I think we have at least two problems:

1) This allows many CGroups to be created for each test and we must
   clean them up, adding some complication.

2) It's not clear if a future test will require the CGroup hierarchy to
   be the same as the process hierarchy or different. Depending what
   behaviour for tst_cgroup_move_current we choose it will make some
   configurations impossible.

So if we add this then it will add complexity, but I am not sure it will
help in the future. If we make it flexible enough to support any
hierarchy this will add a lot of complication.

Also if we did need this feature in the future, then we can add some new
functions which take a sub-group (or hierarchy) parameter. e.g.

void tst_cgroup_move(enum tst_cgroup_ctrl type, pid_t pid,
                     struct tst_cgroup_tree *path);

Alternate versions of other functions would also need to be added. Also
some changes to the internal data structures may be needed. However it
would keep the current API functions simple.

So until we have a test which requires this, I think the best option is
to do nothing :-)

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
