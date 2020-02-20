Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C325165829
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:06:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F23703C25A3
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:06:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3FB5E3C0137
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:06:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A4B751001888
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:05:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582182410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9oHlzp4cn87j5XRvKoqbnr4UPxLqCuWW3wS0OS1xe3c=;
 b=TaIjKiVQcnr8OZyHbAwiihabgHNK3H3jg+dHovYrT7IAAGX5DTUVA+pSQQ9fPk5mxu7g5H
 fgBO+2U/m+6W6BORcrr0wNSh5cT0JuTIDg8e0E+qF0Cr3qZXEPJ2uGQkY2/cfbuc8raero
 pS4yTXKcjl0PAoVlhrcDhlgOgLAOdTY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-g7DTDDFgNSGZ1g2UjHAe5w-1; Thu, 20 Feb 2020 02:06:46 -0500
Received: by mail-ot1-f70.google.com with SMTP id o14so1677471otp.4
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 23:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RazclLdMSuDooevR9a/OyfKZm2EWQwPgDeSuKcnX+OA=;
 b=jUBvyiF0gyDCuJbweqGcx5OT8sy7IYYkHTwzcfINeuQIjEQPnO2rmr/VsHnDNzxUMS
 eI8FHLajGQ8yWkX8c7gBsiV4XevwomhHJkT0SPrwKwvy8lZbrwWXKofgWPbUTjE8AAeB
 ATvNgqzjqqgRv6ZdjGkSNNm4hXxfuK/Vg3ewVBxkCdD1kD7lfDUR31om3lncYsYz+x1Z
 XPW0JbyQcn02lvFYr0WEwY67siDRX6AELNG5NUnO8c0erjTIkjO8m5Rux+hXw3Gbyr+9
 BnRjfQpC2JX0+j4C1x62zSc9rqX7oXIMC6UP3gETPJ1DJrz9dOFLz3z3NIDgxD/yVH1Q
 GG9Q==
X-Gm-Message-State: APjAAAX+d79xL7mUr45FhaILljPxpp5y0klY3aYztbyU5R14LKDUa9ue
 mxQMDYihqEz5K2F73d4pWQbzbaL0WCS5vPPyFj/FnOrZEKFy2OQv1NpxnVG8BRXudfXYI+DWtfd
 3TwX3JXMXflI3h14CkAQZ7mrfUCs=
X-Received: by 2002:a9d:6c55:: with SMTP id g21mr22688448otq.264.1582182405620; 
 Wed, 19 Feb 2020 23:06:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzQikq0z65jdf7eMXoB5YlAn4+Ei5CalYMgtdM9ljSvFqXLGps2tB6hGJlb8FlG050Se6fFYwcgvYzp371790=
X-Received: by 2002:a9d:6c55:: with SMTP id g21mr22688429otq.264.1582182405318; 
 Wed, 19 Feb 2020 23:06:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <199f58740e42bbdbcba0c847c194f62d2b3bb37b.1582104018.git.viresh.kumar@linaro.org>
In-Reply-To: <199f58740e42bbdbcba0c847c194f62d2b3bb37b.1582104018.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 15:06:33 +0800
Message-ID: <CAEemH2e9fhUVU3DbpXCEimL0k8eGLuuSRcicq4NYOk_zELLqMw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: g7DTDDFgNSGZ1g2UjHAe5w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 01/10] tst_device: Add tst_ismount() helper
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1077473771=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1077473771==
Content-Type: multipart/alternative; boundary="0000000000003d4e13059efc8ca6"

--0000000000003d4e13059efc8ca6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> +int tst_ismount(const char *path)
> +{
> +       char line[256];
> +       FILE *file;
> +       int ret =3D -1;

+
> +       file =3D SAFE_FOPEN(NULL, "/proc/mounts", "r");
> +
> +       while (fgets(line, sizeof(line), file)) {
> +               if (strstr(line, path) !=3D NULL) {
> +                       ret =3D 0;
> +                       break;
> +               }
> +       }
> +
> +       SAFE_FCLOSE(NULL, file);
> +
> +       if (ret) {
> +               errno =3D ENOENT;
> +               tst_resm(TWARN, "No device is mounted at %s", path);
> +       }
> +
> +       return ret;
>

Sorry, I think the return value should be '1' if it has been mounted
already.

e.g
These codes will make people confused about whether it's
mounted successfully or not.

if (tst_ismount(MNTPOINT))
        tst_brk(TBROK | TERRNO, "device not mounted");


+}
>

--=20
Regards,
Li Wang

--0000000000003d4e13059efc8ca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+int tst_ismount(const char *path)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char line[256];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *file;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D -1;=C2=A0</blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file =3D SAFE_FOPEN(NULL, &quot;/proc/mounts&qu=
ot;, &quot;r&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (fgets(line, sizeof(line), file)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstr(line, pa=
th) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FCLOSE(NULL, file);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D ENOENT;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(TWARN, &qu=
ot;No device is mounted at %s&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br></blockquote><div>=C2=A0</div><d=
iv><span class=3D"gmail_default" style=3D"font-size:small"></span>Sorry, I =
think the return value should be &#39;1&#39; if it has been mounted already=
.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_default">=
e.g</div><div class=3D"gmail_default">These codes will make people confused=
 about whether it&#39;s mounted=C2=A0successfully or not.</div><div class=
=3D"gmail_default"><br></div><div class=3D"gmail_default">if (tst_ismount(M=
NTPOINT))<br></div><div><span class=3D"gmail_default" style=3D"font-size:sm=
all">=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK | TERRNO, &quot;device not m=
ounted&quot;);</span></div><div><span class=3D"gmail_default" style=3D"font=
-size:small"></span>=C2=A0</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+}<br></blockquote><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--0000000000003d4e13059efc8ca6--


--===============1077473771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1077473771==--

