Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD337E1340
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 09:39:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 645253C2294
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 09:39:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9498C3C2270
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 09:39:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D554F1400DE9
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 09:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571816375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3lWkyvdAOiLxsXO3Sc878/l3aEWTCZaYnKEL9brwt+w=;
 b=RYrKmpvJaWCM4um80ChFCirbkHhblVDGkKtNfaSYnYRB7UgG/6tSPdAoCsxebmtSuP8Dd1
 57bbun1blX98lwOghZ+xmFNIbhsKoGGfsfBTR/YLDsLK+Ul55ycVhj+accT9HuBOoYpvc8
 IDIhwTNTTNMrCbzYNwU6PK/cTeBR2Xg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-R3lOctPaN56c1yhr_UoGMQ-1; Wed, 23 Oct 2019 03:39:31 -0400
Received: by mail-ot1-f69.google.com with SMTP id f26so10370462otq.17
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 00:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8755WL+XGWYqlNtiXSJDwEjDPN08jFf9YQNMiJ3bMM=;
 b=oJ9CDC9VbMaOnaYrPy9EhBs9FuMFI+PUMPRGzPBjmfgu1ioe1d9jCj+eW6whoV70EI
 zB/bdLeC1aau7/nE8Hc3OUgBi3f4DqCQ7K8O7qWO16XppDVFruqXQRhTrST23Z7YoJLK
 D+N4xsOZlzDw/SrrG5pF4ZxTLQeKz51AQf3FIgKHXJfibbxTu9pVcVfyOR/0Tj2YIe/l
 eziNO7vidLMYlpefApIA6R+Z0ttOzT6BpfT1cZKcdszrg5v9HmKkIV3q+oqrosZeGYbr
 /sATNaGVsxz6NCygvH6SO92CioYr973s82fQ13Tn2pTnneJFoZKQ8i/zjzGWVtYnbYc0
 6OCA==
X-Gm-Message-State: APjAAAWiNOSB8z5CeudDL6p9bBAIsWMgkQxXojpqDK0awrqU6wyA4f+/
 UjBGLAPjGtlcuXAtLcdd2bVPqji6w43tjVb81OQY/tZQJqeoIt2ew5RNOY9eDjS3tv9nMSEKiDT
 3d7dcxQS0hhj0ZGP6yvltk2QlSdo=
X-Received: by 2002:a05:6808:8d9:: with SMTP id
 k25mr6072087oij.153.1571816370510; 
 Wed, 23 Oct 2019 00:39:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzATbY0YaSHxJTXsxxqLDrIXQ+UdaNjsVdGQ5elaiRK1QM/PEVJSubNwOC82ANcV5K0glm2vB6kEaJYY83lCjo=
X-Received: by 2002:a05:6808:8d9:: with SMTP id
 k25mr6072066oij.153.1571816370298; 
 Wed, 23 Oct 2019 00:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191022140757.29713-1-chrubis@suse.cz>
 <20191022140757.29713-2-chrubis@suse.cz>
In-Reply-To: <20191022140757.29713-2-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Oct 2019 15:39:19 +0800
Message-ID: <CAEemH2eCpbAuU2xYNtiv9Wq4VwHJE2dZRXnO9v+2H=1=JQJUXQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: R3lOctPaN56c1yhr_UoGMQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add support for test tags
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
Content-Type: multipart/mixed; boundary="===============0474595744=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0474595744==
Content-Type: multipart/alternative; boundary="00000000000067856605958f0423"

--00000000000067856605958f0423
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Cyril Hrubis <chrubis@suse.cz> wrote:

...
> +static void print_failure_hints(void)
> +{
> +       unsigned int i;
> +       const struct tst_tag *tags =3D tst_test->tags;
> +
> +       if (!tags)
> +               return;
> +
> +       int hint_printed =3D 0;
> +       for (i =3D 0; tags[i].name; i++) {
> +               if (!strcmp(tags[i].name, "linux-git")) {
> +                       if (!hint_printed) {
> +                               hint_printed =3D 1;
> +                               printf("\n");
> +                               print_colored("HINT: ");
> +                               printf("You _MAY_ be missing kernel fixes=
,
> see:\n\n");
> +                       }
> +
> +                       printf(LINUX_GIT_URL "%s\n", tags[i].value);
> +               }
> +
> +       }
> +
> +       hint_printed =3D 0;
> +       for (i =3D 0; tags[i].name; i++) {
> +               if (!strcmp(tags[i].name, "CVE")) {
>

Maybe we can merge this string compare in the same for loops?

e.g: http://pastebin.test.redhat.com/808028

--=20
Regards,
Li Wang

--00000000000067856605958f0423
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Cyril Hrubis &lt;<a href=3D"mailto:chr=
ubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" clas=
s=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+static void print_failure_hints(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct tst_tag *tags =3D tst_test-&gt;tag=
s;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int hint_printed =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; tags[i].name; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tags[i]=
.name, &quot;linux-git&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!hint_printed) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hint_printed =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_colored(&quot;HINT: &quot;);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;You _MAY_ be missing ker=
nel fixes, see:\n\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(LINUX_GIT_URL &quot;%s\n&quot;, tags[i].value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hint_printed =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; tags[i].name; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tags[i]=
.name, &quot;CVE&quot;)) {<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Maybe we can merge this string=
 compare in the same for loops?</div></div><div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">e.g:=C2=A0<a href=3D"http://pastebin.test.redh=
at.com/808028">http://pastebin.test.redhat.com/808028</a></div></div><div>=
=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div></=
div>

--00000000000067856605958f0423--


--===============0474595744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0474595744==--

