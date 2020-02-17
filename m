Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C116102F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 11:37:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 379A53C25C7
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 11:37:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C7C913C23A3
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 11:37:34 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8EA32600A7A
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 11:37:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581935852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nrjdj0cGPZV2lZUto5pnkRlEzPLpgluQ8mulSZHr8a0=;
 b=KF5i7BtEx+QJ1NW8W0Z/9RWJeuwIKt/ADnl6GnHv9p3MPHN7lvMCmNjvnyW5mW+2w6sGve
 APwHEQkRtAb21qCo5GaQPGLC4rXw1MdqvLUKljOzAv5RGj1m0Sz/0f/tHfFJ/iMCT/nITY
 uFvjvtCrZ1S8GIsrwYWzeDDkh0y0Rus=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-pXpmt9v2PzCW-lc3BnJ_AQ-1; Mon, 17 Feb 2020 05:37:27 -0500
Received: by mail-ot1-f72.google.com with SMTP id z13so10292717otp.7
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 02:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohmB6i6SQrXKLviLoqxm5dQ90kI7myrNWvUhyBPHUSA=;
 b=CRMmO3lhczxytyfi2zsNL7OjWoBcTZYTnl9BHG4BWIAwxybAnOduDTSgfnqcVN97jt
 amgL6lGGZMx4zWg4OXUvvPTdeyDQp5VjVXpKbZJS5tMOqcUv3XHKnF6/qL7/RfxAa0Br
 nLkwqjSg+8v3Z1bt2H4ustQHs5Fop5GvKvOek5Ry4jo3XJ8iK8fmguccH2TPVmN+s8Ze
 e7biqHEHOnAAYKOLW6qSOLbQ6i01AxhDXL2s0wVYbLUdICKOh1exAr/a9awvp9epc+Jo
 A8jt8ekOuCh4bDD/7b1SezorXAiPSC/vbuHCQcXvYhu9lxYdspVxFnUyHSDedxma44Qn
 sieg==
X-Gm-Message-State: APjAAAUSB82CXLM7wfcDeYl9OusNIMx52sdE6jbNtdyYnx+VDK1SIHqQ
 uBb1jXXGM/GOcLAoN5nAs+yXcE9Zbv/FVPQiCCkrwyLvDoxb7hTWWwqybWGmzdq1Gtth91ziHEy
 fVdFasHQX2rXEF/8IncRODt+pyEg=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr8991635oic.138.1581935846796; 
 Mon, 17 Feb 2020 02:37:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYJYKg1skEPDDQ4iZJ13UQTPpwPdQsmW9feBFyhauKgdcnCsnBT9vON0/Nix5zmzc5NEbo6cQE67/YPQQD71I=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr8991624oic.138.1581935846605; 
 Mon, 17 Feb 2020 02:37:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
 <20200217082931.vbjkg2f53lek4uf3@vireshk-i7>
 <CAEemH2c28zj-+pec+sgoLzCq6iV627YvyH2hRpQN98eYZ_8geg@mail.gmail.com>
 <20200217095810.GC13398@dell5510>
 <CAEemH2dZboTZX00t0Kt6n_-sV+9StvJ24-ZLpdU3xFegBuLncQ@mail.gmail.com>
In-Reply-To: <CAEemH2dZboTZX00t0Kt6n_-sV+9StvJ24-ZLpdU3xFegBuLncQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Feb 2020 18:37:15 +0800
Message-ID: <CAEemH2fMTb3pk-NbqkjFhOiMY4NCO25GROomCAm810NkOj3R+Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: pXpmt9v2PzCW-lc3BnJ_AQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] syscalls/fsmount: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2102842446=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2102842446==
Content-Type: multipart/alternative; boundary="00000000000031dd4e059ec324de"

--00000000000031dd4e059ec324de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 6:28 PM Li Wang <liwang@redhat.com> wrote:

> ...
>> So we can either add it to many places or detect this old glibc and
>> compile with
>> -D_GNU_SOURCE (but this might break other things).
>>
>
> -1 remove old Glibc is a bad choice.
>

Sorry, that's a typo. I mean detect Glibc version is not a good idea:).

--=20
Regards,
Li Wang

--00000000000031dd4e059ec324de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 17, 2020 at 6:28 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">.<span c=
lass=3D"gmail_default" style=3D"font-size:small">..</span><br>
So we can either add it to many places or detect this old glibc and compile=
 with<br>
-D_GNU_SOURCE (but this might break other things).<br></blockquote><div>=C2=
=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small">-1=C2=
=A0</span>remove old Glibc is a bad choice.</div></div></div></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">S=
orry, that&#39;s a typo. I mean detect Glibc version is not a good idea:).<=
/div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--00000000000031dd4e059ec324de--


--===============2102842446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2102842446==--

