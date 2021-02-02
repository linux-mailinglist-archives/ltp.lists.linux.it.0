Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D58C130BCE4
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 12:25:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 923BB3C7448
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 12:25:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A57B93C5E30
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 12:25:35 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 005852005E2
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 12:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612265133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3OtsoHfc1NTbWser+3wqMyrHcSe14uojm4RlZq+yrtc=;
 b=aqRV9zKsk4DJrxvOuyo3w7kgwuYFioOJhDX5eIyjY8wGjJ6j7jnIE8h8Fn0ruPgmlvTwT7
 MjgKnkxEsvLJgIQyul67TSW8WXxgYX9l4vk9Kc90r9wjCQSivfmszeYZBYbPbodjDaPW9I
 7N7eiM2kiP2Jw6NHX+lES5DR2DPzWos=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-4O0FW5QkNsmHQKY1sVTVYw-1; Tue, 02 Feb 2021 06:25:31 -0500
X-MC-Unique: 4O0FW5QkNsmHQKY1sVTVYw-1
Received: by mail-yb1-f200.google.com with SMTP id c13so23249730ybg.8
 for <ltp@lists.linux.it>; Tue, 02 Feb 2021 03:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3OtsoHfc1NTbWser+3wqMyrHcSe14uojm4RlZq+yrtc=;
 b=U3say1koH/I7Gp46NEPBtj441yQ9nj6qWBXjPFCZ6jAxeMYs6IoTHlo1aKLG2ttgcT
 k5aUoV3eRzmULEu7Q2OAWxhWIa7Oz+FtQgq6rlehgLkMWRcTtukN6lyEq4N2y2yrCZZj
 Q03ArPn2yb5qdJ+U7Khb9HaOMxXZUIHmYOlRbIFmYeikUsr53Xj4M4+azlZaNiu8BV0P
 1kSnFT0sjCiTVsxzUNE8WvpLdP6waqpQP/5jtZ/5sz5BO5mGoI27gcAx63Czb/zETe6c
 r+RwkQ7VwXiX/n0FY0KlAir4RjqNpJSMBjwrj7VI0FZ4leZqloalO6eMFTELtRx2L1Os
 CJCA==
X-Gm-Message-State: AOAM531kidUypQ7w8/nTVBua+ZTY6uUvoa8Hvd1X2q4VGrlGFEH7Z2yz
 A3U5vechZUlemXxAmlFOaZnj2w7Qdp1nphKiHsr9LqezpIWcJI4i7pxK1wQnFfeWVpvYnr6gcpw
 tPn+zeZWOumJsTqy1gKB0vYbr66Y=
X-Received: by 2002:a25:1646:: with SMTP id 67mr31694931ybw.97.1612265130741; 
 Tue, 02 Feb 2021 03:25:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9rBN7cqXRy3t0fLO5c5xdYUjunZVbJeQIhGtDsGbcLXV+sK/bqXjRL7CxjXciL9zRUAf5/lRvCUWiHA9tRZI=
X-Received: by 2002:a25:1646:: with SMTP id 67mr31694918ybw.97.1612265130586; 
 Tue, 02 Feb 2021 03:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-7-pvorel@suse.cz>
 <YBRroFhaxdqCLv2i@pevik> <YBRs9sySYXT6Bwlk@pevik>
 <CAEemH2foqS4=kTPJ50f2OZmnGU7wn4Kth0Onet-a6EX1J45-Bw@mail.gmail.com>
 <YBkBZskAIFpyUGPO@pevik>
In-Reply-To: <YBkBZskAIFpyUGPO@pevik>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Feb 2021 19:25:18 +0800
Message-ID: <CAEemH2dKrgZLj08LQbtOQse757rEBoUCe2EnBniBaea3HpgdNw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2 6/6] zram: Increase timeout according to used
 devices
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
Content-Type: multipart/mixed; boundary="===============0780189219=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0780189219==
Content-Type: multipart/alternative; boundary="000000000000648ef805ba58bab4"

