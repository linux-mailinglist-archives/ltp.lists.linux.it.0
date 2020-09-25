Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C452277E7E
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 05:21:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A6BD3C54E9
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 05:21:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C4B173C1841
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 05:21:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8F2F2200170
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 05:21:15 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601004074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6vL3T/jowQISUPquPpcY912UsRnZjSl6XWNDfqMDZp8=;
 b=O3XNiLh4KB8pb5df7QoLROlJ6suAJFKofTqIKhiwZUI3bWPPeDNeieyiRRQh2ZQUHFJK8u
 mgsR9HNtdr7chr9XjQofFIxxD709Tuspk77JlCVuRYVUjp2YqjWhixwhhnhIk2jmYZGJky
 Z9x0MDq+wcFWaMvkwGJTEvzCzhbOhaw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-KPleYHAKOBeyJnGUcQun7w-1; Thu, 24 Sep 2020 23:20:16 -0400
X-MC-Unique: KPleYHAKOBeyJnGUcQun7w-1
Received: by mail-yb1-f198.google.com with SMTP id e2so1373185ybc.17
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 20:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vL3T/jowQISUPquPpcY912UsRnZjSl6XWNDfqMDZp8=;
 b=RyBTKMzGdAIxgkPEp7JfxQbbWRF+1dOTQ2tjfHI7W5iuIxGOXLDvkVc5fBRz/JkOEI
 w2xBhOsanUZNT5YUYGxUNrO66M+VaqOV2qvFGZNAZmmwXgT8FEHpnJ9lStZPYUbwaXBM
 cLiTbc46I9jRC9hHRvkrQaDMHqlSrDMpu/dH4RCPsCEG5BuRW6GB1TqD9q5BH7k7z9Hv
 nEkgevVtyLfDqY2Ss/ZvM97evP+Kd+p4pD5mDzdGV5hOdYg9rXQ3PYQgE7cxA9iGO7tt
 e4S4FrdZut1g8QaC+nL8jiVR9VJ3kAoS6byY3woVZNFJW7BYFC4CspWhdipdgqDyYIHf
 BWkw==
X-Gm-Message-State: AOAM531JeraT54sR6YKIbYIdTmwuwe/Y7ih778iakKTdYngq1djKwLxw
 aGHPq6F6lOePTk3Hmn1+KvGvjd3pLcJiVGVCeKAG66qLB47EtsgMA2VON8TkYf1xTN7vUL5Yq7v
 +bQ8GObl3tR7lUzV2+ob4TZS0kWU=
X-Received: by 2002:a25:1cc3:: with SMTP id c186mr2750009ybc.252.1601004015042; 
 Thu, 24 Sep 2020 20:20:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe7OURCncJL9vOo2P9CcbqmRRFAPXzB5I5Q4q7MF93mP4K+zWe6uRRhO7lUOyGyz51ynRBQKaT2GuMEmX450U=
X-Received: by 2002:a25:1cc3:: with SMTP id c186mr2750000ybc.252.1601004014880; 
 Thu, 24 Sep 2020 20:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200924144246.12750-1-mdoucha@suse.cz>
In-Reply-To: <20200924144246.12750-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Sep 2020 11:20:02 +0800
Message-ID: <CAEemH2c4GRVPkNHS91dOLY-r417RpEGi5GC+izEY1P7w+kLkqw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/2] Fix formatting signal name in tst_strstatus()
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
Content-Type: multipart/mixed; boundary="===============1601081793=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1601081793==
Content-Type: multipart/alternative; boundary="000000000000976b5d05b01acb39"

--000000000000976b5d05b01acb39
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2020 at 10:43 PM Martin Doucha <mdoucha@suse.cz> wrote:

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
>
Acked-by: Li Wang <liwang@redhat.com>


> ---
>  lib/tst_status.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/tst_status.c b/lib/tst_status.c
> index f1affeac5..9124faaa3 100644
> --- a/lib/tst_status.c
> +++ b/lib/tst_status.c
> @@ -20,7 +20,8 @@ const char *exited(int status)
>
>  const char *signaled(int status)
>  {
> -       snprintf(buf, sizeof(buf), "killed by %s", tst_strsig(status));
> +       snprintf(buf, sizeof(buf), "killed by %s",
> +               tst_strsig(WTERMSIG(status)));
>
>         return buf;
>  }
> --
> 2.28.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000976b5d05b01acb39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 24, 2020 at 10:43 PM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Martin Dou=
cha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.c=
z</a>&gt;<br></blockquote><div><span class=3D"gmail_default" style=3D"font-=
size:small">Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwa=
ng@redhat.com</a>&gt;</span></div><div><span class=3D"gmail_default" style=
=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
---<br>
=C2=A0lib/tst_status.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/lib/tst_status.c b/lib/tst_status.c<br>
index f1affeac5..9124faaa3 100644<br>
--- a/lib/tst_status.c<br>
+++ b/lib/tst_status.c<br>
@@ -20,7 +20,8 @@ const char *exited(int status)<br>
<br>
=C2=A0const char *signaled(int status)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(buf, sizeof(buf), &quot;killed by %s&q=
uot;, tst_strsig(status));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(buf, sizeof(buf), &quot;killed by %s&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_strsig(WTERMSIG=
(status)));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return buf;<br>
=C2=A0}<br>
-- <br>
2.28.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000976b5d05b01acb39--


--===============1601081793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1601081793==--

