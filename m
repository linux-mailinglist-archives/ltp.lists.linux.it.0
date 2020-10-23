Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B95452972EC
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 17:53:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6995C3C317C
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 17:53:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C59813C2620
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 17:53:11 +0200 (CEST)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8D5591001130
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 17:53:10 +0200 (CEST)
Received: by mail-lf1-x144.google.com with SMTP id l2so2689343lfk.0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=So975owvkkTFfYXQ470Q4DlssmIVIFu2QdqnJrTF8xg=;
 b=TzWUN3CTm+h3r1g9oyCsI8lQvw43xzR9vIG57jNVIMScon9dkhOPSHSU0YuPTCTEbW
 xSUTXNkTa/xHcxjOZm+H+owVFWXNWx30+II0u/JJDBaUgnHNJQKAZRQgLvSR8UT7JBoq
 5hUnMcwfEz4zN7MfPmgGe/s+oSgXWn8ttaA2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=So975owvkkTFfYXQ470Q4DlssmIVIFu2QdqnJrTF8xg=;
 b=IM9Z7DnTMwwt1q8Bs/DvntaAQsSTlJBbtv1neibA0TdO0Qmf3hMV81/3wc5siHXQfw
 8sS5ujNfida21O4GFBRn/rExqSw+qWmKosAi929FhWERnGD7zqEzJdwxWHKWu7qfm/ci
 Fr8iUsmT/v6wC1naLc+5XPZQmccIFa+LK5MgEmdGF2UQzlhGYlSVK9qQlm+qKKEJr0zT
 +2e9enbsUyT+ndIN7AbB8ZKm6hCU4JjVhA1UuAd+2QKu9JV6xuDhK04F8mFw4qUtYilk
 avVUqsvecLrg3eJjTkwr+naY0/0O0zBa6wHrmOBrrjQandQwVno6NMGyVLd8E/evPorT
 QGvA==
X-Gm-Message-State: AOAM530NLHRdwm0U14nu6WkZ2vqKPqfeZWSYwO9LW1/4HkFSQdqMKrNY
 WFlSSw8t/Qv5QVg8XYlZad8NKwh8HJlDeg==
X-Google-Smtp-Source: ABdhPJxk1mRD5905Nt0pc0DrJwDGaZi+uLzKjxizokAcmeNZeATV0qigOEtAtRKEl4zuZQsO1SW/NA==
X-Received: by 2002:ac2:5597:: with SMTP id v23mr1094538lfg.301.1603468389463; 
 Fri, 23 Oct 2020 08:53:09 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id z80sm177599lfc.190.2020.10.23.08.53.07
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 08:53:09 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id l2so2689175lfk.0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 08:53:07 -0700 (PDT)
X-Received: by 2002:a2e:898c:: with SMTP id c12mr1248002lji.285.1603468386475; 
 Fri, 23 Oct 2020 08:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com>
In-Reply-To: <20201023050214.GG23681@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2020 08:52:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjBjUvjN_Mw2Oo5XMUJFSREi3d9AHTSFmgp-a42ZH_K_w@mail.gmail.com>
Message-ID: <CAHk-=wjBjUvjN_Mw2Oo5XMUJFSREi3d9AHTSFmgp-a42ZH_K_w@mail.gmail.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 22, 2020 at 10:02 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> I haven't reproduced the crash, but I did find a smoking gun that confirms the
> "register shenanigans are evil shenanigans" theory.  I ran into a similar thing
> recently where a seemingly innocuous line of code after loading a value into a
> register variable wreaked havoc because it clobbered the input register.

Yup, that certainly looks like the smoking gun.

Thanks for finding an example of this, clearly I'll have to either go
back to the "conditionally use 'A' or 'a' depending on size" model, or
perhaps try Rasmus' patch.

              Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
