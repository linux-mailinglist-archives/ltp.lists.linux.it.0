Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D89721FE945
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 05:16:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 841863C2D78
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 05:16:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6DB013C1C9A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 05:16:03 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id EB3FE600C24
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 05:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592450161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qr1458my7NMRQ2isWWRKXfEo75QaBkIn0KoDa63CLI0=;
 b=EzGJfr17jQXRj2g5M8S6pzKKD5qCYjSl/wL4Inc3FPMiDubj2n8IQJc8AZMA6r35N9yfdV
 M5vMAIjMtj4ARHhyq3jlNaQX47juFAp/aEaygTQ9oyGIyZ7W9gCnpf5NOOXKcv/V7TGy3E
 +6ZUUAEq/PNzfXCyIsgrIIk/AzjOGvM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-bxRj4hxwMyG8eEAdXaWntQ-1; Wed, 17 Jun 2020 23:15:55 -0400
X-MC-Unique: bxRj4hxwMyG8eEAdXaWntQ-1
Received: by mail-lf1-f71.google.com with SMTP id 144so1498666lfn.2
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 20:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qr1458my7NMRQ2isWWRKXfEo75QaBkIn0KoDa63CLI0=;
 b=t5gH7cMiG6+MpCRyO04CRfIiLowfqcYnJxpo09id0g08NtKV7PZIovf+WIyouPhnhD
 6dgoa5hVsxrcvSalySBKAN9pb8evMh2DlneTa4gegSmeju+qBOf6xJrXChWABb3EtEjJ
 Zi2CHS3e4py1KLnvz8B/KU8ampxdeso7CuW0U1/04f7NPlff2KTEC+P6HWdD6AZroYT1
 QLhNJer70My569Qve+nq0L6GgsMuSebDLDd8n3KlvV5jG3SUqlokZ7A/pGzKAAdk7eL/
 V4JwnTQAuWkLZ5yymBATG6EK5M90ewts0sdeelRSmN9hGA6z8+QB2TVFppdf3unb4H5k
 lrwg==
X-Gm-Message-State: AOAM530xnmlgPAnQOTeQAKn6M9b7mfZuwh9zH1Cg6IVzhdLxcSO/Iz99
 mrwT6QKnsH1ZCiZKNefYB5bpDuZ9Y/INv9MqMd6feZgqg6CB25DNZpf8+v5enkDtsRg27P866uw
 BbeAONE4o1oMZVBUigEPuAoQ+hcQ=
X-Received: by 2002:a2e:b0ce:: with SMTP id g14mr1113891ljl.49.1592450154235; 
 Wed, 17 Jun 2020 20:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ/zXHCuczT4rpVgiBeEcuhJTKoSZR9OaOsZn8NTWRtwOwAHa0tBomcR9r+4hWRNWYcXEbdRNGp1ulZWYRD/s=
X-Received: by 2002:a2e:b0ce:: with SMTP id g14mr1113888ljl.49.1592450154051; 
 Wed, 17 Jun 2020 20:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200617154926.32588-1-alexey.kodanev@oracle.com>
In-Reply-To: <20200617154926.32588-1-alexey.kodanev@oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 18 Jun 2020 11:15:41 +0800
Message-ID: <CAEemH2dOxAnaaMXhKyj36FqmYDQ_p_kfi-=pMQhrE3O9oQO8LA@mail.gmail.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>, Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nsf_lib.sh: TCONF on mount (udp/udp6)
 failure for Linux v5.6+
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
Content-Type: multipart/mixed; boundary="===============2060113867=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2060113867==
Content-Type: multipart/alternative; boundary="000000000000c153ec05a853310d"

--000000000000c153ec05a853310d
Content-Type: text/plain; charset="UTF-8"

Alexey Kodanev <alexey.kodanev@oracle.com> wrote:

...

--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -87,11 +87,17 @@ nfs_mount()
>
>         tst_res TINFO "Mounting NFS: $mnt_cmd"
>         if [ -n "$LTP_NETNS" ] && [ -z "$LTP_NFS_NETNS_USE_LO" ]; then
> -               tst_rhost_run -s -c "$mnt_cmd"
>

Or, maybe we can have a new function naming as 'tst_kconifg_check' to parse
kernel .config in shell library as well?

i.e
    tst_kconfig_check "NFS_DISABLE_UDP_SUPPORT=y"
    if [$? -qe 0 ]; then
        tst_rhost_run -s -c "$mnt_cmd"
    else
        exit with TCONF ...

What do you think?


> -               return
> +               tst_rhost_run -c "$mnt_cmd"
> +       else
> +               $mnt_cmd > /dev/null
>         fi
>
> -       ROD $mnt_cmd
> +       if [ $? -ne 0 ]; then
> +               if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp
> -ge 5.6; then
> +                       tst_brk TCONF "UDP support disabled with the
> kernel config NFS_DISABLE_UDP_SUPPORT?"
> +               fi
> +               tst_brk TBROK "mount command failed"
> +       fi
>  }
>
>  nfs_setup()
> --
> 2.20.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000c153ec05a853310d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Alexey Kodanev &lt;<a href=3D"mailto:alexey.kodanev@ora=
cle.com">alexey.kodanev@oracle.com</a>&gt; wrote:<br></div><div dir=3D"ltr"=
 class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</span></=
blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh<br>
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh<br>
@@ -87,11 +87,17 @@ nfs_mount()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;Mounting NFS: $mnt_cmd&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;$LTP_NETNS&quot; ] &amp;&amp; [ -=
z &quot;$LTP_NFS_NETNS_USE_LO&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span class=3D"gmai=
l_default" style=3D"font-size:small"></span>tst_rhost_run -s -c &quot;$mnt_=
cmd&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Or, maybe we can have a new function naming as &#=
39;tst_kconifg_check&#39; to parse kernel .config in shell library as well?=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">i.e</div><div class=3D"g=
mail_default" style=3D"font-size:small">=C2=A0 =C2=A0 tst_kconfig_check &qu=
ot;NFS_DISABLE_UDP_SUPPORT=3Dy&quot;</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 if [$? -qe 0 ]; then</div><div class=3D=
"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=
<span class=3D"gmail_default"></span>tst_rhost_run -s -c &quot;$mnt_cmd&quo=
t;</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=
=A0 else</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 exit with TCONF ...</div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">What do you think?</div></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_rhost_run -c &q=
uot;$mnt_cmd&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$mnt_cmd &gt; /dev/=
null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD $mnt_cmd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$type&qu=
ot; =3D &quot;udp&quot; -o &quot;$type&quot; =3D &quot;udp6&quot; ] &amp;&a=
mp; tst_kvcmp -ge 5.6; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk TCONF &quot;UDP support disabled with the kernel config N=
FS_DISABLE_UDP_SUPPORT?&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk TBROK &quot=
;mount command failed&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0nfs_setup()<br>
-- <br>
2.20.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000c153ec05a853310d--


--===============2060113867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2060113867==--

