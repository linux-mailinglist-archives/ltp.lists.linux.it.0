Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C14FE1F4EB1
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 09:18:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94DB83C2E1B
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 09:18:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D50E43C0196
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 09:18:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3C5941A00EA4
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 09:18:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C69CAB76;
 Wed, 10 Jun 2020 07:18:14 +0000 (UTC)
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
 <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
 <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
 <ce8bd6c0-0abb-e09e-b21f-5e769ffd3ab3@linuxfoundation.org>
 <20200609195851.GA29515@x230>
 <8b3cbf25-83ad-42da-f3ec-e2bafdfff97c@linuxfoundation.org>
User-agent: mu4e 1.4.8; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Shuah Khan <skhan@linuxfoundation.org>
In-reply-to: <8b3cbf25-83ad-42da-f3ec-e2bafdfff97c@linuxfoundation.org>
Date: Wed, 10 Jun 2020 08:18:09 +0100
Message-ID: <874krjxuby.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
Cc: ltp@lists.linux.it, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Shuah Khan <skhan@linuxfoundation.org> writes:

> On 6/9/20 1:58 PM, Petr Vorel wrote:
>> Hi Shuah,
>>
>> ...
>>>> I don't have any particular comments.
>>>> I assume Richard tested it and it works. if so, it's fine with me :)
>>>> I don't have any concrete plans to use this at the moment. We have a
>>>> corpus of reproducers in syzkaller format and we can run these. This
>>>> should be more useful for kernel continuous integration systems and
>>>> distro testing.
>>
>>> Right. That is what I was thinking that this is more relevant for kernel
>>> developers, CI and distros.
>>
>>> Richard, Please send the patch for linux-arts to me once Petr gives it a
>>> try and I will apply it.
>> NOTE: this patch is for LTP. But maybe I miss something (some other patch for
>> linux-arts I overlooked).
>>
>
> Possibly I misread the
>
> V3:
> + Updated linux-arts commit (thanks Dmitry and Shuah for updating those!)
> + Fixed AC macro
>
> If this patch doesn't intend to update syzkaller-repo, there is
> nothing to do for linux-arts. I thought that this patch is for
> Dmitry's syzkaller repo I update from and looking get this into
> linux-arts directly.
>
> Since this is LTP patch, ignore my comments. Sorry for the noise.
>
> thanks,
> -- Shuah

No problem at all, I should have made that more clear.

Infact I will send a seperate patch to linux-arts mentioning the LTP
wrapper.
-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
