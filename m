Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B0298A90
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 11:42:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E29AF3C312F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 11:42:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 083AB3C25A0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 07:02:21 +0200 (CEST)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D2E371000D51
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 07:02:18 +0200 (CEST)
IronPort-SDR: QAKYNTm+l4UoLiH+Q47vkgTLNPsF+n/UldEjJPAJnmXb/OKTqGgdGx10QUD8OZ4ElNDlOROvUT
 F+hu03NY9vFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="155413442"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="155413442"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 22:02:15 -0700
IronPort-SDR: 7Day5D5KPL2/noKOCrxgfsCyMurAxXkzfTj5J0GV0BS3bePPACh7pdn5rGhilSEUDVqYQNYw7j
 kzNa5DgChLHA==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="466940929"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 22:02:15 -0700
Date: Thu, 22 Oct 2020 22:02:14 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20201023050214.GG23681@linux.intel.com>
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 26 Oct 2020 11:42:14 +0100
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
Cc: zenglg.jy@cn.fujitsu.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, X86 ML <x86@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Vyukov <dvyukov@google.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 22, 2020 at 08:05:05PM -0700, Linus Torvalds wrote:
> On Thu, Oct 22, 2020 at 6:36 PM Daniel D=EDaz <daniel.diaz@linaro.org> wr=
ote:
> >
> > The kernel Naresh originally referred to is here:
> >   https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/
> =

> Thanks.
> =

> And when I started looking at it, I realized that my original idea
> ("just look for __put_user_nocheck_X calls, there aren't so many of
> those") was garbage, and that I was just being stupid.
> =

> Yes, the commit that broke was about __put_user(), but in order to not
> duplicate all the code, it re-used the regular put_user()
> infrastructure, and so all the normal put_user() calls are potential
> problem spots too if this is about the compiler interaction with KASAN
> and the asm changes.
> =

> So it's not just a couple of special cases to look at, it's all the
> normal cases too.
> =

> Ok, back to the drawing board, but I think reverting it is probably
> the right thing to do if I can't think of something smart.
> =

> That said, since you see this on x86-64, where the whole ugly trick with =
that
> =

>    register asm("%"_ASM_AX)
> =

> is unnecessary (because the 8-byte case is still just a single
> register, no %eax:%edx games needed), it would be interesting to hear
> if the attached patch fixes it. That would confirm that the problem
> really is due to some register allocation issue interaction (or,
> alternatively, it would tell me that there's something else going on).

I haven't reproduced the crash, but I did find a smoking gun that confirms =
the
"register shenanigans are evil shenanigans" theory.  I ran into a similar t=
hing
recently where a seemingly innocuous line of code after loading a value int=
o a
register variable wreaked havoc because it clobbered the input register.

This put_user() in schedule_tail():

   if (current->set_child_tid)
           put_user(task_pid_vnr(current), current->set_child_tid);

generates the following assembly with KASAN out-of-line:

   0xffffffff810dccc9 <+73>: xor    %edx,%edx
   0xffffffff810dcccb <+75>: xor    %esi,%esi
   0xffffffff810dcccd <+77>: mov    %rbp,%rdi
   0xffffffff810dccd0 <+80>: callq  0xffffffff810bf5e0 <__task_pid_nr_ns>
   0xffffffff810dccd5 <+85>: mov    %r12,%rdi
   0xffffffff810dccd8 <+88>: callq  0xffffffff81388c60 <__asan_load8>
   0xffffffff810dccdd <+93>: mov    0x590(%rbp),%rcx
   0xffffffff810dcce4 <+100>: callq  0xffffffff817708a0 <__put_user_4>
   0xffffffff810dcce9 <+105>: pop    %rbx
   0xffffffff810dccea <+106>: pop    %rbp
   0xffffffff810dcceb <+107>: pop    %r12

__task_pid_nr_ns() returns the pid in %rax, which gets clobbered by
__asan_load8()'s check on current for the current->set_child_tid dereferenc=
e.

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
