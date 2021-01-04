Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F432E926B
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 10:16:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A87753C31FE
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 10:16:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E15F43C0788
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 10:16:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 270711A0098C
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 10:16:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B7C6B459;
 Mon,  4 Jan 2021 09:16:51 +0000 (UTC)
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <CAEemH2dR+W8ypMED_xqw2JVO7E_Y0Kp+0iS=QVH_h2r0pDBVJA@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dR+W8ypMED_xqw2JVO7E_Y0Kp+0iS=QVH_h2r0pDBVJA@mail.gmail.com>
Date: Mon, 04 Jan 2021 09:16:50 +0000
Message-ID: <87h7nxdptp.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/5] CGroups
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

> Hi Richard,
>
> Thanks for your work, comments see below.

Thanks for the review!

>
> On Wed, Dec 16, 2020 at 6:02 PM Richard Palethorpe via ltp <
> ltp@lists.linux.it> wrote:
>
>> This is a request for comment on a new CGroups API. I have tried to
>> keep the existing API functions, but there are many changes in the
>> implementation. Please see the commit message to "CGroup API rewrite"
>> in this series.
>>
>> A previous failed attempt to correct some problems and discussion is
>> here: http://lists.linux.it/pipermail/ltp/2020-November/019586.html
>> This is a much bigger change than I would like, but CGroups make it
>> very difficult to do anything simply.
>>
>> I have done a direct conversion of the test cases to the new API, but
>> I am not sure that it makes sense to call tst_cgroup_move_current
>> within the run method of a test because after the first iteration it
>>
>
> Hmm, I feel that is a rare scenario in our real test. Mostly we
> just need to set it once in a process.

I suppose we can just move it into setup then?

>
> Also, another race condition we are facing is to set the same
> hierarchy in a different process parallel. i.e.
>
> // Child_1: set MEMSIZE maxbytes
> if (fork() == 0) {
>     tst_cgroup_move_current(TST_CGROUP_MEMORY);
>     tst_cgroup_mem_set_maxbytes(MEMSIZE);
> }
> // Child_2: set MEMSIZE/2 maxbytes
> if (fork() == 0) {
>     tst_cgroup_move_current(TST_CGROUP_MEMORY);
>     tst_cgroup_mem_set_maxbytes(MEMSIZE/2);
> }
>
> For the previous CGroup test-lib, we solved that via mount the
> same controller at different places. In this new CGroup lib, I guess
> creating dynamic directories in tst_cgroup_move_current might
> work for us, and I'll comment more about it in patch2/5.
>
>
>> will be a NOP. There is also the issue that on the unified hierarchy
>> when calling
>>
>> tst_cgroup_move_current(TST_CGROUP_MEMORY);
>> ... testing ...
>> tst_cgroup_move_current(TST_CGROUP_CPUSET);
>>
>> the second call is a NOP as there is only one CGroup, but when the
>> hierarchies are mounted seperately on V1 the current process will not
>> be added to cpuset CGroup until the second call. We probably do not
>> want different behaviour between commonly used hierarchies.
>>
>
> That's true, but it is mainly caused by different versions of
> CGroup. We could NOT unify the unsupported behavior, so
> maybe the wiser choice is to let _CPUSET test skipping(TCONF)
> directly on CGroup_V2?

Yes. I wonder if tst_cgroup_move_current should return a value to
indicate it was a NOP? Or maybe it should throw an error when called on
CGroup_V2 and it would have been a NOP?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
