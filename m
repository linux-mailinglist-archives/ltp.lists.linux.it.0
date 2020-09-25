Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A11AC2784CC
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 12:12:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48A353C2FEF
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 12:12:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 135403C13DC
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 12:12:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 0353E1000F32
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 12:12:27 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601028746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B10o+hMOW4mM6KomyMy8RPH3IFPTbSc2YPmb15zo0f4=;
 b=LWJQQ2xF8WmiGccbOXzXtQ7n9+V1juke+jo6t4ma12UKXMdgZUPXSl4YigzdYa8CA6X9mz
 hzaiVRb3q4dGnbKjYMknPpdcI8yL9H7z/1hORPodFfEjttqWLh8v2uadQITLCsYfpzPdRE
 dDiS07tUk+6VuSM1Ad1kQwkKS9ST/LM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-2NGLi4fOO_aKcSzSunuyCA-1; Fri, 25 Sep 2020 06:12:22 -0400
X-MC-Unique: 2NGLi4fOO_aKcSzSunuyCA-1
Received: by mail-yb1-f197.google.com with SMTP id q2so2239934ybo.5
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 03:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B10o+hMOW4mM6KomyMy8RPH3IFPTbSc2YPmb15zo0f4=;
 b=HGGZWu8j5VPCKj59gauIiYty+44wpsLlky4FEgzLz/x5KO4wl5hHshfHDbUnx0uhPM
 I5O43sUh8lvxsAc9JgeHTUZc7D1anotanQOUwa98loujQOqXo5KOGqqBxPhMTovfscHs
 ICIj3wzBkQRWcIAnQTGiAwdkbH7ZsNiHU1O4HnerbvPu4Wjqep/zyVne8CcGQZZKMVhF
 dh49zAHWflRrun8bFdoOciKRphUVBlhkI8azXZW2VbwGyS/6XZ2Cv0h4I5dk2r/9Ec7D
 9Dp7nYt6Uin/HNj9H4Mxilfm5qwrItnBwNEl+Uw4U+2V35MoB6ZyoKMxP3QVmcuvlLPJ
 XYPw==
X-Gm-Message-State: AOAM532bJ62TYq/Z1Fiuomtna4IJ97/vp4AeRp7TmFkzfMNCvl1WhY3S
 JJWVAZRwsj+FUtHq1K7fECG8OlQQ/dDGHBWXmRFJlSdJL4aIOOD34FGtu2PZzSgheJxff9k0Tal
 Xo1MeAtiq9NVGhDPV+9I766t/tMc=
X-Received: by 2002:a25:730a:: with SMTP id o10mr4479908ybc.403.1601028741610; 
 Fri, 25 Sep 2020 03:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBBML55u+Uw35oxwqfi9t6sM0m4azHhC+z0Q10/ifpP17t41E4JIrhkA2jwYyxu1z8nDGBMCFAXVnLGHSTGUc=
X-Received: by 2002:a25:730a:: with SMTP id o10mr4479879ybc.403.1601028741251; 
 Fri, 25 Sep 2020 03:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200924144246.12750-1-mdoucha@suse.cz>
 <20200924144246.12750-2-mdoucha@suse.cz>
In-Reply-To: <20200924144246.12750-2-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 25 Sep 2020 18:12:09 +0800
Message-ID: <CAEemH2cmi+sL5CkBT--0Mz+Kg9XVvcnxL7EwXdyxOHW9hdLeEw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] mmap18: Increase minimal stack mapping to 8KB
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
Content-Type: multipart/mixed; boundary="===============1169375091=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1169375091==
Content-Type: multipart/alternative; boundary="00000000000065de5f05b0208d23"

--00000000000065de5f05b0208d23
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2020 at 10:43 PM Martin Doucha <mdoucha@suse.cz> wrote:

> The first testcase keeps segfaulting on older kernels with only 4KB initial
> stack mapping
>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
>
Reviewed-by: Li Wang <liwang@redhat.com>


