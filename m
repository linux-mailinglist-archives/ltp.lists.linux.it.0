Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039A2A64F1
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 14:20:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E85CC3C5462
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 14:20:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BC74E3C2FF8
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 14:20:42 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 177BB60012E
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 14:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604496040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F//op2dHvOclLo1Md557wQ2YKUhO1iFWL6GebS7APhg=;
 b=ZmlvrWIn6U7HjT56fsAj79JxBx3WqvIHeHJZdWEC9NnLHeagmLAWWL4QMehENxu2V+P0T2
 +vAixMfQhQCA6/0/3t5HtbtpYoVtucNFDHjqL/+deGZtC6nouAPrdvEQnhoAvgEmH4aAli
 UuIileCvvmpw6BBLgKisfjaCpWn3O14=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-_967EFg_PGWJk_YG81ckpA-1; Wed, 04 Nov 2020 08:20:37 -0500
X-MC-Unique: _967EFg_PGWJk_YG81ckpA-1
Received: by mail-yb1-f198.google.com with SMTP id j2so2869243ybb.12
 for <ltp@lists.linux.it>; Wed, 04 Nov 2020 05:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F//op2dHvOclLo1Md557wQ2YKUhO1iFWL6GebS7APhg=;
 b=oWLX7VsXntX/NQfMMwpiuBsOB7coFkkD1etaZ3AXNePlghVs16CGMvYHac7D8IwC2G
 qCpxycHqZchl5Aemh8VyisPNTpQTo0dDK0hlyHUze8VUEqC8NIcHG3UQdDmHZ6VuoV6I
 1NJX/zPLcVryuw860v9Kmu62MPbB12xiTe2B2EL0fmKozqZD3FmWxRLUh4yHOT+492lQ
 tJu90jLb5XtiAVi0CA6D+kWbpbL971PP9gMlgJi9050L88VhfCEa7zqh2zh6TUpQ5+be
 HYhhFuasCgj+on+DJ/QoatqMz1i6cQuEWNYsnj14+yaM3Yhk1eEwjkCdhgBqrtC4F9Hn
 +ryQ==
X-Gm-Message-State: AOAM531O0SKjGFAPbECq0HDPVYZEKST4LtvvHO9czxYwA2eMDIMXQTcQ
 QIpccrEhlIHmlgy158UGqCzZHLPGuGWpCp+4Bi6n5drnW66NttXLMkLsTkJKnVsplltgSYpgbU2
 ezD62Nkd/CMqjHKpQQmkm6NcdzKo=
X-Received: by 2002:a25:1c1:: with SMTP id 184mr35818412ybb.243.1604496036774; 
 Wed, 04 Nov 2020 05:20:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOapEBYTqm3gh/IGxJD82cO0BGlRwHh13SXbjnEcsRym2zNBGWyjvIU9Pyj1uW/CGJmY2RLpJTnJn5Cpj2ANM=
X-Received: by 2002:a25:1c1:: with SMTP id 184mr35818379ybb.243.1604496036548; 
 Wed, 04 Nov 2020 05:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201103191327.11081-4-pvorel@suse.cz>
 <20201104073008.GB8632@pevik>
In-Reply-To: <20201104073008.GB8632@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 4 Nov 2020 21:20:24 +0800
Message-ID: <CAEemH2dx2wYT0dHcDnFnZ0sqY8MO1QOb1-qEmgRSPdFLO=9NUw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2 03/11] docparse: Add test documentation parser
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
Cc: Cyril Hrubis <metan@ucw.cz>, automated-testing@yoctoproject.org,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1934252433=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1934252433==
Content-Type: multipart/alternative; boundary="0000000000004d6bbb05b347d8dc"

