Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B3BEFAE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15D583C2325
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 142ED3C1A9D
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:33:49 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 002CC1A01217
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 07:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569476976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHLidqE5K+VQKrY2OaUiJTjihwBiaMR6aRGBi3/K/fI=;
 b=VLHlkPRShOzidSb7ojzq2M2rwo1Y0HfdYxnoIbuqN4VX8PdBQkA8fH9vWAcNqBI3ssiXw6
 0goLFvuU2W1yl+8Dsri72S1LVPjuSXyWgGpIZr7cx7CLgXm1Lwq8C9YQHZi/0e4Xwmygq+
 CLWe4QkFnPVHiw5QCNHMxCl6Cbg0H2c=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-C1HnNW7lMOm34ptxWU3AaA-1; Thu, 26 Sep 2019 01:48:57 -0400
Received: by mail-oi1-f197.google.com with SMTP id h204so581605oib.17
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 22:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P4R40VcP/LZO/OW39Gh/DdKMxto99Ql+HsKvr9B79pU=;
 b=sskZYrMTfrXWHi1d6u5rTfT7YBEOaCC7sBNJEBg4HuSEZ09EPRoKAvdnnU2IcL4aIV
 /vTzUmAts26zSi6Kgdq7LeVUP92mkmnqyH/1rIturX8nI2Sqgq/T3WjHbHaXzzdHYHPl
 PtNgqNTmmum+o5PcwDWRiOQLIL3ZBdzlQv9wvhgnsBCbeDssZqk303kKH7OrxJJi7atg
 d0XBrXWdS+F50Lk11lp2CAVVlVj0aO7CilheaS+tTa9kebLcdtvE+0sS/NNo7VmRpFSG
 m+DbJT6LJMFMj99A4mT6y6hPr+pzMWeEToLdyJbGiGrgREvS6PllhrOZv4XdCi+B5KrK
 zRkg==
X-Gm-Message-State: APjAAAX9viqtwtkHnpLhhFOJALVdgCxCJ3VMHB4A89oVV7wPlp66yOAE
 Levp3f83mwEUgKupn+eTGKbdbPqCiH+I2aZnX4TiJWcW9vF3ymf/9smU5lr2xEHyA3LoXFMdu3M
 hT2hpxkN4qd9AUkpzvGS1ctF+yfg=
X-Received: by 2002:aca:4a0b:: with SMTP id x11mr1268270oia.138.1569476936706; 
 Wed, 25 Sep 2019 22:48:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8TNdrdQalngL4LzC/3+LbIBY26/Du1wkUJCMwcnrpc1WPXgYhqFImzXk3bhNhkB8yED2OELuMlp6v7r8aumY=
X-Received: by 2002:aca:4a0b:: with SMTP id x11mr1268259oia.138.1569476936417; 
 Wed, 25 Sep 2019 22:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190924105801.7616-1-liwang@redhat.com>
 <87wodxkgr4.fsf@rpws.prws.suse.cz>
 <CAEemH2f-5zcvrHep30tWubA7LTqOgKbeBbuN7PO+1h70e3B0hA@mail.gmail.com>
 <87ef04ycxv.fsf@rpws.prws.suse.cz>
 <CAEemH2fmTHzWh=dnzFfPCrJ8-3WuXUHa_VheGj73WjcJfuiwKA@mail.gmail.com>
 <87d0foy3nm.fsf@rpws.prws.suse.cz>
In-Reply-To: <87d0foy3nm.fsf@rpws.prws.suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 26 Sep 2019 13:48:44 +0800
Message-ID: <CAEemH2e-xAdBiTGuswcPhrw30bEoYTj4OHN0jBgUVpyEUJgXjQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-MC-Unique: C1HnNW7lMOm34ptxWU3AaA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] fzsync: revoke thread_b if parent hits an
 accidental break
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
Cc: LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============1118286588=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1118286588==
Content-Type: multipart/alternative; boundary="000000000000475f0c05936e5353"

