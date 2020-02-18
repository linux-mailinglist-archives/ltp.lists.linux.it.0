Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F916220F
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:10:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABB333C2551
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:10:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9A7E03C2393
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:10:44 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3C2251A01229
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582013441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TXVvSqF6S223bJuIN7eV/SCNcdwJ7jE7Dj4EdG9Mpc0=;
 b=ZudxFcGPs/8A7ye9I5MOtmlJE7PFkmX/fj97tos1SplMSdpyrBeYeIzIo3xTIinCnzqft/
 AMSpnrxgkXtWjZnuyVcdwsvcbQI2lfTNttjCZkqqbOMi6bOzVRjQxk0MAWDf7jIoZt/RGx
 zoXZRgNccR2R+SOdwH6YwA2Nd7+ZjW0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-nkSWr3yxNA2EEpNJZCuwGw-1; Tue, 18 Feb 2020 03:10:28 -0500
Received: by mail-ot1-f69.google.com with SMTP id 75so12006551otc.6
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 00:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=te3M1TCjDs6cczo+WZSMIidFEqW2PGAPX0kl+McHvqA=;
 b=QhqErfyYpwMCudxCZ0dOgEIbyJxldt/Nog77DiAz6Wb2qSTpUSnXdUKQZC6SwmTjh+
 vdMuqnFDfMZ75U8sTYJlZcCIHm7Oqec5OmgKyLjlRfFpJYt1/8TFXwIBiLi+xdYrWF9P
 3irD/Zm0sq4nSkMeCA1ixFH1o2WDU3rC5psgD1FivZGHmtIIMUU9UixRnt6xnzChDrXC
 6iJ5h2a9gCUH6rmQZ4uoe+pTjAd4XcNaVG5laKjyg101c4luloAWeIU3DhDRNdPaXFS1
 UvGseQbzeSyO/CLusggMPnzI2vBqINzHZ+CZfpve5s4fCifp0JdslLI+h3WR2EWvJU+h
 yapg==
X-Gm-Message-State: APjAAAVc3+rRi6qotHsam3crJ7VG06KZC3wVbFW7XNUVIosfCqnl3kZ/
 uyUgIAJqokAkh59OwC5Dj6fdpUVPbwbYe7wr3ZRCNemiGqboPJ0HQEoN3ltlCSlsmtQp9NxwuYz
 TbFdD1MbNzs4POS69TBpgb1/7N7I=
X-Received: by 2002:a9d:6c55:: with SMTP id g21mr15154694otq.264.1582013427162; 
 Tue, 18 Feb 2020 00:10:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDq3Kp2uVkzTD4eRnsZZ89148AYHlkue8L3tQqJINNXvGIxCvmfPnppHFfMKBXxZmGix+aiHylX8C7d+o8Jw0=
X-Received: by 2002:a9d:6c55:: with SMTP id g21mr15154675otq.264.1582013426813; 
 Tue, 18 Feb 2020 00:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20200207112236.16462-1-mdoucha@suse.cz>
 <CAEemH2dEco268yqDyDjX25FPs3V7wTBija4HiMrf8nr0W7qVQQ@mail.gmail.com>
 <0090dabb-76fa-ea3d-2f96-4c4e50146bba@suse.cz>
In-Reply-To: <0090dabb-76fa-ea3d-2f96-4c4e50146bba@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Feb 2020 16:10:15 +0800
Message-ID: <CAEemH2fAQrgRNo1+gEY4NREUh=w+qCjnrrJxpf2Z=gBb5CUbUg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: nkSWr3yxNA2EEpNJZCuwGw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] Redesign TST_RETRY_FUNC()
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
Content-Type: multipart/mixed; boundary="===============1495474560=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1495474560==
Content-Type: multipart/alternative; boundary="00000000000055df0d059ed534db"

--00000000000055df0d059ed534db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 10:16 PM Martin Doucha <mdoucha@suse.cz> wrote:

> On 2/8/20 7:35 AM, Li Wang wrote:
> > 1. We need to update the doc/test-writing-guidelines.txt too.
>
> Right. I'll resubmit in a moment.
>
> > 2. Maybe better to let the shell version is consistent with this new?
>
> That doesn't make much sense. Shell programs and functions have much
> simpler call conventions than C functions. If you really need to test a
> more complex result than a single return value in shell, writing a
> wrapper function is much easier than writing a validator function.
>

According to the default convention of LTP, we maintain two versions of LTP
APIs(C and Shell), we always keep them consistent for creating unified
tests.

But here I'm OK to reserve a difference for the TST_RETRY_FUNC macro
because it looks a bit complicated to achieve the same one in shell. If
anyone has different thought please let me know :).


> In C, it's the other way around. Writing a wrapper function would often
> be a ton of work compared to writing a simple retval validator macro.
>
> > 3. I remember there were discussions to support enabling infinite loop
> > in TST_RETRY_FUNC, but not sure if it is possible to add in this patch,
> > or we can do that after your patch merged.
> > http://lists.linux.it/pipermail/ltp/2019-October/013896.html
>
> I'll leave that to someone else. Though I'd say that timeout of
> (1ULL<<40) should be infinite enough for everybody. All we need to do is
> change tst_delay_ and tst_max_delay_ type to unsigned long long.
>
Right. It seems no special need to achieve the infinite loop so far.

