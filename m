Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1042968A9
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 05:12:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3AD43C5696
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 05:12:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 650773C23E0
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 05:12:54 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A47BA200DCF
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 05:12:53 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id p15so4193409ljj.8
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 20:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Na94wtC1BhSlnxPRS1UAdX72oiIY6E2rGP3IXkaaAPI=;
 b=dvQpU+FB9bJIevPoyZUx0Zefem4fScj4c1Gi0SaeCK5Q9yI9nesRnzjd+UaB+pY0Io
 MQlmn/KIjYgbmrUu++HqyEv1sajyLI/DtsrPFcq1odZmHAA9otSr14zvP3X3mR7rw59T
 axPQewjAT8o4TjKIP1JKavPS6yuA49BTh5Ujg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Na94wtC1BhSlnxPRS1UAdX72oiIY6E2rGP3IXkaaAPI=;
 b=MwJmtLfP7P/znf+lQYas64T3Q8ZvdMCDUps7ubtK1pc5XADc913l36DFB6nf10Y8ax
 bfgLbeHnxIb9i9bs5yXwKoGXW52NePx9Wwvvg2wVank7/4tB66VF8OhJLKw8NE9uCC2R
 vX3kzjBXCU0skJET6rNcEABgWSFY+U4bI0oO9x1DQzdpg6vo53oDvuXYpPXTVNBTozkf
 SGaOKb01yxeZ0gPNUwlb1udaxGwwfMZIeBQhcsifwDZoV+ofs3NE/Iswj38N0+sFJAZ2
 g8vY5e6DzwnWw/ld5d0XhJs8r1J5LzhkAZfg2DY2f6iRcTFria97DhtXyorsBF/hJjHf
 gN0Q==
X-Gm-Message-State: AOAM532XSUepIucjdJLWqXR5aHDRzWezrQkNfRrwhF+jerTa+CxfwsWM
 9NhJ+2T1JRpgKmTS0rRGqtOm4wYnOBrxTg==
X-Google-Smtp-Source: ABdhPJxnu/0yiKOgc+XVnhkYibFhVOCUAUj3ig5ipHoe9cFJJOSkYZ4p7PhAg/J5tHZ6UfiOMjkevQ==
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr23860ljn.164.1603422772676;
 Thu, 22 Oct 2020 20:12:52 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id n20sm15446lji.98.2020.10.22.20.12.52
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 20:12:52 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id h6so308553lfj.3
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 20:12:52 -0700 (PDT)
X-Received: by 2002:a19:83c9:: with SMTP id f192mr33971lfd.148.1603422321812; 
 Thu, 22 Oct 2020 20:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
In-Reply-To: <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Oct 2020 20:05:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
Message-ID: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Content-Type: multipart/mixed; boundary="000000000000eb07d805b24dd94f"
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--000000000000eb07d805b24dd94f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 6:36 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> w=
rote:
>
> The kernel Naresh originally referred to is here:
>   https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/

Thanks.

And when I started looking at it, I realized that my original idea
("just look for __put_user_nocheck_X calls, there aren't so many of
those") was garbage, and that I was just being stupid.

Yes, the commit that broke was about __put_user(), but in order to not
duplicate all the code, it re-used the regular put_user()
infrastructure, and so all the normal put_user() calls are potential
problem spots too if this is about the compiler interaction with KASAN
and the asm changes.

So it's not just a couple of special cases to look at, it's all the
normal cases too.

Ok, back to the drawing board, but I think reverting it is probably
the right thing to do if I can't think of something smart.

That said, since you see this on x86-64, where the whole ugly trick with th=
at

   register asm("%"_ASM_AX)

is unnecessary (because the 8-byte case is still just a single
register, no %eax:%edx games needed), it would be interesting to hear
if the attached patch fixes it. That would confirm that the problem
really is due to some register allocation issue interaction (or,
alternatively, it would tell me that there's something else going on).

                  Linus

--000000000000eb07d805b24dd94f
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kglo76xr0>
X-Attachment-Id: f_kglo76xr0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5k
ZXggZjEzNjU5NTIzMTA4Li4wZjNlMjAyZDllZWEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAg
LTIxMSwxNCArMjExLDE0IEBAIGV4dGVybiB2b2lkIF9fcHV0X3VzZXJfbm9jaGVja184KHZvaWQp
OwogI2RlZmluZSBkb19wdXRfdXNlcl9jYWxsKGZuLHgscHRyKQkJCQkJXAogKHsJCQkJCQkJCQlc
CiAJaW50IF9fcmV0X3B1OwkJCQkJCQlcCi0JcmVnaXN0ZXIgX190eXBlb2ZfXygqKHB0cikpIF9f
dmFsX3B1IGFzbSgiJSJfQVNNX0FYKTsJCVwKKwlfX3R5cGVvZl9fKCoocHRyKSkgX192YWxfcHU7
CQkJCQlcCiAJX19jaGtfdXNlcl9wdHIocHRyKTsJCQkJCQlcCiAJX192YWxfcHUgPSAoeCk7CQkJ
CQkJCVwKIAlhc20gdm9sYXRpbGUoImNhbGwgX18iICNmbiAiXyVQW3NpemVdIgkJCQlcCiAJCSAg
ICAgOiAiPWMiIChfX3JldF9wdSksCQkJCQlcCiAJCQlBU01fQ0FMTF9DT05TVFJBSU5UCQkJCVwK
IAkJICAgICA6ICIwIiAocHRyKSwJCQkJCVwKLQkJICAgICAgICJyIiAoX192YWxfcHUpLAkJCQkJ
XAorCQkgICAgICAgImEiIChfX3ZhbF9wdSksCQkJCQlcCiAJCSAgICAgICBbc2l6ZV0gImkiIChz
aXplb2YoKihwdHIpKSkJCQlcCiAJCSAgICAgOiJlYngiKTsJCQkJCQlcCiAJX19idWlsdGluX2V4
cGVjdChfX3JldF9wdSwgMCk7CQkJCQlcCg==
--000000000000eb07d805b24dd94f
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--000000000000eb07d805b24dd94f--
