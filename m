Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF93B57D1
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 05:26:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E0483C76D7
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 05:26:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 546BC3C291C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 05:26:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8B86E2001A1
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 05:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624850813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jbfI97lyWwrvHm16WULKQqs6wlPKBsJJOlNjVwwN5Hk=;
 b=YQnLH4VtOX5RXoxq5SbTn5AGA4M114obyBVLwnV56PDlUC9Tl47AHotgSY+3HMFk7D6cv5
 Q+bKqBhPzwqJFJZhpKYdEz6o/k/riHZboiWGx0iROtchdsipcuvZUsZZzYm8x32LjKMNbC
 WUmQXKgqNd5S0NfnjvIgHAeb94lEsEo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-EZ9PbnMHMs6m38UX8kTCBQ-1; Sun, 27 Jun 2021 23:26:44 -0400
X-MC-Unique: EZ9PbnMHMs6m38UX8kTCBQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 z9-20020a0569020549b029054f17cb50f3so14278508ybs.14
 for <ltp@lists.linux.it>; Sun, 27 Jun 2021 20:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jbfI97lyWwrvHm16WULKQqs6wlPKBsJJOlNjVwwN5Hk=;
 b=BRchxOJ2AiwJ0Mb44s4Y0X1rB+Y5aP8t1XsbCnniBhmJ0JqZIXlk82XJsrSn21Sswq
 sTwhtiV9SozYkX6TVVRFM0WJpAzu38YVkAXhp6msFRotY8uNiCp/xs08Vw/AYsM24zbx
 GLpPs/tA8z7mPoz7TCVIsQ0Gw9o9X02+F9EZXGEkfnsr+tGKKPoC/2oNn+h70wGaiuWT
 RtfBEUc7/445/65oCha/4efvawIJ2g1WvVsaRFtdISeTC8FxMZtLg/WHnqQQ97dwWT9i
 k5gZM/cAAKbAM67C5c653jWD4X6ajhHHFacq3Hd4wl6CANpAdq3JL8dkym0WaYQUWAU5
 eSVw==
X-Gm-Message-State: AOAM533rCew0t282BqiaMK1pQBglFO8NbueqGu3ZQ1rF9U7Q60b9CMhy
 jIt94i58Sd2HSCMdyimIz8uevPXgvddS1ecXpiu8XqO+HCmxHIb9rZIBco/vF0C0FAba9kQquH3
 MEysH1MaOaNzdiouXaSETAFqpVBE=
X-Received: by 2002:a25:2643:: with SMTP id m64mr25598530ybm.243.1624850804285; 
 Sun, 27 Jun 2021 20:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr0mWJ14t1qj+fLAvrdYiEk1BBPLY1V5LxPwRx28nOxeZliRBg/d843liYbMkyjdtEnfcdJlQJ5vYJUwYaamc=
X-Received: by 2002:a25:2643:: with SMTP id m64mr25598515ybm.243.1624850804057; 
 Sun, 27 Jun 2021 20:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210628110316.01247283dbcd989cfe6f7c12@uniontech.com>
In-Reply-To: <20210628110316.01247283dbcd989cfe6f7c12@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 28 Jun 2021 11:26:32 +0800
Message-ID: <CAEemH2dHj9jBfV0NNEDCx+4pijh6Mm-z68ZHa8Y8XGWdATxUkg@mail.gmail.com>
To: gouhao@uniontech.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fix cpuhotplug04 check last cpu error
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
Cc: weidong@uniontech.com, jiaofenfang@uniontech.com,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1488183090=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1488183090==
Content-Type: multipart/alternative; boundary="000000000000fd3dbe05c5cb0e28"

--000000000000fd3dbe05c5cb0e28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 11:03 AM <gouhao@uniontech.com> wrote:

> hi, LiWang,
>
> My cpu is Hygon C86 7185 32-core Processor, x86_64 architecture=EF=BC=8C =
kernel is
> 4.19.90
> Only cpu0 has no files=EF=BC=8CIt doesn't seem to have anything to do wit=
h the
> kernel. I tried other kernels, too
>

Thanks for the info.

I checked my laptop (5.12.11-300.fc34.x86_64), it has no 'online' file in
the first cpu0 as well.
It seems common to consider cpu0 is always online, so it won=E2=80=99t have
=E2=80=9Ccpu0/online=E2=80=9D.
(I got this view from google search ^)


But go back to your patch, does it really make sense to correct
the judgment of the last CPU?

