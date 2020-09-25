Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74A27872F
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 14:26:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90D4F3C3032
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 14:26:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E216E3C1841
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 14:26:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8E281600696
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 14:26:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB956AC5F;
 Fri, 25 Sep 2020 12:26:20 +0000 (UTC)
References: <20200924111124.5666-1-rpalethorpe@suse.com>
 <CAEemH2eDPzfdUR78d_mSuaDgi=v1RuboDotNwAGrLHCCg1Q41A@mail.gmail.com>
 <877dsjxoak.fsf@suse.de>
 <CAEemH2f_PdJABqTYF6JUH-BVAPO+1kH1AOK0b+x9gpvbELzVKA@mail.gmail.com>
 <874knmxq2y.fsf@suse.de>
 <CAEemH2e26TD5A2V8va6aBk1AaOiS65Qg9LK9YCr4gc+HPct4nA@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2e26TD5A2V8va6aBk1AaOiS65Qg9LK9YCr4gc+HPct4nA@mail.gmail.com>
Date: Fri, 25 Sep 2020 13:26:20 +0100
Message-ID: <871riqxcsz.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

> Richard Palethorpe <rpalethorpe@suse.de> wrote:
>
> ...
>> >> I wonder if it would be better to simply try mounting/using V2 and if
>> >> that fails try V1?
>> >>
>> >
>> > That will be work but not good, because if cgroup mount fails, how do we
>> > know it is a bug or not support?
>>
>> I think this is a valid point if you are writing a test for mounting
>> cgroups. However if we are testing something else then trying to guess
>> if cgroups should be available before using them, makes the test
>> fragile. I suppose we could check *after* trying to use the cgroups so
>> we can report some diagnostic info.
>>
>
> This sounds practicable, please feel free to work out the patch.

OK, I just sent a new patch. However there is no diagnostic info yet,
I'm not sure if actually it would be better to make a test specifically
checking if cgroups can be mounted and checking what is in filesystems
and mounts.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
