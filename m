Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB5305114
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 05:41:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2CC83C04AC
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 05:41:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E9ACC3C00DD
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 05:41:21 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 365D0140042E
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 05:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611722479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T/gjjUDZGeY1jenV7wA+b6NLP+NqM8r8DPqq76bvRbc=;
 b=RFBzNmParNe21d+sGMn9Sow9zCN8V9RTnm/tEriCzcsu1ViAX1Evc5nMNbLMjnxPJF7pNW
 1r0ALdNMj0HPtHse+j5dkabGr21vi5ebbgR5xCXKE+gC0MqlFTS/xom6O2lT//y+bKreWE
 yJCufA+4mVLfSL1qeMGCtXi4hUKQuPE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-VNyAaHXPN8iLXCuEpA7d0Q-1; Tue, 26 Jan 2021 23:41:15 -0500
X-MC-Unique: VNyAaHXPN8iLXCuEpA7d0Q-1
Received: by mail-yb1-f200.google.com with SMTP id 127so1139396ybn.5
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 20:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/gjjUDZGeY1jenV7wA+b6NLP+NqM8r8DPqq76bvRbc=;
 b=YTJe35UItNgQ93Lvf1xNexLf7OB4athrqKb8n7f5KW4y/oMGC9RtnAwotVYU6+faWd
 3yOXdQo7k+A7mLhh8n+l1pNMqzKrgIXnKYKAZoDqMyzOabHpACp+2jMJ1FP1TrBK7uN/
 VcfWlnqaOf1v2GIquZmqFU9M3gg9JmA6mjn8V8ZGrx6gaV0E+csXJ7FQPcwdicBCdqkP
 kzItsA3z1UdWVNue0B7bvwMyQ/y0zo2p97hHzMy3U31lFU9GJUqZuzNNvw+0m8oPTPBP
 8fKm8LfMP289f2SmCc6U1bf77FMrchMDUtpmF+lWEv0ju0ODJQz4ZRNHI/CJTmqdxX3+
 K5ug==
X-Gm-Message-State: AOAM532Ttgi1i3JTurPOCDiCBJafMM/46N/39f7UvLdkqhLK932M7Dyr
 S0Hhy2IWf2QCjUCOJk3eoryhm9DFVVNjvas43BGAu/11G0/679IZlOUSpMl0YxR3mhg6KOpLTJb
 R/QhTMBOE3gnwJ7UxVpFSQ1Ih38E=
X-Received: by 2002:a25:254e:: with SMTP id l75mr13414799ybl.110.1611722474581; 
 Tue, 26 Jan 2021 20:41:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR5DkaNmzRLKuEdks4mau2PdXwR5+h9aCGUTDX1EHfRT9zf90M+fSWBmFXmvvsgZW9H2Augwvs3jS/Y8uwAos=
X-Received: by 2002:a25:254e:: with SMTP id l75mr13414791ybl.110.1611722474438; 
 Tue, 26 Jan 2021 20:41:14 -0800 (PST)
MIME-Version: 1.0
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <1611570288-23040-2-git-send-email-liuxp11@chinatelecom.cn>
In-Reply-To: <1611570288-23040-2-git-send-email-liuxp11@chinatelecom.cn>
From: Li Wang <liwang@redhat.com>
Date: Wed, 27 Jan 2021 12:41:03 +0800
Message-ID: <CAEemH2fCwJhSA=B-Km96NfHE4nkjpUH21cW1iQRfWUGe+k-OJw@mail.gmail.com>
To: Xinpeng Liu <liuxp11@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/ioctl: ioctl_sg01.c:TBROK: Test
 killed!
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
Content-Type: multipart/mixed; boundary="===============1130946240=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1130946240==
Content-Type: multipart/alternative; boundary="00000000000090d10405b9da613a"

--00000000000090d10405b9da613a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 27, 2021 at 11:33 AM Xinpeng Liu <liuxp11@chinatelecom.cn>
wrote:

