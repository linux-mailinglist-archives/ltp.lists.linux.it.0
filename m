Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E592967EC
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 02:29:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9FC13C5699
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 02:29:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EBCE33C25A0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 02:28:59 +0200 (CEST)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 73F80600C98
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 02:28:59 +0200 (CEST)
Received: by mail-ed1-x544.google.com with SMTP id dn5so3552309edb.10
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 17:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKRAxIo6c5FisvVeBU9yqsWIDr+qdhruysORLXOncrM=;
 b=bS2jLvh7vQ7kVcl9lNidPdK72YodR3TdlvHITcAlNYbV1H5WvtWBHkH3n72zN5qksn
 hhTGaYZupVEqQDijLXzlvu27kjGqNTTSQHebcdWKhIDs1IxhBoQmiF2fzAUbTd+hIJwi
 P6mCkiBawvH/9GPgqnfBayA/RDSiwcxFNhm+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKRAxIo6c5FisvVeBU9yqsWIDr+qdhruysORLXOncrM=;
 b=lJZlWS5ntihhCsWilEaL+GKynVy+++skoCU0dFe562w0SWp8oLJAsBkoSt5Zhmtz/Z
 xAEyqWLFzWZGrlTWIiFhPvavMuSRRc4LpDULHATmGOzdqbqT+jz0rn1I2YMo/f5nJB2m
 kNxCiPNl+t3ZEv07eA3Vzr49YsCirjE5ZGOGqKtp6UCvLRVAlnQL3yk2DWmJPsSzSeaW
 RfDB3uE/eu0YcCXhKh5QV25i3h863eCfbGizTB2+m/22v7JWrEU/227IPiTS1VMTSvrl
 Bu7oiX58yS79In1aGgFhh7jKCB1oEMwbXsB3XGBf+81q+Daq6//eqMhSuviMoJp7IRDO
 ccqA==
X-Gm-Message-State: AOAM530KmDypynCADjFzt0ZSJ3Om9/hwx5T4UYW85YNAKe5nPr6e/5Wi
 THLGb/I9e2PRZewxTSO5ypgrxRNM4Y2T7w==
X-Google-Smtp-Source: ABdhPJzxdwV3OFQi9rzWqjIU6u+e2Z22tPIX18ZmPJqPIXzu0mhqsmmG+5P++jnjywfyYxaHpFiBJQ==
X-Received: by 2002:a05:6402:943:: with SMTP id
 h3mr4614710edz.88.1603412938625; 
 Thu, 22 Oct 2020 17:28:58 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49])
 by smtp.gmail.com with ESMTPSA id a27sm1603931ejb.67.2020.10.22.17.28.57
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 17:28:57 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a3so4979063ejy.11
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 17:28:57 -0700 (PDT)
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr1747084ljp.421.1603412592176; 
 Thu, 22 Oct 2020 17:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
In-Reply-To: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Oct 2020 17:22:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgeHE7AS2Q4kPrkC5dMqfx_6+E84+FcEDYJSTugxqivUA@mail.gmail.com>
Message-ID: <CAHk-=wgeHE7AS2Q4kPrkC5dMqfx_6+E84+FcEDYJSTugxqivUA@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

On Thu, Oct 22, 2020 at 5:11 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> In particular, I wonder if it's that KASAN causes some reload pattern,
> and the whole
>
>      register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);
> ..
>      asm volatile(.. "r" (__val_pu) ..)
>
> thing causes problems.

That pattern isn't new (see the same pattern and the comment above get_user).

But our previous use of that pattern had it as an output of the asm,
and the new use is as an input. That obviously shouldn't matter, but
if it's some odd compiler code generation interaction, all bets are
off..

                Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
