Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E227E50354
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 09:27:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1CBC3C181F
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 09:27:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 275E13C0309
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 09:27:49 +0200 (CEST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 17A501400B7D
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 09:27:48 +0200 (CEST)
Received: by mail-ua1-f44.google.com with SMTP id s4so5296727uad.7
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 00:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rsjBjhQ1U1LvcNZEXuS+PYMZvGFydqPFNnrVA/NfXlc=;
 b=IlO7kPNiktv7xCLGAXRFYazhEs0kx3Y5zyt6sZEsu6NjA66/iWPXU9/sb2bLjBHTSu
 2Ucaj+3ugREx+n3yhjaF2uGn3dZ80W+tuXAiMIHHnzVo/r3QZnxXHHOyqvL+qR2msq6q
 /ldU2mB/DL3UNZZrgTp288OxNsi8OQgKsC2Y+DFxkmh+Fg5ZIFKLaGomjc+EjDkq95vp
 k7BYYxuHvVaetsqI4heJDiTSxSl+mKBO25y/548C7FXfsOgmKdQZy60OPAinTBmpfL7c
 sbCg7LgVX3T8GwjQCvWPQo+CAsBervEV/LxiyHSOgVkNcVYYmIjvVcGOiJcGYj+nLNZh
 Kyvg==
X-Gm-Message-State: APjAAAWHpUHmD5FYLCYNrImgrMu+pGci55+A+mEJvMVRtOkn03LUcu3f
 Dl9r+CMiEjgpXpl+c1LeYyXFWHG95GiHz7WYW/Mv+w==
X-Google-Smtp-Source: APXvYqxKYrw+dEO4mt9TxYa2//C1zv0AE319zCmutFPf6KWNmfVPviWy4Y5DBY/7AZTnws6IibPsJ4jVfryvSfur2vo=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr657037ual.89.1561361267015;
 Mon, 24 Jun 2019 00:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190621102628.4800-4-liwang@redhat.com>
 <1186374967.29667455.1561359397802.JavaMail.zimbra@redhat.com>
In-Reply-To: <1186374967.29667455.1561359397802.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 24 Jun 2019 15:27:36 +0800
Message-ID: <CAEemH2chU7KYJida_09RVWDMQRQLyv9igr5-j464SsKQj3svDA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2 3/3] pkey: add pkey02 test
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1946087183=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1946087183==
Content-Type: multipart/alternative; boundary="000000000000afe6a3058c0cbf86"

--000000000000afe6a3058c0cbf86
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 2:56 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > +
> > +static void pkey_tests(int pkey, int prot, int flags, int fd)
> > +{
> > +     char *buffer;
> > +
> > +     if (fd == 0) {
> > +             fd = SAFE_OPEN(TEST_FILE, O_RDWR | O_CREAT, 0664);
> > +     }
> > +
> > +     buffer = SAFE_MMAP(NULL, psize, prot, flags, fd, 0);
> > +
> > +     if (pkey_mprotect(buffer, psize, prot, pkey) == -1)
> > +             tst_brk(TBROK, "pkey_mprotect failed");
> > +
> > +     tst_res(TPASS, "apply pkey to the buffer area success");
> > +
> > +     if (fd > 0) {
> > +             SAFE_CLOSE(fd);
> > +     }
> > +
> > +     SAFE_MUNMAP(buffer, psize);
> > +}
> > +
>
> Hi,
>
> pkey02 doesn't try to read/write as pkey01, but otherwise two tests look
> very similar.
>
> Could we try to read/write here as well for all combinations of map flags?
> Then pkey01 could be dropped since pkey02 would cover more than just 1
> combination.
> Or is there a different reason behind separate tests, that I'm missing?
>
>
The pkey02 is a follow new test idea(test more types of memory) after I
completed pkey01.

Yes, the diffenrence bettwen them is pkey02 cover more map flags but not do
R/W verification. That's because I'm hoping to add {0, 0x0} to the test
which does not trigger SIGSEGV in pkey02, it seems a bit tricky to
distinguish the SIGSEGV is come from 0x0(if bug there)
or PKEY_DISABLE_ACCESS progress.

-- 
Regards,
Li Wang

--000000000000afe6a3058c0cbf86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 24, 2019 at 2:56 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +static void pkey_tests(int pkey, int prot, int flags, int fd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *buffer;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(TEST=
_FILE, O_RDWR | O_CREAT, 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buffer =3D SAFE_MMAP(NULL, psize, prot, flags, fd=
, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pkey_mprotect(buffer, psize, prot, pkey) =3D=
=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
pkey_mprotect failed&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;apply pkey to the buffer are=
a success&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_MUNMAP(buffer, psize);<br>
&gt; +}<br>
&gt; +<br>
<br>
Hi,<br>
<br>
pkey02 doesn&#39;t try to read/write as pkey01, but otherwise two tests loo=
k<br>
very similar.<br>
<br>
Could we try to read/write here as well for all combinations of map flags?<=
br>
Then pkey01 could be dropped since pkey02 would cover more than just 1 comb=
ination.<br>
Or is there a different reason behind separate tests, that I&#39;m missing?=
<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">The pkey02 is a follow new test idea(test more types of memory)=
 after I completed pkey01.=C2=A0</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Yes, the diffenrence bettwen them is pkey02 cover more map flags bu=
t not do R/W verification. That&#39;s because I&#39;m hoping to add {0, 0x0=
} to the test which does not trigger=C2=A0SIGSEGV in pkey02, it seems a bit=
 tricky to distinguish the SIGSEGV is come from 0x0(if bug there) or=C2=A0P=
KEY_DISABLE_ACCESS progress.</div></div><div><br></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--000000000000afe6a3058c0cbf86--

--===============1946087183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1946087183==--
