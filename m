Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30005B6132
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 12:14:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F05EA3C20CB
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 12:14:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 337383C20AF
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 12:14:31 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4A372140021E
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 12:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568801668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYR1Pi8tmLBDg4O+vnjJrNeX4X7RG/u6YQ+JL12zwc0=;
 b=AMl/Ldq9Y7lzaIcwvN0JVeUq1Gt9w1issUKgXvS0Yo8sgyp9lFyCRQk5FihFTzaC/l+wHB
 E3WAWA2EJDxQLa4vrzujHfb/U0dg92b+6IAGpOtFIY+Xq81eoy3rrgKO02tUzp5BzeC93+
 bgWY795Nl2si8o2haOOWsVUm/YJ6RVU=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-cVTSa2J9MY-hWqUKVmM-AQ-1; Wed, 18 Sep 2019 06:14:26 -0400
Received: by mail-ot1-f72.google.com with SMTP id r5so681708otn.22
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 03:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ixX1fudOqq6eplr//O8g8T6ZiGGWfATI6ixmoM0CiCI=;
 b=pX44OcAJdEyX0YISrMcnM6kalfVlGHkTr6SnRzMSPh8Aigf2aoKUPSn2u+c3jcPliu
 xMq8GaWq9Hpnm/acLaH2yXw6HByNG55CcLbWduIH5PanphNL4wIEp11yiJD7mTubFmvD
 IeWRXwEjroiO4szuH5xIGKOfS8PwA6wFefw0a69DgmAcDiJEjz1/EqMpQ+FOUzdMX7bD
 AzAZwfXVoW8I6AUdaqGakB8OrVTy4Uknp3Y5HY3WFVRsywaK26uZqOnC021p+rUfhuqn
 vvnsFnNRvCmmMD4B2zmmaNT5mPjP/iIbEcpI1M9eeWYilHD7ptXueMJC8eknRhJNl0Ad
 cEzQ==
X-Gm-Message-State: APjAAAUNV328PyGKDLJtHDJ/cPRj2gCgx0EXapsm7JpuBX9PMf6p1p1u
 5oX8aHAZ1JSG+JkhylnV43wBW0UqItJa4MkmdELDY0GqssUzC696gbVTnx5dxPrd2ErfI4Giht1
 7m3RTZIOWDFRzGMdB/ncE0cXFAHc=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr2453124ota.17.1568801665393; 
 Wed, 18 Sep 2019 03:14:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqym2TUdrrPOwtcj6vGba1jDRqWgZ0iXj35JxxRjB2ONs/Uug+NWGO3yqyaMlvgBZ3FVlQXhROiu/GmQroj7zyk=
X-Received: by 2002:a9d:2043:: with SMTP id n61mr2453110ota.17.1568801665146; 
 Wed, 18 Sep 2019 03:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
 <20190917165520.GA30320@x230>
 <CAEemH2cHYS6jd4DCzJsy-vKLqShcFO6fU_-Rk=zxu=yD=7YLVg@mail.gmail.com>
 <20190918082421.GA11711@x230>
 <CAEemH2duVbDqZ3UG3aHi4rQPFr-g-yxy3q-Jfw8p+2KV9ta=Tw@mail.gmail.com>
 <20190918095023.GA31233@x230>
In-Reply-To: <20190918095023.GA31233@x230>
From: Li Wang <liwang@redhat.com>
Date: Wed, 18 Sep 2019 18:14:13 +0800
Message-ID: <CAEemH2d5imKVecBv_jB7VifdXbf9HZPFX=NAvT7Hgtjjq6VQdA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: cVTSa2J9MY-hWqUKVmM-AQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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
Content-Type: multipart/mixed; boundary="===============2046632626=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2046632626==
Content-Type: multipart/alternative; boundary="000000000000f984c80592d119a0"

