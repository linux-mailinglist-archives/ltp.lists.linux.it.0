Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DEF393224
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 17:14:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62A163C9924
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 17:14:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D34E93C5767
 for <ltp@lists.linux.it>; Thu, 27 May 2021 17:14:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 454EF20101F
 for <ltp@lists.linux.it>; Thu, 27 May 2021 17:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622128485;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0vhWAbNKAEGOfEC8pVrumL2VCIKUo7gAx5bQNKtsn4=;
 b=GaFy5E1CAGEZkb9UtSuDwSZjpdAhuC3/exgOpw3lf9U8YJl9A+tVXEiNXuUWHgpa2AyMxv
 vMQdPl48dnUm3XyLr1SGyzH6LJoKuNdzduTpPY0wurm/t8xDkQXHgqnOM44tVrSmyHePBg
 fqOz9l26TuXmFeQUVyoLzUw+Y1zCuOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622128485;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T0vhWAbNKAEGOfEC8pVrumL2VCIKUo7gAx5bQNKtsn4=;
 b=zQEDDt8+dntmsmHzmws0paG2Lyg99Jx3Im6CgedS7Plj6jIF5TiCLQ21Y2uG1NG/N+MOax
 Pr1lkusyqAt8wTBA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F6F9AE95;
 Thu, 27 May 2021 15:14:45 +0000 (UTC)
References: <20210521102528.21102-1-rpalethorpe@suse.com>
 <20210521102528.21102-6-rpalethorpe@suse.com>
 <CAEemH2cqGGJuF56LpVO9egB7eLLCLdcXKaVA_2dkFRFmN8=jKw@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2cqGGJuF56LpVO9egB7eLLCLdcXKaVA_2dkFRFmN8=jKw@mail.gmail.com>
Date: Thu, 27 May 2021 16:14:44 +0100
Message-ID: <87mtsgjjiz.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/6] API/cgroups: tst_require fail gracefully
 with unknown controller
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
> On Fri, May 21, 2021 at 6:26 PM Richard Palethorpe via ltp
> <ltp@lists.linux.it> wrote:
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  lib/tst_cgroup.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
>> index 74746f13e..6d94ea41c 100644
>> --- a/lib/tst_cgroup.c
>> +++ b/lib/tst_cgroup.c
>> @@ -599,6 +599,12 @@ void tst_cgroup_require(const char *const ctrl_name,
>>         struct cgroup_ctrl *const ctrl = cgroup_find_ctrl(ctrl_name);
>>         struct cgroup_root *root;
>>
>> +       if (!ctrl) {
>> +               tst_brk(TBROK, "'%s' controller is unknown to LTP", ctrl_name);
>> +               tst_brk(TBROK, "Calling %s in cleanup?", __func__);
>> +               return;
>
> It'd never go here to perform a return because the first tst_brk
> will break the test directly. And, I don't know why we need the
> second tst_brk to show calling in cleanup, is that possible?

It can return if it is called during cleanup. tst_cgroup_require should
not be called from cleanup. However someone can do it by accident.

We probably need two versions of tst_brk. One which can return if called
from cleanup and one which does not. I suspect most tst_brk callers
assume it will not return. It is really only some safe library functions
which can handle that.



>
>
>> +       }
>> +
>>         if (!options)
>>                 options = &default_opts;
>>
>> --
>> 2.31.1
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
