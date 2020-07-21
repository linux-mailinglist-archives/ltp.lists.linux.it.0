Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AF72280CC
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 15:19:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38E323C2948
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 15:19:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 237A83C072E
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 15:19:36 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6443F1000C5F
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 15:19:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595337574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8MOWOfPZ8u7d73J81AmLrQEBQffoNx/D4bR4w/abEH4=;
 b=MCd4MLVoxHA8PRm/LLD9Lw3VO/xqfRXRKjgbat3hmFWBcheQJMdywreg+hcdQBDBxVgsf8
 5apP21E1qaDyG8Cp3jRUx6zUwTp4WgChZ2drh6PslHU4CiSUeLOS81Flu+/bM3q8P0VgUT
 85MNG9+rM2NxvLqVIilXEzU3MsgcFmQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-c_haTIBJPbuDOg7-8DbFPg-1; Tue, 21 Jul 2020 09:19:32 -0400
X-MC-Unique: c_haTIBJPbuDOg7-8DbFPg-1
Received: by mail-lf1-f70.google.com with SMTP id n4so2458518lfe.13
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 06:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MOWOfPZ8u7d73J81AmLrQEBQffoNx/D4bR4w/abEH4=;
 b=aS9ongVL1naOA/XdyFtqzqqCtuEz6jzChkYpKEGOp+4kKZ8iuC4uOA3b/6ykzuwL8u
 5IiXBptv5YF6Nt02LxSTtguGO4EDnmPDV4WMMFEk1COOBdN2QSnMJAGI6qXBRmTAA0y6
 68OkkrBdLa8LiB/24tkJJ0RIn0KeNFJ9bDsu7DUYff96zM8UZwzAYhx+64ozwt7bAbh3
 5QhU1wrGe31BbXv+iCchQvSfRJS/aGlRKRcrdemTXG24/mG0r3WLx3P6I2S10L8gVl29
 qqejhdA7yx/qJIw0z9RzpnaYDW3TW//GfhQuUSbzaolnMnqOE9ykT8XU1x253iWcvWZr
 vYWQ==
X-Gm-Message-State: AOAM531t74lcoA1DsGSikVXFWJMHVyPPJI/fUN6w6O5E9x/Xa31KwJx+
 0ShEFkP9TczRotyvY5kES1ynqyRsceJMh4N8RQXYm3Tji4yCdrRB3gjYYdvEFuh7akQYHSaqSnI
 U5mSF4V1etORcCxJFXJ15seJW/sg=
X-Received: by 2002:ac2:4294:: with SMTP id m20mr9844229lfh.147.1595337570083; 
 Tue, 21 Jul 2020 06:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7S8mh1K/D6mlsct7MlMyT1nlLIvhaeqxq0+2u1pCR1Z3zZR7uA4KtEJs3jHNVORiZowJNjg9FqbRyXf1Ztl8=
X-Received: by 2002:ac2:4294:: with SMTP id m20mr9844220lfh.147.1595337569848; 
 Tue, 21 Jul 2020 06:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200720194920.22784-1-ernunes@redhat.com>
 <CAEemH2c1Sz+pkcLnCoWWCaMCte7QsmUTOoUxU6fzCF32nrrG+w@mail.gmail.com>
 <98eaa723-1349-272d-3021-d2fef6e1abdd@redhat.com>
In-Reply-To: <98eaa723-1349-272d-3021-d2fef6e1abdd@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Jul 2020 21:19:17 +0800
Message-ID: <CAEemH2e0nwt_aOytJz0WzB3CYSirxa4myOZoQqCPTAVBL11gbQ@mail.gmail.com>
To: Erico Nunes <ernunes@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
Content-Type: multipart/mixed; boundary="===============0640959941=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0640959941==
Content-Type: multipart/alternative; boundary="00000000000025e92905aaf3794b"

--00000000000025e92905aaf3794b
Content-Type: text/plain; charset="UTF-8"

Erico,

On Tue, Jul 21, 2020 at 4:57 PM Erico Nunes <ernunes@redhat.com> wrote:

> ...
>
> > Maybe renaming the function to tst_lockdown_enabled() is better? Then we
> > can return 1 if confirm kernel under lockdown mode otherwise 0.
>

How do you think about this suggestion? ^^

Another reason to name it as tst_lockdown_enabled() is, we can give more
flexible
to test case, because not all tests need a simple skip in lockdown mode(in
future).

i.e.
if (tst_lockdown_enabled()) {
   // skip or not,
   // do what they wanted in this mode
}


> After thinking over, I guess it's not enough to only check
> > /sys/../lockdown file. Seems we need to consider the situation that
> > system without supporting this file?
> >
> > i.e.
> >   Test on RHEL8 (no /sys/../lockdown file) with kernel parameter
> > "lockdown" and got the restriction error too.
> >
> > # cat /proc/cmdline
> > BOOT_IMAGE=(hd0,msdos1)/vmlinuz-4.18.0-226.el8.x86_64
> > root=/dev/mapper/rhel_bootp--73--3--209-root ro console=ttyS0,115200
> > ... lockdown
> >
> > # ll /sys/kernel/security/lockdown
> > ls: cannot access '/sys/kernel/security/lockdown': No such file or
> directory
>
> To my understanding, the parameter to enable lockdown through kenrel
> parameters is "lockdown={integrity|confidentiality}", not just
> "lockdown", at least on upstream kernels:
>

