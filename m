Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECCB2967BB
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 01:50:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8DE53C5698
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 01:50:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DBC363C24AB
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 01:50:01 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 722D3200DB1
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 01:50:01 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id 23so3816299ljv.7
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 16:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZlkuWdQsWCC+a50v77gxrEMTeODSOjQWFOP4UJJDnk=;
 b=cUh4yK+PBHMfvd0jB2OsQ/bbtVKzuZXCL7HCSyczFYL0WDzRBvZVm9aGeWWIrYr1bV
 eQsOXOM/9NK6ZpiQfmHlPRe4enJaYE4/D8F89jSu64rneyt74YTf/zmuRNDcncLY9PbV
 vox7spklRgKMSQvRa+Z12H1g1wjSNh7DosrlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZlkuWdQsWCC+a50v77gxrEMTeODSOjQWFOP4UJJDnk=;
 b=d7AsgnAyxFfeTkv+ZnkK+2gz/k+nZ23f187m4aNJRlqY9tIgBpQ3d+NS2Bv/6mYrMp
 +L1bci7vw2RCFlbqLYhsxNpm43NZlw10V35Vcd+ixYgesNMl//3sbv+cdtBc2D8EDoMy
 h7Z810fgPBvFgHiUBJy3OWtUXRuBWiYaxRMLk8q1FKOeKDG8akuKMDO2/AihAxnyi5E2
 O09cGD8FdJdMoELty8aoC/6MCA7Z2meO5jlpZlxHBtqgzuhIIUU8C7uRdx+WlADaffeq
 uzSsHH16kFpMjaSTLCd4+PNU7R0Rxyr6cydwVQ4G6BXk41wZUpbbJalJgrcUGMDcez4n
 LU4g==
X-Gm-Message-State: AOAM532myH9msjeNmwnD/Y2A2JuuQPS4cx9r3oJspH9xbG1JM4AYUdxE
 2o6gYUINxdXg6J2lMRFnCbpZStTnMBKzlQ==
X-Google-Smtp-Source: ABdhPJwriedh2ERkm+DA8c4sY9vaS86s5f7QQ+vsKDbh07U5B6Yug/oEV07NDQwiFBW3DcLVycfCag==
X-Received: by 2002:a2e:9702:: with SMTP id r2mr2029818lji.360.1603410600487; 
 Thu, 22 Oct 2020 16:50:00 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id 26sm469999ljg.30.2020.10.22.16.50.00
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 16:50:00 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id a28so3836351ljn.3
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 16:50:00 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr2045832ljh.312.1603410225256; 
 Thu, 22 Oct 2020 16:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
In-Reply-To: <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Oct 2020 16:43:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
Message-ID: <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in
 libc-2.27.so[7f3d77058000+1aa000]
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, zenglg.jy@cn.fujitsu.com,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, X86 ML <x86@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-mm <linux-mm@kvack.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Dmitry Vyukov <dvyukov@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 22, 2020 at 1:55 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The bad commit points to,
>
> commit d55564cfc222326e944893eff0c4118353e349ec
> x86: Make __put_user() generate an out-of-line call
>
> I have reverted this single patch and confirmed the reported
> problem is not seen anymore.

Thanks. Very funky, but thanks. I've been running that commit on my
machine for over half a year, and it still looks "trivially correct"
to me, but let me go look at it one more time. Can't argue with a
reliable bisect and revert..

            Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