--000000000000648ef805ba58bab4
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Tue, Feb 2, 2021 at 3:38 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > On Sat, Jan 30, 2021 at 4:16 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> > > > Hi,
>
> > > > > +   TST_TIMEOUT=$((dev_num*200))
> > > > Actually on heavy loaded machine this is not enough due BTRFS.
> > > > I can add something like dev_num*600 or even -1 (then previous commit
> > > would not
> > > > be needed, but IMHO still useful).
>
>
> > I personally think -1 is better.
> OK. In that case we might avoid now unneeded previous commit.
>
>
>
> > > And bad thing is that it breaks other zram tests, because the timer
> > > probably
> > > does not allow to run the cleanup:
>
> > > _tst_setup_timer()
> > > {
> > > ...
> > >         sleep $sec && tst_res TBROK "test killed, timeout! If you are
> > > running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9
> > > -$pid &
>
> > > I'm not sure if shell allow us to do it better. Maybe sent different
> > > signal than
> > > SIGKILL and define 'trap _tst_do_exit' for that signal?
>
>
> > Sounds practicable. I guess sending SIGINT could make more sense, since
> > sometimes we use CTRL+C stop test in debugging by manual, test should
> > do cleanup work for that behavior too.
> We have already SIGINT defined for main shell process:
> trap "tst_brk TBROK 'test interrupted'" INT
>
> so CTRL+C is covered. So maybe run first SIGINT and then SIGKILL for safety
> reasons?
>

I'm fine with using SIGINT + SIGKILL.

Or, maybe another choice is to catch a signal SIGTERM?  Once we
cancel the specified signal in KILL command, it will try with SIGTERM
by default, if the test process can not be terminated, then a SIGKILL
may be sent.

--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -22,6 +22,7 @@ export TST_LIB_LOADED=1

 # default trap function
 trap "tst_brk TBROK 'test interrupted'" INT
+trap "_tst_do_exit" TERM

 _tst_do_exit()
 {
@@ -459,7 +460,7 @@ _tst_setup_timer()

        tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"

-       sleep $sec && tst_res TBROK "test killed, timeout! If you are
running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9
-$pid &
+       sleep $sec && tst_res TBROK "test terminated, timeout! If you are
running on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill --
-$pid &

        _tst_setup_timer_pid=$!


-- 
Regards,
Li Wang

--000000000000648ef805ba58bab4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Feb 2, 2021 at 3:38 PM Petr Vorel &lt=
;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; On Sat, Jan 30, 2021 at 4:16 AM Petr Vorel &lt;<a href=3D"mailto:pvore=
l@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br>
<br>
&gt; &gt; &gt; Hi,<br>
<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0TST_TIMEOUT=3D$((dev_num*200))<br>
&gt; &gt; &gt; Actually on heavy loaded machine this is not enough due BTRF=
S.<br>
&gt; &gt; &gt; I can add something like dev_num*600 or even -1 (then previo=
us commit<br>
&gt; &gt; would not<br>
&gt; &gt; &gt; be needed, but IMHO still useful).<br>
<br>
<br>
&gt; I personally think -1 is better.<br>
OK. In that case we might avoid now unneeded previous commit.<br>
<br>
<br>
<br>
&gt; &gt; And bad thing is that it breaks other zram tests, because the tim=
er<br>
&gt; &gt; probably<br>
&gt; &gt; does not allow to run the cleanup:<br>
<br>
&gt; &gt; _tst_setup_timer()<br>
&gt; &gt; {<br>
&gt; &gt; ...<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep $sec &amp;&amp; tst_res TB=
ROK &quot;test killed, timeout! If you are<br>
&gt; &gt; running on slow machine, try exporting LTP_TIMEOUT_MUL &gt; 1&quo=
t; &amp;&amp; kill -9<br>
&gt; &gt; -$pid &amp;<br>
<br>
&gt; &gt; I&#39;m not sure if shell allow us to do it better. Maybe sent di=
fferent<br>
&gt; &gt; signal than<br>
&gt; &gt; SIGKILL and define &#39;trap _tst_do_exit&#39; for that signal?<b=
r>
<br>
<br>
&gt; Sounds practicable. I guess sending SIGINT could make more sense, sinc=
e<br>
&gt; sometimes we use CTRL+C stop test in debugging by manual, test should<=
br>
&gt; do cleanup work for that behavior too.<br>
We have already SIGINT defined for main shell process:<br>
trap &quot;tst_brk TBROK &#39;test interrupted&#39;&quot; INT<br>
<br>
so CTRL+C is covered. So maybe run first SIGINT and then SIGKILL for safety=
<br>
reasons?<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">I&#39;m fine with using SIGINT + SIGKILL.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default">Or, maybe another choice is=C2=A0to catch a=C2=A0signal=C2=
=A0SIGTERM?=C2=A0 Once we</div><div class=3D"gmail_default">cancel the spec=
ified=C2=A0signal in KILL command, it will try with SIGTERM</div><div class=
=3D"gmail_default">by default, if the test process can not be terminated, t=
hen a SIGKILL</div><div class=3D"gmail_default" style=3D"font-size:small">m=
ay be sent.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">--- a/testcas=
es/lib/tst_test.sh<br>+++ b/testcases/lib/tst_test.sh<br>@@ -22,6 +22,7 @@ =
export TST_LIB_LOADED=3D1<br>=C2=A0<br>=C2=A0# default trap function<br>=C2=
=A0trap &quot;tst_brk TBROK &#39;test interrupted&#39;&quot; INT<br>+trap &=
quot;_tst_do_exit&quot; TERM<br>=C2=A0<br>=C2=A0_tst_do_exit()<br>=C2=A0{<b=
r>@@ -459,7 +460,7 @@ _tst_setup_timer()<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tst_res TINFO &quot;timeout per run is ${h}h ${m}m ${s}s&quot;<br>=
=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 sleep $sec &amp;&amp; tst_res TBROK &quot;=
test killed, timeout! If you are running on slow machine, try exporting LTP=
_TIMEOUT_MUL &gt; 1&quot; &amp;&amp; kill -9 -$pid &amp;<br>+ =C2=A0 =C2=A0=
 =C2=A0 sleep $sec &amp;&amp; tst_res TBROK &quot;test terminated, timeout!=
 If you are running on slow machine, try exporting LTP_TIMEOUT_MUL &gt; 1&q=
uot; &amp;&amp; kill -- -$pid &amp;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _tst_setup_timer_pid=3D$!<br></div></div><div><br></div></div><div><br>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000648ef805ba58bab4--


--===============0780189219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0780189219==--

