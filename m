Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6B2967D5
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 02:11:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACBC93C5698
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 02:11:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 111623C25A0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 02:11:27 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 335EC200764
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 02:11:26 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id v6so4426152lfa.13
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 17:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XLY21JX5I5QFlC2bkVrjYFHPFnXicdIVDS29HVXeTok=;
 b=ddTlNlNRb6Gcq+pCD2VGDDviUyFdWgS4SI2rZqCTe7qisSD40rk3KGt9veIrursLjL
 d9JYYxPwhKyRBZiDDXgH7+i9ioZ8pfkB5+In9+v4mNHAG0/A90ekmx23hwMClIRCkpK1
 XSJMBceXPy08U1FnD050q7PGqsmjLolxNxCak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XLY21JX5I5QFlC2bkVrjYFHPFnXicdIVDS29HVXeTok=;
 b=EHr3IBxZHjjNCku6a7gSvNuSpKz76tr1Uybi+VBS2D3Xr6cSBN/69ROH/aYn3vmhj6
 4vKjqp1rISP86FhYUTUSEPsU7IzfyFkaM6i6P2K+LMYautYAxZJM++jhwQy+TsM+Uvkk
 259kM3OE9MUDf6lUZ1cY9gobBfVFeVyI1QWWDdjybGYuEH6Y/vkgRIJwlzo/fv0NZExx
 /VQf8+OBfJbmzBSpOS0+Br/MNxLOxiY4s/EllcHUEiwc+ZCEWgUXK/7ray9s1RAwKpKt
 TBHaVyx77b0WKOu39O4fZXMY29yuSUGwMEyrFGuESmCtInhjwAfDkXmo4si1WbWVNfRU
 71YQ==
X-Gm-Message-State: AOAM531/BgrU2mgQtjZgT99J1qkvXY1y6EV1cgLCdlDRzOH5heGHGH/m
 3jx1Hduk9HI9O3omq7Oz0AzrI/RLYnbsxA==
X-Google-Smtp-Source: ABdhPJx3UoxJBtDufq7ysVHHS3BfGC9JBhEYbwSDO0glTjm44T9zxDsIg2zPY+pZW8rRTsoYonnFcw==
X-Received: by 2002:a19:c391:: with SMTP id t139mr1797021lff.298.1603411885521; 
 Thu, 22 Oct 2020 17:11:25 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id z14sm477311ljn.46.2020.10.22.17.11.24
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 17:11:25 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 184so4435777lfd.6
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 17:11:24 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr1503603lff.105.1603411884054; 
 Thu, 22 Oct 2020 17:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
In-Reply-To: <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Oct 2020 17:11:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
Message-ID: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 4:43 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Thanks. Very funky, but thanks. I've been running that commit on my
> machine for over half a year, and it still looks "trivially correct"
> to me, but let me go look at it one more time. Can't argue with a
> reliable bisect and revert..

Hmm. The fact that it only happens with KASAN makes me suspect it's
some bad interaction with the inline asm syntax change (and explains
why I've run with this for half a year without issues).

In particular, I wonder if it's that KASAN causes some reload pattern,
and the whole

     register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);
..
     asm volatile(.. "r" (__val_pu) ..)

thing causes problems. That's an ugly pattern, but it's written that
way to get gcc to handle the 64-bit case properly (with the value in
%rax:%rdx).

It turns out that the decode of the user-mode SIGSEGV code is a
variation of system calls, ie

   0: b8 18 00 00 00        mov    $0x18,%eax
   5: 0f 05                syscall
   7: 48 3d 01 f0 ff ff    cmp    $0xfffffffffffff001,%rax
   d: 73 01                jae    0x10
   f:* c3                    retq    <-- trapping instruction

or

   0: 41 52                push   %r10
   2: 52                    push   %rdx
   3: 4d 31 d2              xor    %r10,%r10
   6: ba 02 00 00 00        mov    $0x2,%edx
   b: be 80 00 00 00        mov    $0x80,%esi
  10: 39 d0                cmp    %edx,%eax
  12: 75 07                jne    0x1b
  14: b8 ca 00 00 00        mov    $0xca,%eax
  19: 0f 05                syscall
  1b: 89 d0                mov    %edx,%eax
  1d: 87 07                xchg   %eax,(%rdi)
  1f: 85 c0                test   %eax,%eax
  21: 75 f1                jne    0x14
  23:* 5a                    pop    %rdx <-- trapping instruction
  24: 41 5a                pop    %r10
  26: c3                    retq

so in both cases it looks like 'syscall' returned with a bad stack pointer.

Which is certainly a sign of some code generation issue.

Very annoying, because it probably means that it's compiler-specific
too. And that "syscall 018" looks very odd. I think that's
sched_yield() on x86-64, which doesn't have any __put_user() cases at
all..

Would you mind sending me the problematic vmlinux file in private (or,
likely better - a pointer to some place I can download it, it's going
to be huge).

                      Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