If I understand correctly, the original judgment is purposely to
guarantee all CPUs can be safely offline, so if there is already
a cpu0 without an 'online' file, it will be filtered out, right? This
means all of the remaining hotplugged CPUs can be offline safely.
In this case, the judgment of the last CPU is losing effect as
expected. Why should we correct it?

Or, do you get any failures/abnormal in testing?



>
> Attached is a screenshot.
> ------------------------------
>
> *=E7=BB=9F=E4=BF=A1=E8=BD=AF=E4=BB=B6=E6=8A=80=E6=9C=AF=E6=9C=89=E9=99=90=
=E5=85=AC=E5=8F=B8*
>
> *UnionTech Software Technology Co., Ltd. *
>
> =E5=AE=98=E7=BD=91=EF=BC=9Awww.uniontech.com
>
>
>
> =E6=AD=A4=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E6=B6=88=E6=81=AF=E4=BB=85=
=E4=BE=9B=E9=A2=84=E6=9C=9F=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=BD=BF=E7=94=A8=EF=
=BC=8C=E5=85=B6=E4=B8=AD=E5=8F=AF=E8=83=BD=E5=8C=85=E5=90=AB=E4=BF=9D=E5=AF=
=86=E6=88=96=E7=89=B9=E6=9D=83=E4=BD=BF=E7=94=A8=E4=BF=A1=E6=81=AF=E3=80=82=
=E5=A6=82=E6=9E=9C=E6=82=A8=E4=B8=8D=E6=98=AF=E9=A2=84=E6=9C=9F=E6=94=B6=E4=
=BB=B6=E4=BA=BA=EF=BC=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=
=A0=E6=92=AD=E3=80=81=E5=88=86=E5=8F=91=E6=88=96=E5=A4=8D=E5=88=B6=E6=AD=A4=
=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E6=88=96=E4=BF=A1=E8=B5=96=E6=AD=A4=E9=
=82=AE=E4=BB=B6=E9=87=87=E5=8F=96=E4=BB=BB=E4=BD=95=E8=A1=8C=E5=8A=A8=E3=80=
=82=E5=A6=82=E6=9E=9C=E6=82=A8=E8=AF=AF=E6=94=B6=E4=BA=86=E6=AD=A4=E9=82=AE=
=E4=BB=B6=EF=BC=8C=E8=AF=B7=E7=AB=8B=E5=8D=B3=E5=9B=9E=E5=A4=8D=E9=82=AE=E4=
=BB=B6=E9=80=9A=E7=9F=A5=E7=BB=9F=E4=BF=A1=E8=BD=AF=E4=BB=B6=E6=8A=80=E6=9C=
=AF=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=8C=
=E5=B9=B6=E5=88=A0=E9=99=A4=E8=AF=AF=E6=94=B6=E7=94=B5=E5=AD=90=E9=82=AE=E4=
=BB=B6=E5=8F=8A=E5=85=B6=E7=9B=B8=E5=85=B3=E9=99=84=E4=BB=B6=E3=80=82=E6=84=
=9F=E8=B0=A2=E9=85=8D=E5=90=88=EF=BC=81
>
>
>
> This email message is intended only for the use of the individual or
> entity who/which is the intended recipient and may contain information th=
at
> is privileged or confidential. If you are not the intended recipient, you
> are hereby notified that any use, dissemination, distribution or copying
> of, or taking any action in reliance on, this e-mail is strictly
> prohibited. If you have received this email in error, please notify
> UnionTech Software Technology  immediately by replying to this e-mail and
> immediately delete and discard all copies of the e-mail and the attachmen=
t
> thereto (if any). Thank you.
> ------------------------------------------------------------------
>
> Hi Hao,
>
> On Mon, Jun 28, 2021 at 9:16 AM Gou Hao <gouhao@uniontech.com> wrote:
>
>> From: gouhao <gouhao@uniontech.com>
>>
>>
>
>> Cpuhotplug04 uses get_hotplug_cpus when traversing,
>> get_hotplug_cpus will filter out cpu without online files,
>> and $cpus_num will be used to determine the last cpu num=E3=80=82
>
>
>
>>
>> If some cpu do not have an online file,
>> it will lead to an error in the judgment of the last cpu.
>>
>
> I'm wondering what kind of CPU does not have the online file, and which
> kernel version is being used? Is that test machine an x86 or MIPS?
>
> --
> Regards,
> Li Wang
>


--=20
Regards,
Li Wang