> ---
>
> Note: Increasing initial stack size to 8KB fixes the segfaults but I'm not
> entirely sure whether we shouldn't use PTHREAD_STACK_MIN as the minimal
> size
> instead. Pthread man page isn't entirely clear whether PTHREAD_STACK_MIN
> is
> the minimal value for stack size after it grows to the limit, or the
> minimal
> size of the initial stack mapping (before it starts growing).
>

I slightly think the latter, which means PTHREAD_STACK_MIN is the minimal
size of the initial stack mapping. So maybe better to use the
PTHREAD_STACK_MIN
as mmaped_size, we even don't need to have a MAX() there.


>
> On x86_64, PTHREAD_STACK_MIN is 4 pages (16KB). On PPC64, it's 2 pages
> (128KB).


>  testcases/kernel/syscalls/mmap/mmap18.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/mmap/mmap18.c
> b/testcases/kernel/syscalls/mmap/mmap18.c
> index 966bf673e..8b149fb93 100644
> --- a/testcases/kernel/syscalls/mmap/mmap18.c
> +++ b/testcases/kernel/syscalls/mmap/mmap18.c
> @@ -201,10 +201,11 @@ static void grow_stack_fail(size_t stack_size,
> size_t mapped_size)
>  static void run_test(void)
>  {
>         size_t stack_size = 8 * PTHREAD_STACK_MIN;
> +       size_t minsize = MAX(page_size, 8192);
>
> -       grow_stack_success(stack_size, page_size);
> +       grow_stack_success(stack_size, minsize);
>         grow_stack_success(stack_size, stack_size/2);
> -       grow_stack_fail(stack_size, page_size);
> +       grow_stack_fail(stack_size, minsize);
>         grow_stack_fail(stack_size, stack_size/2);
>  }
>
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

--00000000000065de5f05b0208d23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 24, 2020 at 10:43 PM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.cz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The fir=
st testcase keeps segfaulting on older kernels with only 4KB initial<br>
stack mapping<br>
<br>
Signed-off-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=
=3D"_blank">mdoucha@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gma=
il_default" style=3D"font-size:small"></span>Reviewed-by: Li Wang &lt;<a hr=
ef=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;=
</div><div><span class=3D"gmail_default"></span>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Note: Increasing initial stack size to 8KB fixes the segfaults but I&#39;m =
not<br>
entirely sure whether we shouldn&#39;t use PTHREAD_STACK_MIN as the minimal=
 size<br>
instead. Pthread man page isn&#39;t entirely clear whether <span class=3D"g=
mail_default" style=3D"font-size:small"></span><span class=3D"gmail_default=
" style=3D"font-size:small"></span>PTHREAD_STACK_MIN is<br>
the minimal value for stack size after it grows to the limit, or the minima=
l<br>
size of the initial stack mapping (before it starts growing).<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I slightly think the latter, which means <span class=3D"gmail_default"><=
/span>PTHREAD_STACK_MIN is the minimal</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">size of the initial stack mapping. So maybe better =
to use the PTHREAD_STACK_MIN</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">as mmaped_size, we even don&#39;t need to have a MAX() there.=
</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
On x86_64, PTHREAD_STACK_MIN is 4 pages (16KB). On PPC64, it&#39;s 2 pages<=
br>
(128KB).</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0testcases/kernel/syscalls/mmap/mmap18.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/sys=
calls/mmap/mmap18.c<br>
index 966bf673e..8b149fb93 100644<br>
--- a/testcases/kernel/syscalls/mmap/mmap18.c<br>
+++ b/testcases/kernel/syscalls/mmap/mmap18.c<br>
@@ -201,10 +201,11 @@ static void grow_stack_fail(size_t stack_size, size_t=
 mapped_size)<br>
=C2=A0static void run_test(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t stack_size =3D 8 * PTHREAD_STACK_MIN;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t minsize =3D MAX(page_size, 8192);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grow_stack_success(stack_size, page_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0grow_stack_success(stack_size, minsize);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 grow_stack_success(stack_size, stack_size/2);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0grow_stack_fail(stack_size, page_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0grow_stack_fail(stack_size, minsize);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 grow_stack_fail(stack_size, stack_size/2);<br>
=C2=A0}<br>
<br>
-- <br>
2.28.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000065de5f05b0208d23--


--===============1169375091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1169375091==--