Good to know this.


>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aefcf2f4b58155d27340ba5f9ddbe9513da8286d
>


>
> If /sys/kernel/security/lockdown doesn't exist, I'm not sure there is
> much we can do easily, or that is worth doing now. I think it is ok to
> fall back and fail like it has been happening since the feature was
> merged upstream.
>

Yes, it looks a bit tricky.


> I can't see a tweak that would enable the feature but not the sysfs file
> in the kernel source. Maybe that kernel only had partial support?
>

Seems you're right, there are many differences between mainline-kernel
and some distros in lockdown code. The reason that some distribution
(i.e RHEL, Ubuntu) partly customizes the LSM feature, it does not support
lockdown features completely so far.

But one point we're sure is that the /sys/kernel/../lockdown file was
introduced from kernel-v5.4.

So maybe we could simply do detect the /sys/kernel/../loackdown file as
your patch,
but adding an extra warning print when test failed on older than
kernel-v5.4.

Or, if others can provide a better way I'd happy to hear.

-- 
Regards,
Li Wang

--00000000000025e92905aaf3794b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Erico,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Jul 21, 2020 at 4:57 PM Erico Nunes &lt;<=
a href=3D"mailto:ernunes@redhat.com" target=3D"_blank">ernunes@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><s=
pan class=3D"gmail_default" style=3D"font-size:small">...</span><br><br>
&gt; Maybe renaming the function to tst_lockdown_enabled() is better? Then =
we<br>
&gt; can return=C2=A01 if confirm kernel under lockdown mode otherwise 0.<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">How do you think about this suggestion? ^^</div></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Another reason=C2=A0to name it as ts=
t_lockdown_enabled() is, we can give more flexible</div><div class=3D"gmail=
_default" style=3D"font-size:small">to test case, because=C2=A0not all test=
s need a simple skip in lockdown mode(in future).</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">i.e.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">if (tst_lockdown_enabled()) {</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">=C2=A0 =C2=A0// skip or not,</div><div class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0// do what they w=
anted in this mode</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">}</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; After thinking over, I guess it&#39;s not enough to only check<br>
&gt; /sys/../lockdown file. Seems we need to consider the situation that<br=
>
&gt; system without supporting this file?=C2=A0<br>
&gt; <br>
&gt; i.e.=C2=A0<br>
&gt; =C2=A0 Test on RHEL8 (no /sys/../lockdown file) with kernel parameter<=
br>
&gt; &quot;lockdown&quot; and got the restriction error too.<br>
&gt; <br>
&gt; # cat /proc/cmdline=C2=A0<br>
&gt; BOOT_IMAGE=3D(hd0,msdos1)/vmlinuz-4.18.0-226.el8.x86_64<br>
&gt; root=3D/dev/mapper/rhel_bootp--73--3--209-root ro console=3DttyS0,1152=
00<br>
&gt; ...=C2=A0lockdown<br>
&gt; =C2=A0 =C2=A0=C2=A0<br>
&gt; # ll /sys/kernel/security/lockdown<br>
&gt; ls: cannot access &#39;/sys/kernel/security/lockdown&#39;: No such fil=
e or directory<br>
<br>
To my understanding, the parameter to enable lockdown through kenrel<br>
parameters is &quot;lockdown=3D{integrity|confidentiality}&quot;, not just<=
br>
&quot;lockdown&quot;, at least on upstream kernels:<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Good to=
 know this.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Daefcf2f4b58155d27340ba5f9ddbe9513da8286d" rel=3D"noreferrer=
" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/commit/?id=3Daefcf2f4b58155d27340ba5f9ddbe9513da8286d</a>=C2=A0=
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
If /sys/kernel/security/lockdown doesn&#39;t exist, I&#39;m not sure there =
is<br>
much we can do easily, or that is worth doing now. I think it is ok to<br>
fall back and fail like it has been happening since the feature was<br>
merged upstream.<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Yes, it looks a bit tricky.</div></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I can&#39;t see a tweak that would enable the feature but not the sysfs fil=
e<br>
in the kernel source. Maybe that kernel only had partial support?<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">Seems you&#39;re right, there are many differences between mainline-=
kernel</div><div class=3D"gmail_default" style=3D"font-size:small">and some=
 distros in lockdown code. The reason that some distribution</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">(i.e RHEL, Ubuntu) partly cus=
tomizes the LSM feature,=C2=A0it does not support</div><div class=3D"gmail_=
default" style=3D"font-size:small">lockdown features completely so far.</di=
v></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">But one point we&#39;r=
e sure is that the /sys/kernel/../lockdown file was</div><div class=3D"gmai=
l_default" style=3D"font-size:small">introduced from kernel-v5.4.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">So maybe we could simply do detect=
 the /sys/kernel/../loackdown file as your patch,</div><div class=3D"gmail_=
default" style=3D"font-size:small">but adding an extra warning print when t=
est failed on older than kernel-v5.4.</div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Or, if others can provide a be=
tter way I&#39;d happy to hear.</div></div><div>=C2=A0</div></div>-- <br><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--00000000000025e92905aaf3794b--


--===============0640959941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0640959941==--