--000000000000f984c80592d119a0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, Sep 18, 2019 at 5:50 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > On Wed, Sep 18, 2019 at 4:24 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> > > ...
>
> > > > So, maybe that could be as a reason to disable float support for
> > > > $LTP_TIMEOUT_MUL?
>
> > > Maybe I'm missing something, therefore explaining the intent of the
> code.
> > > (int was handled in if tst_is_int "$LTP_TIMEOUT_MUL"; then):
>
> > I'm not blaming the int/float judgment, there is no problem. My concern
> is:
>
> > If the $LTP_TIMEOUT_MUL is float and awk command is missing, how things
> > will be going?
>
> > It will break at:
> >     tst_test_cmds awk
> > right?
> Yes. The concern is described in the commit message (but it should also b=
e
> in
> wiki page I guess): you want float =3D> you need awk. You don't have floa=
t,
> just
> set it as int (which will affect also C).
> Does it make sense? Is it useful?
>

It's working, but not elegant. Not sure how many people will go through the
documents for such tiny issues.

Is there any possibility to handle float by default, and if no awk
supporting, just round up the float to integer and use it do testing
automatically?


>
> > Given that break on float number handling, why not declare only support
> > integer for $LTP_TIMEOUT_MUL?
> Sure, we can do it. But I propose to do it for C as well otherwise setup
> valid
> for C will be breaking shell. But that's a backward incompatibility chang=
e.
> That's why I suggested IMHO the least intrusive change (but maybe I'm
> wrong).
> Anyone else having strong opinion?
>

No more concerns.


>
> > I hope I explained clearly this time, haha ;-)
> Sure, sorry to be slow :).
>

Never mind, I need to enhance my expression too.


>
> Kind regards,
> Petr
>

--=20
Regards,
Li Wang

--000000000000f984c80592d119a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 18, 2019 at 5:50 PM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; On Wed, Sep 18, 2019 at 4:24 PM Petr Vorel &lt;<a href=3D"mailto:pvore=
l@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br>
<br>
&gt; &gt; ...<br>
<br>
&gt; &gt; &gt; So, maybe that could be as a reason to disable float support=
 for<br>
&gt; &gt; &gt; $LTP_TIMEOUT_MUL?<br>
<br>
&gt; &gt; Maybe I&#39;m missing something, therefore explaining the intent =
of the code.<br>
&gt; &gt; (int was handled in if tst_is_int &quot;$LTP_TIMEOUT_MUL&quot;; t=
hen):<br>
<br>
&gt; I&#39;m not blaming the int/float judgment, there is no problem. My co=
ncern is:<br>
<br>
&gt; If the $LTP_TIMEOUT_MUL is float and awk command is missing, how thing=
s<br>
&gt; will be going?<br>
<br>
&gt; It will break at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0tst_test_cmds awk<br>
&gt; right?<br>
Yes. The concern is described in the commit message (but it should also be =
in<br>
wiki page I guess): you want float =3D&gt; you need awk. You don&#39;t have=
 float, just<br>
set it as int (which will affect also C).<br>
Does it make sense? Is it useful?<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">It&#39;s working, but not=
 elegant. Not sure how many people will go through the documents for such t=
iny issues.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Is there any =
possibility to handle float by default, and if no awk supporting, just roun=
d up the float to integer and use it do testing automatically?</div></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Given that break on float number handling, why not declare only suppor=
t<br>
&gt; integer for $LTP_TIMEOUT_MUL?<br>
Sure, we can do it. But I propose to do it for C as well otherwise setup va=
lid<br>
for C will be breaking shell. But that&#39;s a backward incompatibility cha=
nge.<br>
That&#39;s why I suggested IMHO the least intrusive change (but maybe I&#39=
;m wrong).<br>
Anyone else having strong opinion?<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">No more concerns.</div><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I hope I explained clearly this time, haha ;-)<br>
Sure, sorry to be slow :).<br></blockquote><div>=C2=A0</div><div><span clas=
s=3D"gmail_default" style=3D"font-size:small">Never mind, I need to enhance=
 my expression too.</span></div><div><span class=3D"gmail_default" style=3D=
"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Kind regards,<br>
Petr<br>
</blockquote></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--000000000000f984c80592d119a0--


--===============2046632626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2046632626==--

