Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22CD25FE
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 11:13:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 870193C1CA9
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 11:13:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A4D2C3C053F
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 11:13:27 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D826B201364
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 11:13:26 +0200 (CEST)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9F08F80F7C
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 09:13:24 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id x20so2630283otk.12
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 02:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aGnyt2jLI0I+NpWRPa7w0XD83BRrZ0AlvDW1qBMUr6Y=;
 b=hvvcvhPHlXc/h0lX5NSSR+rAiOdEjKeYnkngo4o73WVml0v79jKMNOXoJUiU9BrH9h
 UpLoX+mxujcC7oNPuhUc0HIYTrOa2pr7bBND0RrP5fkUBHAz6Z2Frja2ozlRjajyYy9X
 QtX2aW+dyVUE5vi36o1EmFGO0vWnGL/67dMXO6GLk/WsaMdxFMSc+AXFf+cl+RDHJUUz
 nbQsYw3BMRLdd4FKZsFIeGfi13LhgJ8UoR1VPf4eQX6JHIC5oGNG1ojNt0Ub+og3nSvy
 n9dSNrx3Z8ZOQyiHc1lhos5vAbFWIqGMjOfPAjo9Qem5ojCzPtEuNSMAT+J4wb/Ar56D
 vbpw==
X-Gm-Message-State: APjAAAVyWOwSRBYGJJiV3U3XmruPPiM3lsj7+xgFI4K1cB6eobRettGW
 03rOi7t+K9TkcLOGJ2z1FedgmYO4C9gyeeDR4G0ztVuQ39Rt/YMweCs6heJFbgAJvVPEzkQot1v
 ff4Ha9EoTxPUttVYgMrhgqKrEAF0=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr747032otk.26.1570698803975;
 Thu, 10 Oct 2019 02:13:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPrVJHQ/dmE0miJKpuq6iiMyZIfdwFzAQLl/5g1QXY/gHs/3WOhPp8PVmr9RiEBpz5jjE2hfmS7QDxSQh70NI=
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr747018otk.26.1570698803804;
 Thu, 10 Oct 2019 02:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191010081752.11334-1-pifang@redhat.com>
 <CAEemH2dNjGXpw87wLqLc8jcEoT_Zc6yap4CfjPxmU=y1JyZ9oA@mail.gmail.com>
In-Reply-To: <CAEemH2dNjGXpw87wLqLc8jcEoT_Zc6yap4CfjPxmU=y1JyZ9oA@mail.gmail.com>
From: Li Wang <liwan@redhat.com>
Date: Thu, 10 Oct 2019 17:13:12 +0800
Message-ID: <CAEemH2e-ASzAAPgkh2JFn8qZLgAL=2em5kZWk=2G0CYrAnuMAg@mail.gmail.com>
To: Ping Fang <pifang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>,
 Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] acct: fix version check on big endian system
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0397579306=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0397579306==
Content-Type: multipart/alternative; boundary="00000000000040198c05948ad01b"

--00000000000040198c05948ad01b
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 10, 2019 at 4:33 PM Li Wang <liwan@redhat.com> wrote:

>
> Ping Fang <pifang@redhat.com> wrote:
>
> ac_version = ACCT_VERION | ACCT_BYTEORDER
>> which is 0x83 (131) on big endian system.
>>
>> failure output:
>> tst_kconfig.c:62: INFO: Parsing kernel config
>> '/boot/config-4.18.0-147.el8.s390x'
>> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
>> tst_kconfig.c:62: INFO: Parsing kernel config
>> '/boot/config-4.18.0-147.el8.s390x'
>> acct02.c:239: INFO: Verifying using 'struct acct_v3'
>> acct02.c:192: INFO: == entry 1 ==
>> acct02.c:147: INFO: ac_version != 3 (131)
>> acct02.c:192: INFO: == entry 2 ==
>> acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
>> acct02.c:133: INFO: ac_exitcode != 32768 (0)
>> acct02.c:141: INFO: ac_ppid != 34501 (34500)
>> acct02.c:147: INFO: ac_version != 3 (131)
>> acct02.c:182: FAIL: end of file reached
>>
>
> I'm wondering that is there any necessary to use do{}...while loop for
> entry many times? Since the verify_acct() only check the dummy
> program(acct02_helper) accounting struct. So in the error logs, we could
> see some meaningless data(acct02) in entry 2.
>

It turns out I was wrong, if accounting is turned on, system records for
each terminating process but not only for that process, so we need to pick
up the correct acct_struct in acct_file via the while loop.

Sorry for making noise, I pull back my comments here.

-- 
Regards,
Li Wang

--00000000000040198c05948ad01b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 10, 2019 at 4:33 PM Li Wang &lt;<a href=
=3D"mailto:liwan@redhat.com">liwan@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"l=
tr"><div style=3D"font-size:small"><br></div></div><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Ping Fang &lt;<a href=3D"mailto:pi=
fang@redhat.com" target=3D"_blank">pifang@redhat.com</a>&gt; wrote:<br></di=
v><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">ac_version =3D ACCT_VERION | ACCT_BYTEORDER<br>
which is 0x83 (131) on big endian system.<br>
<br>
failure output:<br>
tst_kconfig.c:62: INFO: Parsing kernel config<br>
&#39;/boot/config-4.18.0-147.el8.s390x&#39;<br>
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s<br>
tst_kconfig.c:62: INFO: Parsing kernel config<br>
&#39;/boot/config-4.18.0-147.el8.s390x&#39;<br>
acct02.c:239: INFO: Verifying using &#39;struct acct_v3&#39;<br>
acct02.c:192: INFO: =3D=3D entry 1 =3D=3D<br>
acct02.c:147: INFO: ac_version !=3D 3 (131)<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>acct02.c:192=
: INFO: =3D=3D entry 2 =3D=3D<br>
acct02.c:82: INFO: ac_comm !=3D &#39;acct02_helper&#39; (&#39;acct02&#39;)<=
br>
acct02.c:133: INFO: ac_exitcode !=3D 32768 (0)<br>
acct02.c:141: INFO: ac_ppid !=3D 34501 (34500)<br>
acct02.c:147: INFO: ac_version !=3D 3 (131)<br>
acct02.c:182: FAIL: end of file reached<br></blockquote><div><br></div><div=
><div style=3D"font-size:small">I&#39;m wondering that is there any necessa=
ry to use do{}...while loop for entry many times? Since the verify_acct() o=
nly check the dummy program(acct02_helper) accounting struct. So in the err=
or logs, we could see some meaningless data(acct02) in entry 2.</div></div>=
</div></div></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">It turns out I was wrong, if accounting is turned on, =
system records for each terminating process but not only for that process, =
so we need to pick up the correct acct_struct in acct_file via the while lo=
op.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Sorry for making nois=
e, I pull back my comments here.</div></div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">R=
egards,<br>Li Wang<br></div></div></div></div></div>

--00000000000040198c05948ad01b--

--===============0397579306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0397579306==--