--000000000000fd3dbe05c5cb0e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 28, 2021 at 11:03 AM &lt;<a href=3D"mai=
lto:gouhao@uniontech.com">gouhao@uniontech.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"> <div><div><div id=3D"gmail-m=
_-2047747051835399752MailBelowDiv"></div><div style=3D"overflow-wrap: break=
-word;"><div>hi, LiWang,</div><div><br></div><div>My cpu is=C2=A0Hygon C86 =
7185 32-core Processor, x86_64 architecture=EF=BC=8C kernel is 4.19.90</div=
><div>Only cpu0 has no files=EF=BC=8CIt doesn&#39;t seem to have anything t=
o do with the kernel. I tried other kernels, too</div></div></div></div></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Thanks for the info.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I checked my laptop (5.12.11-300.fc34.x86_64), it has no &#39;online&=
#39; file in the first cpu0 as well.</div>It <span class=3D"gmail_default" =
style=3D"font-size:small">seems common to consider</span>=C2=A0cpu0 is alwa=
ys online, so it won=E2=80=99t have =E2=80=9Ccpu0/online=E2=80=9D.</div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">(I got this view f=
rom google search ^)</div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">But go back to your patch, does it really make sense to correct<=
/div><div class=3D"gmail_default" style=3D"font-size:small">the judgment of=
 the last CPU?</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">If I under=
stand correctly, the original judgment is purposely to</div><div class=3D"g=
mail_default" style=3D"font-size:small">guarantee=C2=A0all CPUs can be safe=
ly offline, so if there is already</div><div class=3D"gmail_default" style=
=3D"font-size:small">a cpu0 without=C2=A0an &#39;online&#39; file, it will =
be filtered=C2=A0out, right? This</div><div class=3D"gmail_default" style=
=3D"font-size:small">means all of the remaining hotplugged=C2=A0CPUs can be=
 offline safely.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size=
:small">In=C2=A0this case, the judgment of the last CPU is losing effect as=
</div><div class=3D"gmail_default" style=3D"font-size:small">expected. Why =
should we correct it?</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Or,=
 do you get any failures/abnormal in=C2=A0testing?</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><div s=
tyle=3D"overflow-wrap: break-word;"><div><br></div><div>Attached is a scree=
nshot.<br><div id=3D"gmail-m_-2047747051835399752sign"><hr width=3D"300" al=
ign=3D"left"><p style=3D"font-family:tahoma,arial,helvetica,sans-serif;font=
-size:12px;background:rgb(254,254,254)"><strong><span style=3D"font-size:13=
.5pt">=E7=BB=9F=E4=BF=A1=E8=BD=AF=E4=BB=B6=E6=8A=80=E6=9C=AF=E6=9C=89=E9=99=
=90=E5=85=AC=E5=8F=B8</span></strong><span lang=3D"EN-US">=C2=A0=C2=A0 =C2=
=A0</span></p><p style=3D"font-family:tahoma,arial,helvetica,sans-serif;fon=
t-size:12px;background:rgb(254,254,254)"><strong><span lang=3D"EN-US" style=
=3D"font-size:7.5pt">UnionTech Software Technology Co., Ltd.=C2=A0</span></=
strong><span style=3D"font-size:10pt">=E3=80=80</span></p><p style=3D"font-=
family:tahoma,arial,helvetica,sans-serif;font-size:12px;background:rgb(254,=
254,254)"><span style=3D"background-color:rgb(255,255,255);font-size:10pt">=
=E5=AE=98=E7=BD=91=EF=BC=9A</span><span lang=3D"EN-US" style=3D"background-=
color:rgb(255,255,255);font-size:10pt;font-family:Tahoma,sans-serif"><a hre=
f=3D"http://www.uniontech.com" target=3D"_blank">www.uniontech.com</a></spa=
n><span style=3D"font-size:9pt;background-color:rgb(255,255,255)">=E3=80=80=
=E3=80=80</span></p><p style=3D"background-color:rgb(255,255,255);font-fami=
ly:tahoma,arial,helvetica,sans-serif;font-size:12px"><br></p><div style=3D"=
color:rgb(51,51,51);background-color:rgb(255,255,255)"><span style=3D"font-=
family:tahoma,arial,helvetica,sans-serif;font-size:12px">=E6=AD=A4=E7=94=B5=
=E5=AD=90=E9=82=AE=E4=BB=B6=E6=B6=88=E6=81=AF=E4=BB=85=E4=BE=9B=E9=A2=84=E6=
=9C=9F=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=BD=BF=E7=94=A8=EF=BC=8C=E5=85=B6=E4=B8=
=AD=E5=8F=AF=E8=83=BD=E5=8C=85=E5=90=AB=E4=BF=9D=E5=AF=86=E6=88=96=E7=89=B9=
=E6=9D=83=E4=BD=BF=E7=94=A8=E4=BF=A1=E6=81=AF=E3=80=82=E5=A6=82=E6=9E=9C=E6=
=82=A8=E4=B8=8D=E6=98=AF=E9=A2=84=E6=9C=9F=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=
=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=A0=E6=92=AD=E3=80=81=
=E5=88=86=E5=8F=91=E6=88=96=E5=A4=8D=E5=88=B6=E6=AD=A4=E7=94=B5=E5=AD=90=E9=
=82=AE=E4=BB=B6=E6=88=96=E4=BF=A1=E8=B5=96=E6=AD=A4=E9=82=AE=E4=BB=B6=E9=87=
=87=E5=8F=96=E4=BB=BB=E4=BD=95=E8=A1=8C=E5=8A=A8=E3=80=82=E5=A6=82=E6=9E=9C=
=E6=82=A8=E8=AF=AF=E6=94=B6=E4=BA=86=E6=AD=A4=E9=82=AE=E4=BB=B6=EF=BC=8C=E8=
=AF=B7=E7=AB=8B=E5=8D=B3=E5=9B=9E=E5=A4=8D=E9=82=AE=E4=BB=B6=E9=80=9A=E7=9F=
=A5=E7=BB=9F=E4=BF=A1=E8=BD=AF=E4=BB=B6=E6=8A=80=E6=9C=AF=E6=9C=89=E9=99=90=
=E5=85=AC=E5=8F=B8=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=8C=E5=B9=B6=E5=88=A0=E9=
=99=A4=E8=AF=AF=E6=94=B6=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=
=B6=E7=9B=B8=E5=85=B3=E9=99=84=E4=BB=B6=E3=80=82=E6=84=9F=E8=B0=A2=E9=85=8D=
=E5=90=88=EF=BC=81</span>=C2=A0=C2=A0</div><div style=3D"color:rgb(51,51,51=
);background-color:rgb(255,255,255)"><span style=3D"font-family:tahoma,aria=
l,helvetica,sans-serif;font-size:12px"><br></span>=C2=A0</div><div style=3D=
"color:rgb(51,51,51);background-color:rgb(255,255,255)"><span style=3D"font=
-family:tahoma,arial,helvetica,sans-serif;font-size:12px">This email messag=
e is intended only for the use of the individual or entity who/which is the=
 intended recipient and may contain information that is privileged or confi=
