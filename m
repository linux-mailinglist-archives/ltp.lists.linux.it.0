Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E361FB20F
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 15:27:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC6713C5FCD
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 15:27:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 124D63C1360
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 15:22:14 +0200 (CEST)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 382C27B759D
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 15:21:27 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id z63so8567939pfb.1
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=dD7/xSUkGWg9DRwN9kP9890hjLa2hFNUB0GR0Zwb5/k=;
 b=SLCNEETUYc5SsFN3WZTapeZyKGD+cQSA3MiVuQWKnFEBgCu7rcNfMiSVhrN4uf6nEv
 TcxIYX96gLtSak70yQYB1LE8+B5SF2dac54vkoFK0YTKY97izus9YZE7hvR2Bbd23oWo
 WQq/LJyZYkhLnJQF75rQPQFg5G216C3mB0xPCK4XS4O1j3k7Nk+cmQFoYrwOi+biHP5Z
 C4g6k+I8jLaVuz7jfDi9+CwsgWUFNvWBb01c5vVzfFO2OP1e8yEtcNsFklrxrrKolIw4
 wkfodFQAicYPf4rFhNr+cXbYE97txlFfQVFXC1EJBCCZcCQSpVAUoDtV+27czSEH/IXI
 jbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=dD7/xSUkGWg9DRwN9kP9890hjLa2hFNUB0GR0Zwb5/k=;
 b=EOyk4FZtk11lnSthQMBpp5FAx007S/A26QoVFccSIQ6o5huvJ4w2mY/bhJqL4AyLax
 C05cZPe1RZ3PcoK4qxXnNfw5WrUhCmUTiQyMJ2wNh2reyjvAWFurOGyJ++4OUtMI1lsa
 4Uay2scS2H4wGqRsvBE/wuyZpcb6aEeqliFQoi/3wLPxdsYDJ+BZcj3NL3lDMNnNbnte
 pfGhmqi50U4mjdj9b47jec9fQFdRb6nMZYxphamWPCT4puhBLmbVg7Z9LBjLwtP2ZJ/f
 nYkd1Pclg2uWb5Tnbs3rWeMvEPBh9HGfQJhUINnxPyPqX8jG7KOmLpe9rHpr2pwKxCG8
 Qulw==
X-Gm-Message-State: AOAM530juHMPOpROUet31J4JNpNZnAt0aNRNOQjs4D5Ugl13NJV3aayy
 8Es69k7o0kQohmrlCdDKDoo8rg==
X-Google-Smtp-Source: ABdhPJydE3K3YFJF2cGK0i7tUUObDF38+4trjttpzPEVvCEX1aYqiaRYiRqMYkcgv2N23X9gmt2zYw==
X-Received: by 2002:a63:480d:: with SMTP id v13mr2142160pga.286.1592313732544; 
 Tue, 16 Jun 2020 06:22:12 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:2854:eba6:e44d:d731?
 ([2601:646:c200:1ef2:2854:eba6:e44d:d731])
 by smtp.gmail.com with ESMTPSA id h6sm17311916pfq.214.2020.06.16.06.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 06:22:11 -0700 (PDT)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Date: Tue, 16 Jun 2020 06:22:10 -0700
Message-Id: <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
X-Mailer: iPhone Mail (17F80)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 16 Jun 2020 15:27:06 +0200
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1136587218=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--===============1136587218==
Content-Type: multipart/alternative; boundary=Apple-Mail-CDF6B974-5B0A-415E-A592-5FDF615F16B3
Content-Transfer-Encoding: 7bit


--Apple-Mail-CDF6B974-5B0A-415E-A592-5FDF615F16B3
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jun 16, 2020, at 1:44 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
>=20
> =EF=BB=BFkernel test robot <rong.a.chen@intel.com> writes:
>> FYI, we noticed the following commit (built with gcc-9):
>>=20
>> commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert Deb=
ug exception to IDTENTRY_DB")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>=20
> Is the head of linux.git exposing the same problem or is this an
> intermittent failure, which only affects bisectability?

It sure looks deterministic:

ptrace08.c:62: BROK: Cannot find address of kernel symbol "do_debug"

>=20
> Thanks,
>=20
>        tglx

--Apple-Mail-CDF6B974-5B0A-415E-A592-5FDF615F16B3
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"ci=
te">On Jun 16, 2020, at 1:44 AM, Thomas Gleixner &lt;tglx@linutronix.de&gt; w=
rote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=
=BB=BF<span>kernel test robot &lt;rong.a.chen@intel.com&gt; writes:</span><b=
r><blockquote type=3D"cite"><span>FYI, we noticed the following commit (buil=
t with gcc-9):</span><br></blockquote><blockquote type=3D"cite"><span></span=
><br></blockquote><blockquote type=3D"cite"><span>commit: 2bbc68f8373c0631eb=
f137f376fbea00e8086be7 ("x86/entry: Convert Debug exception to IDTENTRY_DB")=
</span><br></blockquote><blockquote type=3D"cite"><span>https://git.kernel.o=
rg/cgit/linux/kernel/git/torvalds/linux.git master</span><br></blockquote><s=
pan></span><br><span>Is the head of linux.git exposing the same problem or i=
s this an</span><br><span>intermittent failure, which only affects bisectabi=
lity?</span><br></div></blockquote><div><br></div><div>It sure looks determi=
nistic:</div><div><br></div><span style=3D"-webkit-text-size-adjust: auto; c=
aret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); background-color: rgb(255, 25=
5, 255);">ptrace08.c:62: BROK: Cannot find address of kernel symbol "do_debu=
g"</span><div><font color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0=
); -webkit-text-size-adjust: auto; background-color: rgb(255, 255, 255);"><b=
r></span></font><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><br>=
<span>Thanks,</span><br><span></span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;tglx</span><br></div></blockquote></div></body></html>=

--Apple-Mail-CDF6B974-5B0A-415E-A592-5FDF615F16B3--

--===============1136587218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1136587218==--
