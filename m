Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA47E29756F
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 19:00:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A25593C3181
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 19:00:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E313D3C3176
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 19:00:25 +0200 (CEST)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 16244200D08
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 19:00:24 +0200 (CEST)
Received: by mail-il1-x141.google.com with SMTP id y17so2036952ilg.4
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o1VEizSN6TM+raklNtIXpsapMZWxETouBV0mamAPQo0=;
 b=V+Gg9uICyKn5tIe46atfWAON+AixWQBBQ6Pn1mKsJ9LTyk3eEKENj8UdU0jz8oEJ/T
 iY3pDKKGEDsjM5zsL71qeD2upMbTwf/0oJPU2qhreG0VoH8Btr+eBgBDvB9g58CZSQ96
 Sgr8eEMx01tJ+JJaSGqxsdIW8XuWtidjH3RUren590Av2KVvyiUDBkwd3pzRSI5r/akg
 4Be7/bT6OAM0TaD6IR1KR8VzV6ouQZqBCGjLPr0uzK1WtJoC3shbqQqA3Z4hhhb9EDl9
 hZ/RmeUyYqgXTzKPMWN2s3dmpVJISsGiyopT/jpiQLJijpHH+ZJruUA+qldH7HfKM+2Z
 DsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o1VEizSN6TM+raklNtIXpsapMZWxETouBV0mamAPQo0=;
 b=A5wCJYiWt5qpw4HiZtarzv/aoTIKsaBxMQShfCXAq1Ba5+Bv2JwPqgdg2h33DUQa7F
 vM6NX+inMAZblVyEdrMPHyzFHMEx9mf+Si0rK+WjosEk0cdZXT1q+qMZWtMfwE8fb2G6
 REbQFHWDtUSCUfi/dWVYBC9ThbjqlnsIcRy+DVVxuVwhwMQmJLuK9noAtJjRlDEge3Hu
 mvVthoPRGVMq/AOP+DNv1HiEPN74b8V3SqQzofVraGj0jLA4bZ7/zlp+H7XUUSkjxaM4
 +WfmO2tK778zLiv5/sG2YFf/oTHw9ljJ8lYIz8VpG+lCD/ssvynlFLvVqbBoKW2TTyG0
 CF9w==
X-Gm-Message-State: AOAM530+/yfgxeH7ZI2yoEk28j9ogmC2Hm4meq34cKRdNutLPULLp3nR
 mfob24kFJXfDm3pkm/BHSSYnRfp16s3es/UcvO/ejQ==
X-Google-Smtp-Source: ABdhPJwrgJp/OuJrOp+n+UP8gE/pj8wa+8lsTQ0hX8+Y+rO4ME9yioa2pi9mLHL+KrbDWGnIoZjFUeIWTh+m6MuqhEo=
X-Received: by 2002:a92:b6d2:: with SMTP id m79mr1190406ill.216.1603472422474; 
 Fri, 23 Oct 2020 10:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 Oct 2020 22:30:11 +0530
Message-ID: <CA+G9fYu5aGbMHaR1tewV9dPwXrUR5cbGHJC1BT=GSLsYYwN6Nw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
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