>
> >     ...
> >             sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(),
> >     defunct_tid);
> >     -       TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), -1=
,
> >     15);
> >     +       ret =3D TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path,
> R_OK),
> >     +               CHECK_ENOENT, 15);
> >
> >
> > The test total timeout is set to 20 seconds, here reserve 15 seconds is
> > too much for the macro looping because doing exponential backoff in
> > 15secs(1us+2us+4us+..) actually larger than the 20secs. So I suggest
> > raising the tst_test.timeout at the same time or set a smaller value to
> > MAX_DELAY.
>
> Actually, this entire retry loop will never take longer than 17 seconds.
> The last single delay will be at most 8.4 seconds (2^23 microseconds)
> long and the total combined delay before that will also take 8.4
> seconds. The next delay would be 16.8 seconds which is too much so the
> loop will end. The main test function takes only a few milliseconds so
> there's no problem even in the worst case scenario.
>
> I can change the delay to 9 seconds if you want. It'll make no
> difference in practice but the code will be less confusing to humans.
>
> --
> Martin Doucha   mdoucha@suse.cz
> QA Engineer for Software Maintenance
> SUSE LINUX, s.r.o.
> CORSO IIa
> Krizikova 148/34
> 186 00 Prague 8
> Czech Republic
>
>

--=20
Regards,
Li Wang

--00000000000055df0d059ed534db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 17, 2020 at 10:16 PM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.cz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2/8/=
20 7:35 AM, Li Wang wrote:<br>
&gt; 1. We need to update the doc/test-writing-guidelines.txt=C2=A0too.<br>
<br>
Right. I&#39;ll resubmit in a moment.<br>
<br>
&gt; 2. Maybe better to let the shell version is consistent with this new?<=
br>
<br>
That doesn&#39;t make much sense. Shell programs and functions have much<br=
>
simpler call conventions than C functions. If you really need to test a<br>
more complex result than a single return value in shell, writing a<br>
wrapper function is much easier than writing a validator function.<br></blo=
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">According to the default convention of LTP, we maintain two versions of =
LTP APIs(C and Shell), we always keep them consistent for creating unified =
tests.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">But here I&#39;m O=
K to reserve a difference for the TST_RETRY_FUNC macro because it looks a b=
it=C2=A0complicated to achieve=C2=A0the same one in shell. If anyone has di=
fferent thought please let me know :).</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In C, it&#39;s the other way around. Writing a wrapper function would often=
<br>
be a ton of work compared to writing a simple retval validator macro.<br>
<br>
&gt; 3. I remember there were discussions to support enabling infinite loop=
<br>
&gt; in=C2=A0TST_RETRY_FUNC, but not sure if it is possible to add in this =
patch,<br>
&gt; or we can do that after your patch merged.<br>
&gt; <a href=3D"http://lists.linux.it/pipermail/ltp/2019-October/013896.htm=
l" rel=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp=
/2019-October/013896.html</a><br>
<br>
I&#39;ll leave that to someone else. Though I&#39;d say that timeout of<br>
(1ULL&lt;&lt;40) should be infinite enough for everybody. All we need to do=
 is<br>
change tst_delay_ and tst_max_delay_ type to unsigned long long.<br></block=
quote><div class=3D"gmail_default" style=3D"font-size:small"></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Right. It seems no special n=
eed to achieve the infinite=C2=A0loop so far.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(defunct_tid_pat=
h, &quot;/proc/%d/task/%d&quot;, getpid(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0defunct_tid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_RETRY_FN_EXP_BACKOF=
F(access(defunct_tid_path, R_OK), -1,<br>
&gt;=C2=A0 =C2=A0 =C2=A015);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D TST_RETRY_FN_EX=
P_BACKOFF(access(defunct_tid_path, R_OK),<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0CHECK_ENOENT, 15);<br>
&gt; <br>
&gt; <br>
&gt; The test total timeout is set to 20 seconds, here reserve 15 seconds i=
s<br>
&gt; too much for the macro looping because doing exponential backoff in<br=
>
&gt; 15secs(1us+2us+4us+..) actually larger than the 20secs. So I suggest<b=
r>
&gt; raising the tst_test.timeout=C2=A0at the same time or set a smaller va=
lue to<br>
&gt; MAX_DELAY.<br>
<br>
Actually, this entire retry loop will never take longer than 17 seconds.<br=
>
The last single delay will be at most 8.4 seconds (2^23 microseconds)<br>
long and the total combined delay before that will also take 8.4<br>
seconds. The next delay would be 16.8 seconds which is too much so the<br>
loop will end. The main test function takes only a few milliseconds so<br>
there&#39;s no problem even in the worst case scenario.<br>
<br>
I can change the delay to 9 seconds if you want. It&#39;ll make no<br>
difference in practice but the code will be less confusing to humans.<br>
<br>
-- <br>
Martin Doucha=C2=A0 =C2=A0<a href=3D"mailto:mdoucha@suse.cz" target=3D"_bla=
nk">mdoucha@suse.cz</a><br>
QA Engineer for Software Maintenance<br>
SUSE LINUX, s.r.o.<br>
CORSO IIa<br>
Krizikova 148/34<br>
186 00 Prague 8<br>
Czech Republic<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000055df0d059ed534db--


--===============1495474560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1495474560==--

