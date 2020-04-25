Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 143691B8374
	for <lists+linux-ltp@lfdr.de>; Sat, 25 Apr 2020 05:29:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6B843C2918
	for <lists+linux-ltp@lfdr.de>; Sat, 25 Apr 2020 05:29:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4BEF93C28F4
 for <ltp@lists.linux.it>; Sat, 25 Apr 2020 05:29:00 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 610A01A01938
 for <ltp@lists.linux.it>; Sat, 25 Apr 2020 05:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587785337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YoNUBYKzxp7SEXlQE1CzRPP0x+FqVYCYMVB8/b5PEJA=;
 b=hxug5z8APFr2VFiiCYYZO5RRN8DiBVkNJ5FNpHDJzhNSJdgEEb+RNno7wM0j/bbeKkkkId
 TAqRfqDsJwTFQh5Uy+SyClIugsrRoRyQ/5W8E+xMssWSfJ7WlgEPmerHOYdxcCjjy7FVW/
 vFDpod/cn9Vg5rzDoVbeyniffpJItzc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-Y9ePfDvtMJejVJBQkTFkLw-1; Fri, 24 Apr 2020 23:28:55 -0400
X-MC-Unique: Y9ePfDvtMJejVJBQkTFkLw-1
Received: by mail-lf1-f71.google.com with SMTP id s1so4913875lfd.16
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 20:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YWNf0bjd8myirgQ+gwX7DTE6Jxlg8Dk5+0IkJvGpZik=;
 b=afeh1PmRkBGUXwzKg7lJChv7R2Si8g3rBGRoPHvWJKKLoBbvTpWpFt/9/NKD5qnrKB
 Xtlsi0rdusoYMQHkD81uJF8ZKVWlfTCdbPuaJUMV9HLIf86/nizi2mO8mCxOubeJMQnO
 CZ4Lhf9mp3x7zO+A6RVkhvUqoH78tXc64afW4N7Ddx+09H7Riyw/XBqPIJnSW6aXL9Mm
 +ac5aUo8puSSRJ9bi+gOIMzVkRFRZHkUMkNrdZIlCAFgW2le3sjE790eK/WjlDd4zFLf
 wYzx4nlrPAXHOhapvEPvAkBaDNjjzfdkhSNzTy7+RFLuZxrC/RwZbZBuYr1We6Dw2voV
 G0WA==
X-Gm-Message-State: AGi0PuZyXBLwyHjLmsVlE+AM7fu58eiNe09uwvbwStt3xDH+wWP5JVGI
 Xv/mdJnRE7+/DXGfu51dHOLAlhtTp8AG+Xu/uwH3rA0x50GS21cHAwU0m+l7NT3lzmzaQYPzpsN
 9xtVZ+hXkjge6C3LCKsvvIKUhcys=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr7705883ljg.217.1587785333568; 
 Fri, 24 Apr 2020 20:28:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypJDk/ubcDIneqAFH/3EilQfipwjmpL2iQpIVQlulEKb5e+t7jCebvZhci8WkPxgx0CvSleaSSbGf5KRKNh9oZE=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr7705875ljg.217.1587785333388; 
 Fri, 24 Apr 2020 20:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200421180002.11351-1-pvorel@suse.cz>
 <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
 <20200423221245.GA1391884@x230> <20200424121116.GA25613@dell5510>
In-Reply-To: <20200424121116.GA25613@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Sat, 25 Apr 2020 11:28:42 +0800
Message-ID: <CAEemH2f1_6BFuTfrGZ2qpbLidFXxB2EQEO43TjucaMTPM9ghuw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/sendfile01.sh: Check with timeout
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
Content-Type: multipart/mixed; boundary="===============2034970344=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2034970344==
Content-Type: multipart/alternative; boundary="000000000000c6cdc405a4151488"

--000000000000c6cdc405a4151488
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Petr Vorel <pvorel@suse.cz> wrote:

...
>
> > > old api, not sure why exactly it was removed in the new one...
> > It was designed from scratch I guess.
> > But this patch makes sense to me, I'll test it tomorrow.
>
> Actually, I now consider a bit cleaner and safer solution to *not* use ev=
al
> and require test to specify function. E.g.:
>

Why not use eval for that? It helps us to perform more commands directly
without wrap into function.


> +retry_fnc()
> +{
> +       tst_rhost_run -c 'ss -ltp' | grep -q "$port.*testsf"
> +}
> +
>  do_setup()
>  {
>
> @@ -28,7 +33,7 @@ do_setup()
>         tst_rhost_run -s -b -c "$server $(tst_ipaddr rhost) $port"
>         server_started=3D1
>         tst_res TINFO "wait for the server to start"
> -       sleep 1
> +       TST_RETRY_FUNC retry_fnc 0
>  }
>
> Instead of simple:
>
>  do_setup()
> @@ -28,7 +28,7 @@ do_setup()
>         tst_rhost_run -s -b -c "$server $(tst_ipaddr rhost) $port"
>         server_started=3D1
>         tst_res TINFO "wait for the server to start"
> -       sleep 1
> +       TST_RETRY_FUNC "tst_rhost_run -c 'ss -ltp' | grep -q
> '$port.*testsf'" 0
>  }
>
> But I don't have strong opinion on it.
> Cyril, Li, any preference?
>

If no more strict reasons I prefer to go the simpler way. And there is no
need to wrap a retry_fun() I think.

--=20
Regards,
Li Wang

--000000000000c6cdc405a4151488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel=
@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l_default" style=3D"font-size:small">...</span><br>
<br>
&gt; &gt; old api, not sure why exactly it was removed in the new one...<br=
>
&gt; It was designed from scratch I guess.<br>
&gt; But this patch makes sense to me, I&#39;ll test it tomorrow.<br>
<br>
Actually, I now consider a bit cleaner and safer solution to *not* use eval=
<br>
and require test to specify function. E.g.:<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Why not use eva=
l for that? It helps us to perform more commands directly without wrap into=
 function.</div></div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
+retry_fnc()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_rhost_run -c &#39;ss -ltp&#39; | grep -q &q=
uot;$port.*testsf&quot;<br>
+}<br>
+<br>
=C2=A0do_setup()<br>
=C2=A0{<br>
<br>
@@ -28,7 +33,7 @@ do_setup()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_rhost_run -s -b -c &quot;$server $(tst_ipad=
dr rhost) $port&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 server_started=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;wait for the server to star=
t&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RETRY_FUNC retry_fnc 0<br>
=C2=A0}<br>
<br>
Instead of simple:<br>
<br>
=C2=A0do_setup()<br>
@@ -28,7 +28,7 @@ do_setup()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_rhost_run -s -b -c &quot;$server $(tst_ipad=
dr rhost) $port&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 server_started=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot;wait for the server to star=
t&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RETRY_FUNC &quot;tst_rhost_run -c &#39;ss -=
ltp&#39; | grep -q &#39;$port.*testsf&#39;&quot; 0<br>
=C2=A0}<br>
<br>
But I don&#39;t have strong opinion on it.<br>
Cyril, Li, any preference?<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">If no more strict reasons I pr=
efer to go the simpler way. And there is no need to wrap a retry_fun() I th=
ink.</div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>

--000000000000c6cdc405a4151488--


--===============2034970344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2034970344==--

