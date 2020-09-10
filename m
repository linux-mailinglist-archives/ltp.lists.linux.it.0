Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292D26418F
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 11:23:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0B923C2C7C
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 11:23:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8258A3C262C
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 11:23:07 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D30CE1A00F52
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 11:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599729785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sjBvj9dJXm4Jliu7QGVZUtdAcjS2oAAqpFsm1DIWzLs=;
 b=L7o4KsIZ8YAgR05l4AqJbpkj3m7RxCwb4IJLndzQJM1PZsQ45y/8LK+fgE8rCaFWOFiEPH
 op8lWyGtkLXzr+AwPKoOrZobe5bq0EDET06Ro89VQezed5JOUD64x2b+Q+X5B4cuVM5djP
 CwQ+p4aep80Qd0vi1CDgYwQLeuVzU1M=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-KH-s1F3zMceqsOmUjO84mw-1; Thu, 10 Sep 2020 05:23:01 -0400
X-MC-Unique: KH-s1F3zMceqsOmUjO84mw-1
Received: by mail-yb1-f197.google.com with SMTP id w38so4879271ybi.20
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 02:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjBvj9dJXm4Jliu7QGVZUtdAcjS2oAAqpFsm1DIWzLs=;
 b=DtMRd6fwFzBl47D04byGYdn+ltnxZ87D47bjORkfRZ1naoLry/JS79Dn1N5TL5VopL
 pzX7P3MhEAQqQspva4tJvxFVDB8HVRyRSGAjg+sFnU3/NCF1L2OoZP1jcc6rHeLIUdpN
 EZ921zWZA8mHtk2yB55LHlGj1jkEWwzcOBZbwqkZNNAXWxJJPrm+7ExANCxNdTS+8fGF
 /m1N10/RIYjn04R4wbMCmtA/aWiBDNR+XaF13NuojmNEgu71y1qyYIoutmSW9cgfqL4F
 DMf5Qu2YoALA6Vni3WrhfzX99jjKmHBezkowq86awsGPe/2TowCGmSsTXtldGzynghXz
 M4xw==
X-Gm-Message-State: AOAM531Uj1iwyA8K4dFuvKQ2uAA0q05r238oLd1enp+YUbYKZyV9FDET
 x3R81G6co66lL7Tcm9mjTIkbZV9of35VG18mo0mzFXDAx1b9Ifo708mx4nK3tnNM7gpkDDRQOJZ
 vZwnRLUo6KpIecm/rIb4GicjEqGE=
X-Received: by 2002:a25:5f4c:: with SMTP id h12mr11101357ybm.97.1599729780952; 
 Thu, 10 Sep 2020 02:23:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbhxMttgsxgb4RdB3JvbRFIiDydLm1bTZIxkUkrco85epBOIWNwRDVKRfTifMyMzWfWAV4oKr9hV/f4Epg0m4=
X-Received: by 2002:a25:5f4c:: with SMTP id h12mr11101340ybm.97.1599729780706; 
 Thu, 10 Sep 2020 02:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
 <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
 <20200909131327.GA3241@yuki.lan> <20200909132703.GB3241@yuki.lan>
 <CAEemH2e+Ck8M22gdgL0OQ24ekBPyDu4FwGrdG+da9E62UZWjRQ@mail.gmail.com>
In-Reply-To: <CAEemH2e+Ck8M22gdgL0OQ24ekBPyDu4FwGrdG+da9E62UZWjRQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 10 Sep 2020 17:22:48 +0800
Message-ID: <CAEemH2eJCUuf=SQF_GdQ7U9q_8+BD9LsxPAgwuJS9wx8zBzNww@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "Pravin Raghul S." <pravinraghul@zilogic.com>,
 LTP List <ltp@lists.linux.it>, "Vijay Kumar B." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============0641884356=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0641884356==
Content-Type: multipart/alternative; boundary="00000000000050e59c05aef21d8a"

--00000000000050e59c05aef21d8a
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 10, 2020 at 3:19 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Wed, Sep 9, 2020 at 9:26 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
>> Hi!
>> > Also I would like to get rid of the -fno-optimize-sibling-calls in the
>> > Makefile, this makes the test a bit fragile and less portable.
>>
>
> I'm not very sure, let me think/check a while.
>

From the document, it could also help prevents optimization purposes.
I think we can have a try, if no more issues, that will be great.


>
>
>> /*
>>  * Returns negative number if stack grows down, possitive if stack grows
>> up
>>  */
>> static int stack_dir(void)
>> {
>>         intptr_t addr = addr_func();
>>
>>         printf("%p %p\n", &addr, (void*)addr);
>>
>
> This method may be doable, but the second %p print (nil), I don't why.
>

The reason seems that the local variable is revoked after the function
is calling, so we get NULL of the local variable address. It works as we
expected when introducing a global pointer to save and return the '&a'.

-- 
Regards,
Li Wang

--00000000000050e59c05aef21d8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 10, 2020 at 3:19 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Sep 9, 2020 at 9:26 PM Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" =
target=3D"_blank">chrubis@suse.cz</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi!<br>
&gt; Also I would like to get rid of the -fno-optimize-sibling-calls in the=
<br>
&gt; Makefile, this makes the test a bit fragile and less portable.<br></bl=
ockquote><div><br></div><div><div style=3D"font-size:small">I&#39;m not ver=
y sure, let me think/check a while.</div></div></div></div></blockquote><di=
v><br></div>From the document, it could also help prevents optimization pur=
poses.</div><div class=3D"gmail_quote"><div class=3D"gmail_default" style=
=3D"font-size:small">I think we can have a try, if no more issues, that wil=
l be great.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
/*<br>
=C2=A0* Returns negative number if stack grows down, possitive if stack gro=
ws up<br>
=C2=A0*/<br>
static int stack_dir(void)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 intptr_t addr =3D addr_func();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%p %p\n&quot;, &amp;addr, (void*)a=
ddr);<br></blockquote><div><br></div><div><div style=3D"font-size:small">Th=
is method may be=C2=A0doable, but the second %p print (nil), I don&#39;t wh=
y.</div></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div></div></div></di=
v></div></blockquote><div>=C2=A0=C2=A0</div></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">The reason seems that the local variable is r=
evoked after the function</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">is calling, so we get NULL of the local variable=C2=A0address. I=
t works as we</div><div class=3D"gmail_default" style=3D"font-size:small">e=
xpected when introducing a global=C2=A0pointer to save and return the &#39;=
&amp;a&#39;.</div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000050e59c05aef21d8a--


--===============0641884356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0641884356==--