dential. If you are not the intended recipient, you are hereby notified tha=
t any use, dissemination, distribution or copying of, or taking any action =
in reliance on, this e-mail is strictly prohibited. If you have received th=
is email in error, please notify UnionTech Software Technology=C2=A0 immedi=
ately by replying to this e-mail and immediately delete and discard all cop=
ies of the e-mail and the attachment thereto (if any). Thank you.</span>=C2=
=A0=C2=A0</div></div></div>------------------------------------------------=
------------------<div><br></div></div><div id=3D"gmail-m_-2047747051835399=
752summernote"><div id=3D"gmail-m_-2047747051835399752MailBelowDiv"></div><=
/div><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">Hi Ha=
o,</div></div><br><div class=3D"gmail_quote"><div class=3D"gmail_attr" dir=
=3D"ltr">On Mon, Jun 28, 2021 at 9:16 AM Gou Hao &lt;<a href=3D"mailto:gouh=
ao@uniontech.com" target=3D"_blank">gouhao@uniontech.com</a>&gt; wrote:<br>=
</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex" class=3D"gmail_quote">From: gouhao &lt;<a=
 href=3D"mailto:gouhao@uniontech.com" target=3D"_blank">gouhao@uniontech.co=
m</a>&gt;<br>
<br></blockquote><div>=C2=A0</div><blockquote style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmai=
l_quote">
Cpuhotplug04 uses get_hotplug_cpus when traversing, <br>
get_hotplug_cpus will filter out cpu without online files, <br>
and $cpus_num will be used to determine the last cpu num=E3=80=82</blockquo=
te><div>=C2=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"> <br>
If some cpu do not have an online file, <br>
it will lead to an error in the judgment of the last cpu.<br></blockquote><=
div><br></div><div><div style=3D"font-size:small">I&#39;m wondering=C2=A0wh=
at kind of CPU does not have the online file, and which</div><div style=3D"=
font-size:small">kernel version is being used? Is that test machine an x86 =
or MIPS?</div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>
 </div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fd3dbe05c5cb0e28--


--===============1488183090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1488183090==--

