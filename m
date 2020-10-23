Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3948296854
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 03:36:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5012F3C3242
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 03:36:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AB7993C24AB
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 03:36:35 +0200 (CEST)
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 033EB1400F2D
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 03:36:34 +0200 (CEST)
Received: by mail-oo1-xc44.google.com with SMTP id v123so874267ooa.5
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 18:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2+Di+znLFc6X0mmr/arvC7SPhODWgxA/Sv6sSuj9bqc=;
 b=VYQTEVIOqQWsX5Mq3WbLsZxZK5MRofX6FbIgt7EebqFOXsTst6SUQJb/SOFGrZ9Fk7
 g6wUxJv4V1O9+DhOoeQqKX0b4/QkpmBF/+9WJ3MjaMkCWKCR1kPx38KM1krPc1OSw0H9
 T0u9sOnKS4q9YYelIhHVq/He/9kLkiewOCLyV5Sj/AxTN3xcEh5H3HUfSZ0VxYPMJNOW
 DM2DSvaiVreY7axSWmMarBTKVW/89vqPhLnvU6JmFJYHczBct0Ohw/785EdZyMcBLDWM
 684XoTzf/gfNoSlISp7R+T0jT9N6xQioOVRkEGinpyyrEvq3sOlis83KrGLN1WqhUgb4
 FWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2+Di+znLFc6X0mmr/arvC7SPhODWgxA/Sv6sSuj9bqc=;
 b=ovc6WZ7mlq4oIVxXX8qK28r9qZrQIS+u111NRTIQyZRXQgydlM/gE+BxoNvLar1aba
 krhvmN6OOZ2/hdGvpVuwTd0md9k3C+1e0IZfySyR4S/WVEJrrLodWQBwqzsxaDOXW9ya
 2DwAlYEIIkOvwyh6W+aMXeL1U7cHgNcIuQ7VMF7fFTArXE9KMZbrSdkyEJkko7VJZ0dc
 Refhx/z3fa3sFeIPEmFd/6LJXaT0yWGyUZr8WfsY0EQ8+fJpiN6nirEoaPOlC8rXAdzU
 1P7I8dgwns3ZvhIo6D1jbc+17MTJYi8FcE3CHHORBTPgth8+v5GxawPDhr1GyzIHY1og
 kZWg==
X-Gm-Message-State: AOAM531xu+wDdhN5DwEut05ClTgo3OWalLd5melkscyMo+oi4s8gPZlS
 2fKhixEjHv8gvu2VkLWu8eA840UNUO5QPy1b4H6aXQ==
X-Google-Smtp-Source: ABdhPJy2Umftcs6NECfqd9UPMpnYb51vSnZ889L+ct7DPy7sTA2/XxzHtfMg3tXe4O1Q8OHKBE3RGCkEV09bvv0HETc=
X-Received: by 2002:a05:6820:1055:: with SMTP id
 x21mr3955751oot.6.1603416993655; 
 Thu, 22 Oct 2020 18:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
In-Reply-To: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Thu, 22 Oct 2020 20:36:22 -0500
Message-ID: <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, zenglg.jy@cn.fujitsu.com,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, X86 ML <x86@kernel.org>,
 LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-mm <linux-mm@kvack.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lkft-triage@lists.linaro.org,
 Thomas Gleixner <tglx@linutronix.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8hCgpPbiBUaHUsIDIyIE9jdCAyMDIwIGF0IDE5OjExLCBMaW51cyBUb3J2YWxkcwo8dG9y
dmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDIyLCAyMDIw
IGF0IDQ6NDMgUE0gTGludXMgVG9ydmFsZHMKPiBXb3VsZCB5b3UgbWluZCBzZW5kaW5nIG1lIHRo
ZSBwcm9ibGVtYXRpYyB2bWxpbnV4IGZpbGUgaW4gcHJpdmF0ZSAob3IsCj4gbGlrZWx5IGJldHRl
ciAtIGEgcG9pbnRlciB0byBzb21lIHBsYWNlIEkgY2FuIGRvd25sb2FkIGl0LCBpdCdzIGdvaW5n
Cj4gdG8gYmUgaHVnZSkuCgpUaGUga2VybmVsIE5hcmVzaCBvcmlnaW5hbGx5IHJlZmVycmVkIHRv
IGlzIGhlcmU6CiAgaHR0cHM6Ly9idWlsZHMudHV4YnVpbGQuY29tL1NDSTdYeWpiN1YyTmJmUTJs
YktCWncvCgpHcmVldGluZ3MhCgpEYW5pZWwgRMOtYXoKZGFuaWVsLmRpYXpAbGluYXJvLm9yZwoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