--0000000000004d6bbb05b347d8dc
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2020 at 3:30 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> > --- /dev/null
> > +++ b/docparse/docparse.c
>
> ...
> > +const char *next_token(FILE *f, struct data_node *doc)
> > +{
> > +     size_t i = 0;
> > +     static char buf[4096];
> > +     int c;
> > +     int in_str = 0;
> > +
> > +     for (;;) {
> > +             c = fgetc(f);
> > +
> > +             if (c == EOF)
> > +                     goto exit;
> > +
> > +             if (in_str) {
> > +                     if (c == '"') {
> > +                             if (i == 0 || buf[i-1] != '\\') {
> > +                                     buf[i++] = c;
> > +                                     goto exit;
> > +                             }
> IMHO this change (adding buf[i++] = c;), which Li suggested,
> is causing build failures:
> https://travis-ci.org/github/pevik/ltp/builds/741217630
>
> /usr/src/ltp/docparse/testinfo.pl metadata.json
> , or ] expected while parsing array, at character offset 340 (before
> "",\n      "0c461cb72...") at /usr/src/ltp/docparse/testinfo.pl line 379.
> make[1]: *** [/usr/src/ltp/docparse/Makefile:60: txt] Error 255
> make[1]: Leaving directory '/usr/src/ltp-build/docparse'
> make: *** [/usr/src/ltp/Makefile:108: docparse-all] Error 2
> make: *** Waiting for unfinished jobs....
>

Sorry for the error, it because of wrongly parsed tst_test struct with
including .min_kver = "2.6.32",  then output into metada.json like:

# cat metadata.json
...
  "cpuset01": {
   "needs_root": "1",
   "forks_child": "1",
   "min_kver": "2.6.32"",  <====== here has two "" in the end
   "fname": "testcases/kernel/mem/cpuset/cpuset01.c"
  },

So the "$(abs_srcdir)/testinfo.pl metadata.json" in Makefile report failure
as above.

==========

Another fix I can think of is just to avoid return NULL if detecting in the
string("").
Hope this will work for us, I will help to check it again tomorrow.

--- a/docparse/docparse.c
+++ b/docparse/docparse.c
@@ -138,10 +138,8 @@ const char *next_token(FILE *f, struct data_node *doc)

                if (in_str) {
                        if (c == '"') {
-                               if (i == 0 || buf[i-1] != '\\') {
-                                       buf[i++] = c;
+                               if (i == 0 || buf[i-1] != '\\')
                                        goto exit;
-                               }
                        }

                        buf[i++] = c;
@@ -189,7 +187,7 @@ const char *next_token(FILE *f, struct data_node *doc)
        }

 exit:
-       if (i == 0)
+       if (i == 0 && !in_str)
                return NULL;

        buf[i] = 0;


-- 
Regards,
Li Wang

--0000000000004d6bbb05b347d8dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 4, 2020 at 3:30 PM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/docparse/docparse.c<br>
<br>
...<br>
&gt; +const char *next_token(FILE *f, struct data_node *doc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t i =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static char buf[4096];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int in_str =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (;;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D fgetc(f);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (c =3D=3D EOF)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (in_str) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (c =3D=3D &#39;&quot;&#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0 || buf[i-1] !=3D &#39;\\&=
#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[i++] =3D=
 c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
IMHO this change (adding buf[i++] =3D c;), which Li suggested,<br>
is causing build failures:<br>
<a href=3D"https://travis-ci.org/github/pevik/ltp/builds/741217630" rel=3D"=
noreferrer" target=3D"_blank">https://travis-ci.org/github/pevik/ltp/builds=
/741217630</a><br>
<br>
/usr/src/ltp/docparse/<a href=3D"http://testinfo.pl" rel=3D"noreferrer" tar=
get=3D"_blank">testinfo.pl</a> metadata.json<br>
, or ] expected while parsing array, at character offset 340 (before &quot;=
&quot;,\n=C2=A0 =C2=A0 =C2=A0 &quot;0c461cb72...&quot;) at /usr/src/ltp/doc=
parse/<a href=3D"http://testinfo.pl" rel=3D"noreferrer" target=3D"_blank">t=
estinfo.pl</a> line 379.<br>
make[1]: *** [/usr/src/ltp/docparse/Makefile:60: txt] Error 255<br>
make[1]: Leaving directory &#39;/usr/src/ltp-build/docparse&#39;<br>
make: *** [/usr/src/ltp/Makefile:108: docparse-all] Error 2<br>
make: *** Waiting for unfinished jobs....<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Sorry for the err=
or, it because=C2=A0of wrongly parsed tst_test struct with</div><div class=
=3D"gmail_default" style=3D"font-size:small">including=C2=A0<span class=3D"=
gmail_default"></span>.min_kver =3D &quot;2.6.32&quot;,=C2=A0 then output i=
nto=C2=A0metada.json=C2=A0like:</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small"># cat metadata.json</div><div class=3D"gmail_default" style=3D"font-=
size:small">...</div><div class=3D"gmail_default" style=3D"font-size:small"=
>=C2=A0 &quot;cpuset01&quot;: {</div>=C2=A0 =C2=A0&quot;needs_root&quot;: &=
quot;1&quot;,<br>=C2=A0 =C2=A0&quot;forks_child&quot;: &quot;1&quot;,<br>=
=C2=A0 =C2=A0&quot;min_kver&quot;: &quot;2.6.32&quot;&quot;,<span class=3D"=
gmail_default" style=3D"font-size:small">=C2=A0 &lt;=3D=3D=3D=3D=3D=3D here=
 has two &quot;&quot; in the end</span><br>=C2=A0 =C2=A0&quot;fname&quot;: =
&quot;testcases/kernel/mem/cpuset/cpuset01.c&quot;<br>=C2=A0 },<br><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">So the &quot;=
$(abs_srcdir)/<a href=3D"http://testinfo.pl">testinfo.pl</a> metadata.json&=
quot; in Makefile report failure as above.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Another fix I can think of is just to avoid return =
NULL if detecting in the string(&quot;&quot;).</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Hope this will work for us,=C2=A0I will hel=
p to check it again tomorrow.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">--- a/docparse/docparse.c<br>+++ b/docparse/docparse.c<br>@@ -138,10 +=
138,8 @@ const char *next_token(FILE *f, struct data_node *doc)<br>=C2=A0<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (in_str) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (c =3D=3D &#39;&quot;&#39;) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (i =3D=3D 0 || buf[i-1] !=3D &#39;\\&#39;) {<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i++] =3D c;<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 0 || buf[i-1] !=3D &#39;\\&#39;)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exi=
t;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 buf[i++] =3D c;<br>@@ -189,7 +187,7 @@ const char *next_token(FILE *f, =
struct data_node *doc)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0<br>=C2=A0=
exit:<br>- =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 0)<br>+ =C2=A0 =C2=A0 =C2=A0 i=
f (i =3D=3D 0 &amp;&amp; !in_str)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return NULL;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf=
[i] =3D 0;<br></div><br></div><div><br></div></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--0000000000004d6bbb05b347d8dc--


--===============1934252433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1934252433==--