--000000000000475f0c05936e5353
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2019 at 8:13 PM Richard Palethorpe <rpalethorpe@suse.de>
wrote:

> ...
> I'm not sure what you are saying. However you could do something like
> this (I haven't tested it):
>

I misunderstood your words in the last mail, sorry about that.


>
> struct tst_fzsync_run_thread
> {
>         void *(*run)(void *);
>         void *arg;
> };
>
> static void tst_fzsync_thread_wrapper(void *arg)
> {
>         struct tst_fzsync_run_thread t =3D *(struct tst_fzsync_run_thread
> *)arg;
>
>         pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS);
>         pthread_setcancelstate(PTHREAD_CANCEL_ENABLE);
>
>         t.run(t.arg);
> }
>
> static void tst_fzsync_pair_reset(..., struct tst_fzsync_run_thread *run_=
b)
>

I'd like to keep the tst_fzync_pair_reset() API no change to user.

The patch v4.1 like below, is there any improper place in usage?

@@ -218,12 +219,36 @@ static void tst_fzsync_pair_init(struct
tst_fzsync_pair *pair)
 static void tst_fzsync_pair_cleanup(struct tst_fzsync_pair *pair)
 {
        if (pair->thread_b) {
-               tst_atomic_store(1, &pair->exit);
+               /* Revoke thread B if parent hits accidental break */
+               if (!pair->exit) {
+                       tst_atomic_store(1, &pair->exit);
+                       usleep(100000);
+                       pthread_cancel(pair->thread_b);
+               }
                SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
                pair->thread_b =3D 0;
        }
 }

+/** To store the run_b pointer and pass to tst_fzsync_thread_wrapper */
+struct tst_fzsync_run_thread {
+       void *(*func)(void *);
+       void *arg;
+};
+
+/**
+ * Wrap run_b for tst_fzsync_pair_reset to enable pthread cancel
+ * at the start of the thread B.
+ */
+static void *tst_fzsync_thread_wrapper(void *run_thread)
+{
+       struct tst_fzsync_run_thread t =3D *(struct tst_fzsync_run_thread
*)run_thread;
+
+       pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
+       pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
+       return t.func(t.arg);
+}
+
 /**
  * Zero some stat fields
  *
@@ -271,8 +296,10 @@ static void tst_fzsync_pair_reset(struct
tst_fzsync_pair *pair,
        pair->a_cntr =3D 0;
        pair->b_cntr =3D 0;
        pair->exit =3D 0;
-       if (run_b)
-               SAFE_PTHREAD_CREATE(&pair->thread_b, 0, run_b, 0);
+       if (run_b) {
+               struct tst_fzsync_run_thread wrap_run_b =3D {.func =3D run_=
b,
.arg =3D NULL};
+               SAFE_PTHREAD_CREATE(&pair->thread_b, 0,
tst_fzsync_thread_wrapper, &wrap_run_b);
+       }

        pair->exec_time_start =3D (float)tst_timeout_remaining();
 }


> Note that in any case you can't reliably cast a function pointer to a
> void pointer without some magic. I am guessing wrapping it in a struct
> is the clearest way to do it.
>

Good to know this, I searched on google and confirmed that the C standard
does not allow to cast function pointer to void*, thanks!


>
> You can remove the arg altogether, but I kept it because we have a
> struct anyway to wrap the function pointer.
>

Yes, to keep it make the wrapper struct is clear to understand.

--=20
Regards,
Li Wang

--000000000000475f0c05936e5353
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 8:13 PM Richard Palethorpe =
&lt;<a href=3D"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail_default" style=3D"font-size:small">...</span><br>
I&#39;m not sure what you are saying. However you could do something like<b=
r>
this (I haven&#39;t tested it):<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I misunderstood your words =
in the last mail, sorry about that.</div></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
struct tst_fzsync_run_thread<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *(*run)(void *);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *arg;<br>
};<br>
<br>
static void tst_fzsync_thread_wrapper(void *arg)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct tst_fzsync_run_thread t =3D *(struct tst=
_fzsync_run_thread *)arg;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONO=
US);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_setcancelstate(PTHREAD_CANCEL_ENABLE);<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.run(t.arg);<br>
}<br>
<br>
static void tst_fzsync_pair_reset(..., struct tst_fzsync_run_thread *run_b)=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;d like to keep the tst_fzync_pair_reset() API no cha=
nge to user.</div></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">The pa=
tch v4.1 like below, is there any=C2=A0improper place in usage?</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">@@ -218,12 +219,36 @@ static void ts=
t_fzsync_pair_init(struct tst_fzsync_pair *pair)<br>=C2=A0static void tst_f=
zsync_pair_cleanup(struct tst_fzsync_pair *pair)<br>=C2=A0{<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (pair-&gt;thread_b) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 tst_atomic_store(1, &amp;pair-&gt;exit);<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Revoke thread B if parent hits=
 accidental break */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (!pair-&gt;exit) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_atomic_store(1, &amp;pair-&gt;exit);<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 usleep(100000);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_cancel(pair-&gt;thread_b);<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_PTHREAD_JOIN(pair-&gt;thread_b, NULL);<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pair-&gt;thread_b =