> [root@test ioctl]# ./ioctl_sg01
> tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
> ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg2
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> tst_test.c:1308: TINFO: If you are running on slow machine, try exporting
> LTP_TIMEOUT_MUL > 1
> tst_test.c:1309: TBROK: Test killed! (timeout?)
>
> [root@test ioctl]# lscpu |grep Model
> Model:                 85
> Model name:            Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz
>
> [root@test ioctl]# free -h
>       total   used    free   shared  buff/cache   available
> Mem:   502G    2.7G    499G    82M      820M        497G
> Swap:  0B      0B      0B
>
> 512G RAM is too common,so add timeout 600 seconds,result is TPASS.
>
> Signed-off-by: Xinpeng Liu <liuxp11@chinatelecom.cn>
> ---
>  testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> index 94b30dc..d1f2d3c 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
> @@ -123,6 +123,7 @@ static void run(void)
>  }
>
>  static struct tst_test test = {
> +       .timeout = 600,
>

It's hard to say 600s is proper for other huge systems.

What about setting .timeout = -1 to disable it like what we did for the
oom0* series test:
https://github.com/linux-test-project/ltp/blob/master/lib/tst_test.c#L1251


-- 
Regards,
Li Wang

--00000000000090d10405b9da613a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 11:33 AM Xinpeng Liu &lt;<a=
 href=3D"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">[root@test =
ioctl]# ./ioctl_sg01<br>
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s<br>
ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg2<br>
Test timeouted, sending SIGKILL!<br>
Test timeouted, sending SIGKILL!<br>
Test timeouted, sending SIGKILL!<br>
Test timeouted, sending SIGKILL!<br>
tst_test.c:1308: TINFO: If you are running on slow machine, try exporting<b=
r>
LTP_TIMEOUT_MUL &gt; 1<br>
tst_test.c:1309: TBROK: Test killed! (timeout?)<br>
<br>
[root@test ioctl]# lscpu |grep Model<br>
Model:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A085<br>
Model name:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Intel(R) Xeon(R) Gold =
5218 CPU @ 2.30GHz<br>
<br>
[root@test ioctl]# free -h<br>
=C2=A0 =C2=A0 =C2=A0 total=C2=A0 =C2=A0used=C2=A0 =C2=A0 free=C2=A0 =C2=A0s=
hared=C2=A0 buff/cache=C2=A0 =C2=A0available<br>
Mem:=C2=A0 =C2=A0502G=C2=A0 =C2=A0 2.7G=C2=A0 =C2=A0 499G=C2=A0 =C2=A0 82M=
=C2=A0 =C2=A0 =C2=A0 820M=C2=A0 =C2=A0 =C2=A0 =C2=A0 497G<br>
Swap:=C2=A0 0B=C2=A0 =C2=A0 =C2=A0 0B=C2=A0 =C2=A0 =C2=A0 0B<br>
<br>
512G RAM is too common,so add timeout 600 seconds,result is TPASS.<br>
<br>
Signed-off-by: Xinpeng Liu &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn" t=
arget=3D"_blank">liuxp11@chinatelecom.cn</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kerne=
l/syscalls/ioctl/ioctl_sg01.c<br>
index 94b30dc..d1f2d3c 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c<br>
@@ -123,6 +123,7 @@ static void run(void)<br>
=C2=A0}<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.timeout =3D 600,<br></blockquote><div><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">It&#39;s hard to s=
ay 600s is proper for other huge systems.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">What about setting .timeout =3D -1 to disable it like what=
 we did for the oom0* series test:</div><div class=3D"gmail_default" style=
=3D"font-size:small"><a href=3D"https://github.com/linux-test-project/ltp/b=
lob/master/lib/tst_test.c#L1251">https://github.com/linux-test-project/ltp/=
blob/master/lib/tst_test.c#L1251</a><br></div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div></div><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--00000000000090d10405b9da613a--


--===============1130946240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1130946240==--

