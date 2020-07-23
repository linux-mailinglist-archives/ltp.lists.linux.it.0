Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA322AA0A
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 09:51:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 495133C4D4B
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 09:51:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 97A493C1CB6
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 09:51:35 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A62EB1A0115E
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 09:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595490693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aUfi3nyExVXLNKb3vDb9Bx+tPQKU+b08AMfhWbPgS9k=;
 b=TBvOou9Th8RZxVZbtV2EdnFcdzEV1mktobwclR2XMesa875/9TVMUWFcpuGdCd3dBoM/D6
 AQV2OYTbs1h1P6tdkatoR7pNzCjIvPDKkU2k7IZAi/NsgdtKpfL+AJxfpf4Ozm7PRx37qq
 Jnn9sRxXZhRcS9s1qZRf7z6YD1mwQH4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-b3ND-j0MO56pnzHncAfr1w-1; Thu, 23 Jul 2020 03:51:28 -0400
X-MC-Unique: b3ND-j0MO56pnzHncAfr1w-1
Received: by mail-lf1-f69.google.com with SMTP id p192so1240868lfa.0
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 00:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aUfi3nyExVXLNKb3vDb9Bx+tPQKU+b08AMfhWbPgS9k=;
 b=Qj01x6jrkRNV/xL7YK4zPG+x79X0km9If4vACfRMh33KhRfujE3TNzg7qQVonk6wfQ
 LP9sM52WS5TauFTIRv/pYlqFC7HnwUhVSZj8aaJE4y4x/mjac3TdUlFyaJ4Iq/+N178q
 AqtCqAcjGpM+ZNFnKw+tQse8vVJTaZiUxaq1hiiFoakYyAL3JspAMkFX/LSrA6bBJ9y9
 o2CjvHIYNHDUMPnWJgVp0T1Lzm5oo9yhv0BLK6plNGu4Q9MzOGQtyNC+zROd725APIeR
 Z1RdG1/ymY6nY6ZcaACDZ0M8d2qnn6gEM/a+8PSbhWBpakZJqQwD+gsa4V7ZN9NAV0Xc
 6ZoA==
X-Gm-Message-State: AOAM530ehYjl6nw4hpt+WUgQAC2tLg0JyqVs60dtg7GqN4cbumpBnFU2
 eDp+x0NrUDbU1DsDKcW7IHT4IUn4TCiN70ROn7Fult0ZaXEcwezNgZzJpPUJUfUp1///uQ+EpQB
 +AFHKbzR2XBAndKbFBo2L0fh1L/8=
X-Received: by 2002:a05:6512:31d5:: with SMTP id
 j21mr1609677lfe.83.1595490687283; 
 Thu, 23 Jul 2020 00:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz42xLGBP3Bygcewu6vwlIFWnSn45gWVbmlP5ABwqrIoPs7fF9ZQ4vGSuxK7bTHUi2ok7sFaW4bNIHbh0+13Nc=
X-Received: by 2002:a05:6512:31d5:: with SMTP id
 j21mr1609668lfe.83.1595490686994; 
 Thu, 23 Jul 2020 00:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200720194920.22784-1-ernunes@redhat.com>
 <CAEemH2c1Sz+pkcLnCoWWCaMCte7QsmUTOoUxU6fzCF32nrrG+w@mail.gmail.com>
 <98eaa723-1349-272d-3021-d2fef6e1abdd@redhat.com>
 <CAEemH2e0nwt_aOytJz0WzB3CYSirxa4myOZoQqCPTAVBL11gbQ@mail.gmail.com>
 <8c72fb72-c7aa-f21f-e08c-d97c28e4c375@redhat.com>
In-Reply-To: <8c72fb72-c7aa-f21f-e08c-d97c28e4c375@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 23 Jul 2020 15:51:14 +0800
Message-ID: <CAEemH2dB00x1-Ap7ZpyBzwPKDTzeJFQbea9rV4gWS81JufntBA@mail.gmail.com>
To: Erico Nunes <ernunes@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
Content-Type: multipart/mixed; boundary="===============0943497102=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0943497102==
Content-Type: multipart/alternative; boundary="000000000000a4260405ab171ffa"

--000000000000a4260405ab171ffa
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 22, 2020 at 11:52 PM Erico Nunes <ernunes@redhat.com> wrote:

> ...
> > So maybe we could simply do detect the /sys/kernel/../loackdown file as
> > your patch,
> > but adding an extra warning print when test failed on older than
> > kernel-v5.4.
>
> I like the idea of the warning. The only thing to consider is that the

warning would also show up on all old kernels that don't even support


lockdown and then don't have the file. So would you suggest this message
> to be something like a tst_res(TWARN, ...) or TINFO or some other less
> noisy way?
>
Thanks, but I did not suggest to show the warning in any system without the
lockdown file. I mean if test getting FAIL on the no 'lockdown' file
system, then could consider throwing a warning as a hint.
And this could be achieved in the test case but not the library.

For indicating the 'lockdown' file exist or no-exist, the 'TINFO' is enough.

-- 
Regards,
Li Wang

--000000000000a4260405ab171ffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 22, 2020 at 11:52 PM Erico Nunes &lt;<a=
 href=3D"mailto:ernunes@redhat.com">ernunes@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_=
default" style=3D"font-size:small">...</span><br>
&gt; So maybe we could simply do detect the /sys/kernel/../loackdown file a=
s<br>
&gt; your patch,<br>
&gt; but adding an extra warning print when test failed on older than<br>
&gt; kernel-v5.4.<br>
<br>
I like the idea of the warning. The only thing to consider is that the=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
warning would also show up on all old kernels that don&#39;t even support</=
blockquote><div><div class=3D"gmail_default" style=3D"font-size:small"></di=
v></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
lockdown and then don&#39;t have the file. So would you suggest this messag=
e<br>
to be something like a tst_res(TWARN, ...) or TINFO or some other less<br>
noisy way?<br></blockquote><div><div class=3D"gmail_default" style=3D"font-=
size:small"></div><div class=3D"gmail_default" style=3D"font-size:small">Th=
anks, but I did not suggest to show the warning in any system without the l=
ockdown file. I mean if test getting FAIL on the no &#39;lockdown&#39; file=
 system, then could consider throwing a warning=C2=A0as a hint.=C2=A0</div>=
<div class=3D"gmail_default" style=3D"font-size:small">And this could be ac=
hieved in the test case=C2=A0but not the library.</div></div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">For indicating=C2=A0the &#39;lockdown&#39;=
=C2=A0file exist or no-exist, the &#39;TINFO&#39; is enough.</div></div><di=
v><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000a4260405ab171ffa--


--===============0943497102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0943497102==--