=3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0}<br>=C2=A0<br>+/** To sto=
re the run_b pointer and pass to tst_fzsync_thread_wrapper */<br>+struct ts=
t_fzsync_run_thread {<br>+ =C2=A0 =C2=A0 =C2=A0 void *(*func)(void *);<br>+=
 =C2=A0 =C2=A0 =C2=A0 void *arg;<br>+};<br>+<br>+/**<br>+ * Wrap run_b for =
tst_fzsync_pair_reset to enable pthread cancel<br>+ * at the start of the t=
hread B.<br>+ */<br>+static void *tst_fzsync_thread_wrapper(void *run_threa=
d)<br>+{<br>+ =C2=A0 =C2=A0 =C2=A0 struct tst_fzsync_run_thread t =3D *(str=
uct tst_fzsync_run_thread *)run_thread;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 pthr=
ead_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);<br>+ =C2=A0 =C2=A0 =
=C2=A0 pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);<br>+ =C2=A0 =C2=
=A0 =C2=A0 return t.func(t.arg);<br>+}<br>+<br>=C2=A0/**<br>=C2=A0 * Zero s=
ome stat fields<br>=C2=A0 *<br>@@ -271,8 +296,10 @@ static void tst_fzsync_=
pair_reset(struct tst_fzsync_pair *pair,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pai=
r-&gt;a_cntr =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pair-&gt;b_cntr =3D 0;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pair-&gt;exit =3D 0;<br>- =C2=A0 =C2=A0 =C2=
=A0 if (run_b)<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_P=
THREAD_CREATE(&amp;pair-&gt;thread_b, 0, run_b, 0);<br>+ =C2=A0 =C2=A0 =C2=
=A0 if (run_b) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct tst_fzsync_run_thread wrap_run_b =3D {.func =3D run_b, .arg =3D NULL};<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_PTHREAD_CREATE(&a=
mp;pair-&gt;thread_b, 0, tst_fzsync_thread_wrapper, &amp;wrap_run_b);<br>+ =
=C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 pair-&gt;ex=
ec_time_start =3D (float)tst_timeout_remaining();<br>=C2=A0}<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Note that in any case you can&#39;t reliably cast a function pointer to a<b=
r>
void pointer without some magic. I am guessing wrapping it in a struct<br>
is the clearest way to do it.<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Good to know this, I searched=
 on google and confirmed that the C standard does not allow to cast functio=
n pointer to void*, thanks!</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
You can remove the arg altogether, but I kept it because we have a<br>
struct anyway to wrap the function pointer.<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Yes, to keep it=
 make the wrapper struct is clear to understand.</div></div></div><div><br>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000475f0c05936e5353--


--===============1118286588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1118286588==--

