Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9E130F7C
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:32:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A414D3C24AE
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 10:32:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 091613C2457
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:32:30 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AC4336012CF
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 10:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578303147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E/IK3lwsTmST3rB2XmrE0s800Ov0FTufxmILtyxwHNE=;
 b=Qfm+t2VhXS+Itg/+1N0LN0ksXBZO05aGLuRKEGUEoUBiGiJrqrMgiD6Hms9RLpRtLDmLjg
 d76jSRlfAqOw+QHq7oh3KgAPx2Ulk5teFumbFgDa34kFm8FeaMCrOUL+5gMaIXQFCss4p7
 A9Nm1OqDQ8M2Zeq/4dDXTzzJ02kqoLs=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-xfDC5N-uMne6Sl3-qvCKog-1; Mon, 06 Jan 2020 04:32:22 -0500
Received: by mail-ot1-f72.google.com with SMTP id l13so20445243otn.18
 for <ltp@lists.linux.it>; Mon, 06 Jan 2020 01:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wan4Hujmvq/Ql1ZoZuFFX+SMgrWW4ljEakcBZJId9U8=;
 b=Ut/MTezL+Iwysvuk8jx1Zz8YuAgmYVLss8N90GfsxcOUXq9KJqVT4jxaj3gueCxdhU
 ZFta2qMQix+BCkjl3kzjXE+E0Tu+2Cxwdia8UBhaiprzEp7B4zOCpDcJm+oxGSc70+7m
 RhajFLE1HRoUH8DgJmdPIgZYUEpWXHIRRKXOdd3bvHLZK3qkBUaipCmGm5g230B+0EHr
 OgNnwhEm5o1VJ+B3c0l9iDHJf4VCVdsJ0QICcH+EaE32E1fgghe/eKBIxv+WRAFCfZnR
 TXtX9Wc9x2jvNOVaiSaHdNuBmdZHcrRE6nPE19KXt1YwPEFn7/+T94ePx4INU/INivY/
 XlbA==
X-Gm-Message-State: APjAAAVdrDOoQUl9AjcLaM0p3iD62tFMVHNxNH3jufVC7e8UalAwaPJh
 CRG57EsIeU2FaarkEqwNnk0iiOPV2k3bMEJUfT4Ie+aOlfooWAWEfHuK4avgquFqSfM2cV0BVwz
 xaqWAGrycTnpD8XKkpkNUULpzYw0=
X-Received: by 2002:a9d:7:: with SMTP id 7mr108239875ota.26.1578303141305;
 Mon, 06 Jan 2020 01:32:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyaWHtMN7x4ZrlwSFFMA+YCwVgllRF4FAd6ar0/FHEZBufIGBNn3rfb9ervbz7/jeAjjvJ01wTEhEO3qqmiW+A=
X-Received: by 2002:a9d:7:: with SMTP id 7mr108239857ota.26.1578303141064;
 Mon, 06 Jan 2020 01:32:21 -0800 (PST)
MIME-Version: 1.0
References: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eKbbXjonuiKMdHcRda98hJikmGW4=YtWft0-1QAj0oBQ@mail.gmail.com>
 <8a1a9b95-5c42-2176-857a-e3c36fa42b55@cn.fujitsu.com>
In-Reply-To: <8a1a9b95-5c42-2176-857a-e3c36fa42b55@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 6 Jan 2020 17:32:09 +0800
Message-ID: <CAEemH2dSAMkviMD6PnWZsJZghS2RiAbWN4ON0xNMY1UNN0qa+g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: xfDC5N-uMne6Sl3-qvCKog-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/userfaultfd01: add hint about
 unprivileged_userfaultfd
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
Content-Type: multipart/mixed; boundary="===============0285159546=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0285159546==
Content-Type: multipart/alternative; boundary="00000000000012567e059b75561d"

--00000000000012567e059b75561d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2020 at 5:10 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote=
:

> Hi Li
> >
> >
> > On Wed, Dec 18, 2019 at 12:02 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com
> > <mailto:xuyang2018.jy@cn.fujitsu.com>> wrote:
> >
> >     Since commit cefdca0a86be ("userfaultfd/sysctl: add
> >     vm.unprivileged_userfaultfd").
> >     , it adds a global sysctl knob "vm.unprivileged_userfaultfd" to
> >     control whether
> >     unprivileged users can use the userfaultfd system calls. Set this t=
o
> >     1 to allow
> >     unprivileged users to use the userfaultfd system calls, or set this
> >     to 0 to
> >     restrict userfaultfd to only privileged users (with SYS_CAP_PTRACE
> >     capability). The
> >     default value is 1. Add hint about it.
> >
> >
> > Can we do the "vm.unprivileged_userfaultfd" check in the setup() and do
> > set to 1 if it exists?
> I remembered Jan Stancek has a patch about bpf hint about
> unprivileged_bpf_disabled, I do as same as that patch did.
>

I just echo the nob file "unprivileged_bpf_disabled" and find it can't be
changed at runtime. So if the "vm.unprivileged_userfaultfd" is like this
behavior too, probably we can only do TCONF as your original patch. AnywayI
will take a close look at the kernel commit later.

# cat /proc/sys/kernel/unprivileged_bpf_disabled
1
# echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled
-bash: echo: write error: Invalid argument



>
> Also, month agos about acct02 discussion, Cyril points about adjusting
> the threshold value of resume and suppend to make case passes.
>
> So, I have a question that we have unified standards about these cases
> (bpf, acct02, affected by sysctl)? Report TCONF or modify argument to
> make case passes?
>
> @Cyril and @Jan Stancek What do you think about it?
>
> > And maybe we need more tests for the global sysctl knob
> > "vm.unprivileged_userfaultfd".Eeven though we don't have case to test
> unprivileged_bpf_disabled. I
> still think testing unprivileged_userfaultfd is meaningful and we can
> begin with it.
>
> Best Regards
> Yang Xu
> >
> >
> >     Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com
> >     <mailto:xuyang2018.jy@cn.fujitsu.com>>
> >     ---
> >       .../syscalls/userfaultfd/userfaultfd01.c      | 19
> +++++++++++++------
> >       1 file changed, 13 insertions(+), 6 deletions(-)
> >
> >     diff --git a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> >     b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> >     index a5e142209..4e178b4f8 100644
> >     --- a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> >     +++ b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> >     @@ -82,12 +82,19 @@ static void run(void)
> >
> >              set_pages();
> >
> >     -       uffd =3D sys_userfaultfd(O_CLOEXEC | O_NONBLOCK);
> >     -
> >     -       if (uffd =3D=3D -1)
> >     -               tst_brk(TBROK | TERRNO,
> >     -                       "Could not create userfault file
> descriptor");
> >     -
> >     +       TEST(sys_userfaultfd(O_CLOEXEC | O_NONBLOCK));
> >     +
> >     +       if (TST_RET =3D=3D -1) {
> >     +               if (TST_ERR =3D=3D EPERM) {
> >     +                       tst_res(TCONF, "Hint: check
> >     /proc/sys/vm/unprivileged_userfaultfd");
> >     +                       tst_brk(TCONF | TTERRNO,
> >     +                               "userfaultfd() requires
> >     CAP_SYS_PTRACE on this system");
> >     +               } else
> >     +                       tst_brk(TBROK | TTERRNO,
> >     +                               "Could not create userfault file
> >     descriptor");
> >     +       }
> >     +
> >     +       uffd =3D TST_RET;
> >              uffdio_api.api =3D UFFD_API;
> >              uffdio_api.features =3D 0;
> >              SAFE_IOCTL(uffd, UFFDIO_API, &uffdio_api);
> >     --
> >     2.18.0
> >
> >
> >
> >
> >     --
> >     Mailing list info: https://lists.linux.it/listinfo/ltp
> >
> >
> >
> > --
> > Regards,
> > Li Wang
>
>
>

--=20
Regards,
Li Wang

--00000000000012567e059b75561d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jan 6, 2020 at 5:10 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li<=
br>
&gt; <br>
&gt; <br>
&gt; On Wed, Dec 18, 2019 at 12:02 PM Yang Xu &lt;<a href=3D"mailto:xuyang2=
018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a> <=
br>
&gt; &lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_=
blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Since commit cefdca0a86be (&quot;userfaultfd/sysctl=
: add<br>
&gt;=C2=A0 =C2=A0 =C2=A0vm.unprivileged_userfaultfd&quot;).<br>
&gt;=C2=A0 =C2=A0 =C2=A0, it adds a global sysctl knob &quot;vm.unprivilege=
d_userfaultfd&quot; to<br>
&gt;=C2=A0 =C2=A0 =C2=A0control whether<br>
&gt;=C2=A0 =C2=A0 =C2=A0unprivileged users can use the userfaultfd system c=
alls. Set this to<br>
&gt;=C2=A0 =C2=A0 =C2=A01 to allow<br>
&gt;=C2=A0 =C2=A0 =C2=A0unprivileged users to use the userfaultfd system ca=
lls, or set this<br>
&gt;=C2=A0 =C2=A0 =C2=A0to 0 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0restrict userfaultfd to only privileged users (with=
 SYS_CAP_PTRACE<br>
&gt;=C2=A0 =C2=A0 =C2=A0capability). The<br>
&gt;=C2=A0 =C2=A0 =C2=A0default value is 1. Add hint about it.<br>
&gt; <br>
&gt; <br>
&gt; Can we do the &quot;vm.unprivileged_userfaultfd&quot; check in the set=
up() and do <br>
&gt; set to 1 if it exists?<br>
I remembered Jan Stancek has a patch about bpf hint about <br>
unprivileged_bpf_disabled, I do as same as that patch did.<br></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
I just echo the nob file=C2=A0<span class=3D"gmail_default">&quot;</span>un=
privileged_bpf_disabled&quot; and find it can&#39;t be changed at runtime. =
So if the=C2=A0&quot;vm.unprivileged_userfaultfd&quot; is like this behavio=
r too, probably=C2=A0we can=C2=A0only do TCONF as your original patch. Anyw=
ayI will take a close look at the kernel commit later.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div># cat /proc/sys/kernel/<s=
pan class=3D"gmail_default" style=3D"font-size:small"></span>unprivileged_b=
pf_disabled<br>1<br></div><div># echo 0 &gt; /proc/sys/kernel/unprivileged_=
bpf_disabled<br>-bash: echo: write error: Invalid argument<br><div class=3D=
"gmail_default" style=3D"font-size:small"></div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also, month agos about acct02 discussion, Cyril points about adjusting<br>
the threshold value of resume and suppend to make case passes.<br>
<br>
So, I have a question that we have unified standards about these cases<br>
(bpf, acct02, affected by sysctl)? Report TCONF or modify argument to<br>
make case passes?<br>
<br>
@Cyril and @Jan Stancek What do you think about it?<br>
<br>
&gt; And maybe=C2=A0we need more tests for the global sysctl knob <br>
&gt; &quot;vm.unprivileged_userfaultfd&quot;.Eeven though we don&#39;t have=
 case to test unprivileged_bpf_disabled. I <br>
still think testing unprivileged_userfaultfd is meaningful and we can <br>
begin with it.<br>
<br>
Best Regards<br>
Yang Xu<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang=
2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujit=
su.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.../syscalls/userfaultfd/userfaultfd01.c=C2=
=A0 =C2=A0 =C2=A0 | 19 +++++++++++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 13 insertions(+), 6 deletion=
s(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/testcases/kernel/syscalls/userfaultfd/=
userfaultfd01.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/testcases/kernel/syscalls/userfaultfd/userfaultfd=
01.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index a5e142209..4e178b4f8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/testcases/kernel/syscalls/userfaultfd/userfau=
ltfd01.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/testcases/kernel/syscalls/userfaultfd/userfau=
ltfd01.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -82,12 +82,19 @@ static void run(void)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_pages();<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0uffd =3D sys_userfaultf=
d(O_CLOEXEC | O_NONBLOCK);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (uffd =3D=3D -1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0tst_brk(TBROK | TERRNO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could not create userfault file des=
criptor&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(sys_userfaultfd(O_=
CLOEXEC | O_NONBLOCK));<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (TST_ERR =3D=3D EPERM) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quot;Hint: check<br>
&gt;=C2=A0 =C2=A0 =C2=A0/proc/sys/vm/unprivileged_userfaultfd&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF | TTERRNO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;userfau=
ltfd() requires<br>
&gt;=C2=A0 =C2=A0 =C2=A0CAP_SYS_PTRACE on this system&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0} else<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TTERRNO,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could n=
ot create userfault file<br>
&gt;=C2=A0 =C2=A0 =C2=A0descriptor&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0uffd =3D TST_RET;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uffdio_api.api =3D UFF=
D_API;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uffdio_api.features =
=3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_IOCTL(uffd, UFFDI=
O_API, &amp;uffdio_api);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.18.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Mailing list info: <a href=3D"https://lists.linux.i=
t/listinfo/ltp" rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it=
/listinfo/ltp</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; Li Wang<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000012567e059b75561d--


--===============0285159546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0285159546==--

