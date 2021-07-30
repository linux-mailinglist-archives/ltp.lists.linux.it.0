Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F703DB81B
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 13:55:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 441B33C625C
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 13:55:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF6A23C03FE
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:55:17 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C0751401265
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 13:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627646115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HU0GQfLNk3EZQMpgznD1IUSXhwsnXsp1EQftPpVxYH0=;
 b=fCTrhDSRJg9hURjJSxPBOuYEz4BcKnP1h5CRqilOnboUczoydRVJB/ab6BgqGUmLJqDCJV
 Lbm0BuzRe96mNzZl7SoJKD3vHMc1SYBZXKk8h+CJDvQRrTC3pEjAvgVzkumasl+pXIoIj0
 9JdpPn0WVRoVW7wn/XDZDjCGfgDEsl0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-f0foF08CPSadaBWj2Ogdrg-1; Fri, 30 Jul 2021 07:55:11 -0400
X-MC-Unique: f0foF08CPSadaBWj2Ogdrg-1
Received: by mail-ot1-f71.google.com with SMTP id
 y66-20020a9d22c80000b02904b9e704387aso3671941ota.12
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 04:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HU0GQfLNk3EZQMpgznD1IUSXhwsnXsp1EQftPpVxYH0=;
 b=Tdeums/MMOX9qYgDoPJIHoNLMYrkcWVFngzCrkt8I1dct9tYoEHCKvYW5oI535ztou
 cL1k2+zUCnkGIb/DFcVSi8H+RhV36D+SHVYpxueGfb7DPnH0oqQVIEOkqYjYoesVFa3O
 T+ZN1Wpd4fI37WCIJ12kFHttQynQqQKXAmL3llhO71jdlXFM6hhZB3r10LlMOkYGjwN7
 dCaQcr+GS3BcvYyRB5yXzmd7lflT4KHNDToDdc0Ukxbeq/HO4N1A4SpUj3/uCCo3FEcL
 62mr8uIYNEhqeYSOrXDd67asCbqoCXWnV49rHzqu1sU6lk+gieB8gyZe598ZmVGfItjR
 frrw==
X-Gm-Message-State: AOAM531KjQZEeSOy4WJ8lu6kFQGx4idzI1PHvB+7ZTtDyI5/oM0w1kQu
 elojA/ksR3h/RZ6p4NyO9TiRp/eHQ+dEwLhSJE5pjdStQusWhTiQLgzKhdsCaIll0eRyqc4pRwT
 RCyiBtf7ndp7T9GWOAiatj2Wa7lA=
X-Received: by 2002:a05:6830:4186:: with SMTP id
 r6mr1710034otu.136.1627646111137; 
 Fri, 30 Jul 2021 04:55:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy87iVw18ysftvzRNCA0br903/6oj7VBeXhgbK1xjFVdhaclgMhvX8hiUIMRsQAEEFkca1/UE/1mqGWL+H77GU=
X-Received: by 2002:a05:6830:4186:: with SMTP id
 r6mr1710021otu.136.1627646110966; 
 Fri, 30 Jul 2021 04:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210729132514.1699551-1-liwang@redhat.com>
 <20210729132514.1699551-3-liwang@redhat.com>
 <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
 <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
 <CAASaF6x2pTo1kMXy+nPJT+B9nEZ4Z+ovNzjtfW5f2WEq1fxc0g@mail.gmail.com>
 <CAEemH2e04E_dhqBzJVWXX_ux6rx-Pev+gp1Piv9VJ8FC-cSutQ@mail.gmail.com>
In-Reply-To: <CAEemH2e04E_dhqBzJVWXX_ux6rx-Pev+gp1Piv9VJ8FC-cSutQ@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 30 Jul 2021 13:54:55 +0200
Message-ID: <CAASaF6wOz0BX6z0w0LroG8XKgp-NSsGWyu=_rj2pKvZfFwBU0A@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] mbind01: add more tests for MPOL_LOCAL
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
Cc: feng.tang@intel.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0678036363=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0678036363==
Content-Type: multipart/alternative; boundary="00000000000043bc0a05c855e41f"

--00000000000043bc0a05c855e41f
Content-Type: text/plain; charset="UTF-8"

>
> Or, If we want something more precise, just cancel the
> check_policy_pref_or_local on kernel >= 5.14.
>
> Is this sound better?
>
> -       if ((tst_kvercmp(3, 8, 0)) < 0 && (tc->policy == MPOL_LOCAL)) {
> -               tst_res(TCONF, "%s is not supported",
> tst_mempolicy_mode_name(tc->policy));
> -               return;
>
> +       if (tc->policy == MPOL_LOCAL) {
> +               if ((tst_kvercmp(3, 8, 0)) < 0) {
> +                       tst_res(TCONF, "%s is not supported",
> tst_mempolicy_mode_name(tc->policy));
> +                       return;
> +               }
> +
> +               if ((tst_kvercmp(5, 14, 0)) >= 0)
> +                       tc->check_policy = NULL;
>
>
Yes, that works too.

--00000000000043bc0a05c855e41f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div style=3D"font-family:monospace" class=3D"gmail_default"><br></d=
iv><div style=3D"font-size:small">Or, If we want something more precise, ju=
st cancel the</div><div style=3D"font-size:small">check_policy_pref_or_loca=
l on kernel &gt;=3D 5.14.</div><div style=3D"font-size:small"><br></div><di=
v style=3D"font-size:small">Is this sound better?</div><div><br></div><div>=
<div style=3D"font-size:small">- =C2=A0 =C2=A0 =C2=A0 if ((tst_kvercmp(3, 8=
, 0)) &lt; 0 &amp;&amp; (tc-&gt;policy =3D=3D MPOL_LOCAL)) {</div>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF, &quot;%s is not su=
pported&quot;, tst_mempolicy_mode_name(tc-&gt;policy));<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;</div><div><br>+ =C2=A0 =C2=A0 =
=C2=A0 if (tc-&gt;policy =3D=3D MPOL_LOCAL) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if ((tst_kvercmp(3, 8, 0)) &lt; 0) {<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_r=
es(TCONF, &quot;%s is not supported&quot;,<span class=3D"gmail_default" sty=
le=3D"font-size:small"> </span>tst_mempolicy_mode_name(tc-&gt;policy));<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>+<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((tst_kvercmp(5, 14,=
 0)) &gt;=3D 0)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tc-&gt;check_policy =3D NULL;<br></div></div><br><=
/div></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"=
gmail_quote"><div style=3D"font-family:monospace" class=3D"gmail_default">Y=
es, that works too.</div><br></div></div>

--00000000000043bc0a05c855e41f--


--===============0678036363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0678036363==--

