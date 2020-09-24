Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B88EB277389
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 16:05:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 644363C4D8D
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 16:05:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CBF853C28E2
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 16:05:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 77A4B6011DE
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 16:05:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5906AC4C;
 Thu, 24 Sep 2020 14:05:55 +0000 (UTC)
References: <20200924111124.5666-1-rpalethorpe@suse.com>
 <CAEemH2eDPzfdUR78d_mSuaDgi=v1RuboDotNwAGrLHCCg1Q41A@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2eDPzfdUR78d_mSuaDgi=v1RuboDotNwAGrLHCCg1Q41A@mail.gmail.com>
Date: Thu, 24 Sep 2020 15:05:55 +0100
Message-ID: <877dsjxoak.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_cgroup: Don't try to use V2 if V1 controllers
 are mounted
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
Cc: Pter Vorel <pvorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

> Hi Richard,
>
> On Thu, Sep 24, 2020 at 7:11 PM Richard Palethorpe <rpalethorpe@suse.com>
> wrote:
>
>> It is not possible to use a controller in V2 cgroups if it has been
>> mounted as a V1 controller. So if V1 is mounted we use it regardless
>> of if V2 is available.
>>
>> We have to include a space in tst_is_mounted so that we do not match
>> cgroup2.
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  lib/tst_cgroup.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
>> index ba413d874..73ddd4b82 100644
>> --- a/lib/tst_cgroup.c
>> +++ b/lib/tst_cgroup.c
>> @@ -44,7 +44,7 @@ enum tst_cgroup_ver tst_cgroup_version(void)
>>          enum tst_cgroup_ver cg_ver;
>>
>>          if (tst_cgroup_check("cgroup2")) {
>> -                if (!tst_is_mounted("cgroup2") &&
>> tst_is_mounted("cgroup"))
>> +                if (tst_is_mounted("cgroup "))
>>
>
> Add a space in the suffix still not work as expected.
>
> The reason is that tst_is_mounted("cgroup ") also get non-zero return if
> system only mount cgroup_v2, which lead to choose cgroup_v1 in LTP test.
>
> # cat /proc/mounts |grep cgroup
> cgroup2 /sys/fs/cgroup cgroup2 rw,seclabel,nosuid,nodev,noexec,relatime 0 0

I wonder if it would be better to simply try mounting/using V2 and if
that fails try V1?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
