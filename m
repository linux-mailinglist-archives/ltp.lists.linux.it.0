Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49D359638
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 09:18:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDA9A3C1DB2
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 09:18:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73F5D3C1A02
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 09:18:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E3E286010F6
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 09:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617952710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jFgPSWq/uSupe0jy6D1emZncE/b88Ox6L1yyiaVCnVY=;
 b=eIaAYaPOvL5olh9Zg2W7eGQdqDt/Mba4NV7/b5XaStVqWLM1k1INLwAhdIhul7k/RFNLS8
 l4kJu780XAUi6N8XMrHniH09WRJsyL6JdzVkCssNCAGLeHBPSSGR8xNgMjxPnOgDQ2ZgF+
 AjjWKURO/Eqp2JB7LdGbfa+tsjBB8LA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-g7Rld_sfNI6bYx0WV3Byrw-1; Fri, 09 Apr 2021 03:18:28 -0400
X-MC-Unique: g7Rld_sfNI6bYx0WV3Byrw-1
Received: by mail-yb1-f198.google.com with SMTP id y13so4471533ybk.20
 for <ltp@lists.linux.it>; Fri, 09 Apr 2021 00:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jFgPSWq/uSupe0jy6D1emZncE/b88Ox6L1yyiaVCnVY=;
 b=aw4zrz13YxAlL0ptqEaJN1Cw/HfpvbbBDhnnLcYUTiPCEnSniIDgozdOG8jx13k+kj
 uKx8rR2imXm/VdaoW1URgjK4hhWabAdIHUHtt3YNRs0xRUEw6q47rrl0pmEIMoI2ZM6H
 yOU5LvG1PZkDa/ddrfueKtUhBij1MzxBxXS9qdfUiRAP0UiGpAdsbKiLMOBRbUpGzmhG
 ot/eIp+0Xhd/uSMXirv0JnrMsLKgofcivI6uR4vFOy9YAI6SGA680v21Zyu33Fs1O9Is
 ZfUIqj1j4r5+6Ql/cjxl+cUYuNWvoi+Zl+DL6We87rVrmWkxxjwjHyFi04wMvjzyylcC
 W3zQ==
X-Gm-Message-State: AOAM532Gje+ZlHEbxPFsdQ68Lk290TsS1RnrK/Vm9H9uTXvcg5ZiHCfa
 T5Ogu07EO40plcrlqZlI2OThpiziWkLj6rsnDyPo3bVUEAW03LR4LlUhu88fFWh70GR1NbiIwuB
 g7xUgeIycXiC7ZYLQN/voragK6OI=
X-Received: by 2002:a25:4b43:: with SMTP id y64mr660379yba.366.1617952707807; 
 Fri, 09 Apr 2021 00:18:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrebpw/pwiw3CoPv16Ga+afWGnUt+yqM++4Ojc5ysqFqiTII/IBBQY9x0f0HtxNIRGYUQi/SqGpjrxG2biD1U=
X-Received: by 2002:a25:4b43:: with SMTP id y64mr660358yba.366.1617952707538; 
 Fri, 09 Apr 2021 00:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210319091837.27319-1-rpalethorpe@suse.com>
 <20210319091837.27319-8-rpalethorpe@suse.com>
In-Reply-To: <20210319091837.27319-8-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 9 Apr 2021 15:18:15 +0800
Message-ID: <CAEemH2dgC4qTYMTXfvf7vKXJKG539BgvhM1-V4u0q8JDvmeKXA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 7/7] fzsync: Check processor affinity
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
Content-Type: multipart/mixed; boundary="===============1409050815=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1409050815==
Content-Type: multipart/alternative; boundary="000000000000658b0b05bf84f886"

--000000000000658b0b05bf84f886
Content-Type: text/plain; charset="UTF-8"

 static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>  {
> +       long ncpus = tst_ncpus_available();
> +
>         CHK(avg_alpha, 0, 1, 0.25);
>         CHK(min_samples, 20, INT_MAX, 1024);
>         CHK(max_dev_ratio, 0, 1, 0.1);
>         CHK(exec_time_p, 0, 1, 0.5);
>         CHK(exec_loops, 20, INT_MAX, 3000000);
> -       CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
> +
> +       if (ncpus <= 1)
> +               pair->yield_in_wait = 1;
>

I'm wondering here why not using the CHK macro as before but additionally
involved a variable 'ncpus'.

Isn't that CHK(yield_in_wait, 0, 1, (tst_ncpus_available() <= 1)) better?

-- 
Regards,
Li Wang

--000000000000658b0b05bf84f886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=C2=A0</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long ncpus =3D tst_ncpus_available();<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHK(avg_alpha, 0, 1, 0.25);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHK(min_samples, 20, INT_MAX, 1024);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHK(max_dev_ratio, 0, 1, 0.1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHK(exec_time_p, 0, 1, 0.5);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHK(exec_loops, 20, INT_MAX, 3000000);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<span class=3D"gmail_default" style=3D"font-siz=
e:small"></span>CHK(yield_in_wait, 0, 1, (tst_ncpus() &lt;=3D 1));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ncpus &lt;=3D 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pair-&gt;yield_in_w=
ait =3D 1;<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">I&#39;m wondering here why not using the CHK mac=
ro as before but additionally involved a variable &#39;ncpus&#39;.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Isn&#39;t that <span class=3D"gma=
il_default"></span>CHK(yield_in_wait, 0, 1, (tst_ncpus_available() &lt;=3D =
1)) better?</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--000000000000658b0b05bf84f886--


--===============1409050815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1409050815==--