T24gRnJpLCAyMyBPY3QgMjAyMCBhdCAwODozNSwgTGludXMgVG9ydmFsZHMKPHRvcnZhbGRzQGxp
bnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDIyLCAyMDIwIGF0IDY6
MzYgUE0gRGFuaWVsIETDrWF6IDxkYW5pZWwuZGlhekBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4g
PiBUaGUga2VybmVsIE5hcmVzaCBvcmlnaW5hbGx5IHJlZmVycmVkIHRvIGlzIGhlcmU6Cj4gPiAg
IGh0dHBzOi8vYnVpbGRzLnR1eGJ1aWxkLmNvbS9TQ0k3WHlqYjdWMk5iZlEybGJLQlp3Lwo+Cj4g
aXMgdW5uZWNlc3NhcnkgKGJlY2F1c2UgdGhlIDgtYnl0ZSBjYXNlIGlzIHN0aWxsIGp1c3QgYSBz
aW5nbGUKPiByZWdpc3Rlciwgbm8gJWVheDolZWR4IGdhbWVzIG5lZWRlZCksIGl0IHdvdWxkIGJl
IGludGVyZXN0aW5nIHRvIGhlYXIKPiBpZiB0aGUgYXR0YWNoZWQgcGF0Y2ggZml4ZXMgaXQuIFRo
YXQgd291bGQgY29uZmlybSB0aGF0IHRoZSBwcm9ibGVtCj4gcmVhbGx5IGlzIGR1ZSB0byBzb21l
IHJlZ2lzdGVyIGFsbG9jYXRpb24gaXNzdWUgaW50ZXJhY3Rpb24gKG9yLAo+IGFsdGVybmF0aXZl
bHksIGl0IHdvdWxkIHRlbGwgbWUgdGhhdCB0aGVyZSdzIHNvbWV0aGluZyBlbHNlIGdvaW5nIG9u
KS4KCltPbGQgcGF0Y2ggZnJvbSB5ZXN0ZXJkYXldCgpBZnRlciBhcHBseWluZyB5b3VyIHBhdGNo
IG9uIHRvcCBvbiBsaW51eCBuZXh0IHRhZyAyMDIwMTAxNQp0aGVyZSBhcmUgdHdvIG9ic2VydmF0
aW9ucywKICAxKSBpMzg2IGJ1aWxkIGZhaWxlZC4gcGxlYXNlIGZpbmQgYnVpbGQgZXJyb3IgYnVp
bGQKICAyKSB4ODZfNjQga2FzYW4gdGVzdCBQQVNTIGFuZCB0aGUgcmVwb3J0ZWQgZXJyb3Igbm90
IGZvdW5kLgoKCmkzODYgYnVpbGQgZmFpbHVyZSwKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQptYWtl
IC1zayBLQlVJTERfQlVJTERfVVNFUj1UdXhCdWlsZCAtQy9saW51eCAtajE2IEFSQ0g9aTM4NiBI
T1NUQ0M9Z2NjCkNDPSJzY2NhY2hlIGdjYyIgTz1idWlsZAojCkluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuLi9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaDoxMSwKICAgICAgICAgICAgICAgICBmcm9tIC4u
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2ZwdS94c3RhdGUuaDo1LAogICAgICAgICAgICAgICAgIGZy
b20gLi4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oOjI2LAogICAgICAgICAgICAgICAg
IGZyb20gLi4vaW5jbHVkZS9saW51eC9wZ3RhYmxlLmg6NiwKICAgICAgICAgICAgICAgICBmcm9t
IC4uL2luY2x1ZGUvbGludXgvbW0uaDozMywKICAgICAgICAgICAgICAgICBmcm9tIC4uL2luY2x1
ZGUvbGludXgvbWVtYmxvY2suaDoxMywKICAgICAgICAgICAgICAgICBmcm9tIC4uL2ZzL3Byb2Mv
cGFnZS5jOjI6Ci4uL2ZzL3Byb2MvcGFnZS5jOiBJbiBmdW5jdGlvbiDigJhrcGFnZWNncm91cF9y
ZWFk4oCZOgouLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmg6MjE3OjI6IGVycm9yOiBp
bmNvbnNpc3RlbnQgb3BlcmFuZApjb25zdHJhaW50cyBpbiBhbiDigJhhc23igJkKICAyMTcgfCAg
YXNtIHZvbGF0aWxlKCJjYWxsIF9fIiAjZm4gIl8lUFtzaXplXSIgICAgXAogICAgICB8ICBefn4K
Li4vYXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oOjI0NDo0NDogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvCuKAmGRvX3B1dF91c2VyX2NhbGzigJkKICAyNDQgfCAjZGVmaW5lIHB1dF91
c2VyKHgsIHB0cikgKHsgbWlnaHRfZmF1bHQoKTsKZG9fcHV0X3VzZXJfY2FsbChwdXRfdXNlcix4
LHB0cik7IH0pCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn4KLi4vZnMvcHJvYy9wYWdlLmM6MzA3Ojc6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhwdXRfdXNlcuKAmQogIDMwNyB8ICAgaWYgKHB1dF91c2VyKGlu
bywgb3V0KSkgewogICAgICB8ICAgICAgIF5+fn5+fn5+Cm1ha2VbM106ICoqKiBbLi4vc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDoyODM6IGZzL3Byb2MvcGFnZS5vXSBFcnJvciAxCm1ha2VbM106IFRh
cmdldCAnX19idWlsZCcgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4KbWFrZVsyXTogKioq
IFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUwMDogZnMvcHJvY10gRXJyb3IgMgpJbiBmaWxl
IGluY2x1ZGVkIGZyb20gLi4vaW5jbHVkZS9saW51eC91YWNjZXNzLmg6MTEsCiAgICAgICAgICAg
ICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L3NjaGVkL3Rhc2suaDoxMSwKICAgICAgICAgICAg
ICAgICBmcm9tIC4uL2luY2x1ZGUvbGludXgvc2NoZWQvc2lnbmFsLmg6OSwKICAgICAgICAgICAg
ICAgICBmcm9tIC4uL2luY2x1ZGUvbGludXgvcmN1d2FpdC5oOjYsCiAgICAgICAgICAgICAgICAg
ZnJvbSAuLi9pbmNsdWRlL2xpbnV4L3BlcmNwdS1yd3NlbS5oOjcsCiAgICAgICAgICAgICAgICAg
ZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2ZzLmg6MzMsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi9p
bmNsdWRlL2xpbnV4L2Nncm91cC5oOjE3LAogICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVk
ZS9saW51eC9tZW1jb250cm9sLmg6MTMsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRl
L2xpbnV4L3N3YXAuaDo5LAogICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9saW51eC9z
dXNwZW5kLmg6NSwKICAgICAgICAgICAgICAgICBmcm9tIC4uL2tlcm5lbC9wb3dlci91c2VyLmM6
MTA6Ci4uL2tlcm5lbC9wb3dlci91c2VyLmM6IEluIGZ1bmN0aW9uIOKAmHNuYXBzaG90X2lvY3Rs
4oCZOgouLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmg6MjE3OjI6IGVycm9yOiBpbmNv
bnNpc3RlbnQgb3BlcmFuZApjb25zdHJhaW50cyBpbiBhbiDigJhhc23igJkKICAyMTcgfCAgYXNt
IHZvbGF0aWxlKCJjYWxsIF9fIiAjZm4gIl8lUFtzaXplXSIgICAgXAogICAgICB8ICBefn4KLi4v
YXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oOjI0NDo0NDogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvCuKAmGRvX3B1dF91c2VyX2NhbGzigJkKICAyNDQgfCAjZGVmaW5lIHB1dF91c2Vy
KHgsIHB0cikgKHsgbWlnaHRfZmF1bHQoKTsKZG9fcHV0X3VzZXJfY2FsbChwdXRfdXNlcix4LHB0
cik7IH0pCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn4KLi4va2VybmVsL3Bvd2VyL3VzZXIuYzozNDA6MTE6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhwdXRfdXNlcuKAmQogIDM0MCB8ICAgZXJyb3IgPSBwdXRf
dXNlcihzaXplLCAobG9mZl90IF9fdXNlciAqKWFyZyk7CiAgICAgIHwgICAgICAgICAgIF5+fn5+
fn5+Ci4uL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaDoyMTc6MjogZXJyb3I6IGluY29u
c2lzdGVudCBvcGVyYW5kCmNvbnN0cmFpbnRzIGluIGFuIOKAmGFzbeKAmQogIDIxNyB8ICBhc20g
dm9sYXRpbGUoImNhbGwgX18iICNmbiAiXyVQW3NpemVdIiAgICBcCiAgICAgIHwgIF5+fgouLi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmg6MjQ0OjQ0OiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8K4oCYZG9fcHV0X3VzZXJfY2FsbOKAmQogIDI0NCB8ICNkZWZpbmUgcHV0X3VzZXIo
eCwgcHRyKSAoeyBtaWdodF9mYXVsdCgpOwpkb19wdXRfdXNlcl9jYWxsKHB1dF91c2VyLHgscHRy
KTsgfSkKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fgouLi9rZXJuZWwvcG93ZXIvdXNlci5jOjM0NjoxMTogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmHB1dF91c2Vy4oCZCiAgMzQ2IHwgICBlcnJvciA9IHB1dF91
c2VyKHNpemUsIChsb2ZmX3QgX191c2VyICopYXJnKTsKICAgICAgfCAgICAgICAgICAgXn5+fn5+
fn4KLi4vYXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oOjIxNzoyOiBlcnJvcjogaW5jb25z
aXN0ZW50IG9wZXJhbmQKY29uc3RyYWludHMgaW4gYW4g4oCYYXNt4oCZCiAgMjE3IHwgIGFzbSB2
b2xhdGlsZSgiY2FsbCBfXyIgI2ZuICJfJVBbc2l6ZV0iICAgIFwKICAgICAgfCAgXn5+Ci4uL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaDoyNDQ6NDQ6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybwrigJhkb19wdXRfdXNlcl9jYWxs4oCZCiAgMjQ0IHwgI2RlZmluZSBwdXRfdXNlcih4
LCBwdHIpICh7IG1pZ2h0X2ZhdWx0KCk7CmRvX3B1dF91c2VyX2NhbGwocHV0X3VzZXIseCxwdHIp
OyB9KQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+Ci4uL2tlcm5lbC9wb3dlci91c2VyLmM6MzU3OjEyOiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8g4oCYcHV0X3VzZXLigJkKICAzNTcgfCAgICBlcnJvciA9IHB1dF91
c2VyKG9mZnNldCwgKGxvZmZfdCBfX3VzZXIgKilhcmcpOwogICAgICB8ICAgICAgICAgICAgXn5+
fn5+fn4KCgp4ODZfNjQgS2FzYW4gdGVzdGVkIGFuZCB0aGUgcmVwb3J0ZWQgaXNzdWUgbm90IGZv
dW5kLgpodHRwczovL2xrZnQudmFsaWRhdGlvbi5saW5hcm8ub3JnL3NjaGVkdWxlci9qb2IvMTg2
ODAyOSNMMjM3NAoKLSBOYXJlc2gKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK
