Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0B2035E8
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 13:40:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B15153C22CC
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 13:40:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 142193C1CFB
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 13:40:56 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6A6941A00F81
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 13:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592826054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUIwnoa9AL5FCVWAbneGkUfusSOmQ/MXDwNg/yg01k4=;
 b=YMlEf0/mVJTdyzknvwbujerThZLuXa+Vo4bu/gOhN43VCSFp+7YA+gFYEnnwKpL7tvOxyk
 /9EZEsX6Cgr00RFVh0pQuudez9SChWoRIBzBgmQCK6xttfLkONcqrk4v9yDBLgs2Y7HON0
 Z4nPlXMzaGR4cYIwFaeIQtjYwHsILXU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-xOW35JbGOO2E2_R8JjFUfg-1; Mon, 22 Jun 2020 07:40:52 -0400
X-MC-Unique: xOW35JbGOO2E2_R8JjFUfg-1
Received: by mail-lf1-f72.google.com with SMTP id t6so817381lfc.3
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 04:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUIwnoa9AL5FCVWAbneGkUfusSOmQ/MXDwNg/yg01k4=;
 b=qznT1AbKFVHDnrXEPT+PV+7X9yGiWqQkYNI0NJTzApqJ+YmBW1Afx7+PVJLzmkaJM3
 ugfrrEPTfI6ZYcuXpU3BoEB8cMisp5WOBr7HQ1FTuiyKWSre3uTOsbH3aoM9iQyNFBIn
 nS4ZFXlK4vApuZH8MO+XUfDvV4fmDKgXExjOhFTsg19BeYf1+e6QSDETAaXe3iyp07EM
 zJmXx2Q/Da2dlzlEzBRwgXXb4Pe8Cw6qTnOUwN6WSXkvoROsFKlHDwgk1sx3dBWyvKfr
 NCUyu/YHKLtcZ7YkMzrJerHoTlan+L5DYlYIaD/e+E3MIZWVBz/GVFZ7KzEIHYFaUBqI
 vEPA==
X-Gm-Message-State: AOAM533oDFUABlIeuug/PQ0QAmdAmaK0rvU548mReXXLr/NOd3295arw
 J7G9QAH6DqvUqzCqIBxeU5rZq5098k6l3VhmgsBnDAidUKebhc310Er6441lKdp9k2h0BGRwcej
 uqomxQUf08ThS4tace3DZuUIp9zg=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr8622238ljd.441.1592826050595; 
 Mon, 22 Jun 2020 04:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf+1HOBzn+VSdHx1PfbOUaIeiCiRfjk5m6xblRxM+s2xkaCQfQfOf/evbecO+C0y+WzyeBtxWgWOf0W07aFYw=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr8622223ljd.441.1592826050297; 
 Mon, 22 Jun 2020 04:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200622074314.22098-1-petr.vorel@suse.com>
 <CAEemH2cz9s71E+VidezUAfYGarOzgpPTf0VucY+OYCYmjBjTGQ@mail.gmail.com>
 <20200622092213.GA27392@dell5510>
In-Reply-To: <20200622092213.GA27392@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Jun 2020 19:40:38 +0800
Message-ID: <CAEemH2dOpFaJY0DCLwULGBpf6ENEouirRuA2pOK-MzQvfyKR=A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] cgroup: Fix build with -Werror=return-type
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
Content-Type: multipart/mixed; boundary="===============0407409607=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0407409607==
Content-Type: multipart/alternative; boundary="000000000000eada7e05a8aab605"

--000000000000eada7e05a8aab605
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 5:22 PM Petr Vorel <pvorel@suse.com> wrote:

> Hi Li,
>
> > >         tst_brk(TCONF, "Cgroup is not configured");
> > > +       return TST_CGROUP_V1; /* fix -Werror=return-type */
>
>
> > This return looks strange since it will never go to here.
>
> > How about this?
>
> I'm sorry, I overlooked your mail and push whole patchset.
>
> LGTM, feel free to merge.
> Tested-by: Petr Vorel <pvorel@suse.cz>
>

This is correct, I go back to this v1 way and pushed. Thanks Petr!

-- 
Regards,
Li Wang

--000000000000eada7e05a8aab605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 22, 2020 at 5:22 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.com">pvorel@suse.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;Cgroup is n=
ot configured&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return TST_CGROUP_V1; /* fix -Werror=
=3Dreturn-type */<br>
<br>
<br>
&gt; This return looks strange since it will never go to here.<br>
<br>
&gt; How about this?<br>
<br>
I&#39;m sorry, I overlooked your mail and push whole patchset.<br>
<br>
LGTM, feel free to merge.<br>
Tested-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blan=
k">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">This is correct, I go back to thi=
s v1 way and pushed. Thanks Petr!</div></div><div><br></div></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--000000000000eada7e05a8aab605--


--===============0407409607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0407409607==--

