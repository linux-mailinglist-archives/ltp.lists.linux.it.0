Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEAE565C7
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 11:41:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86A8F3C12AE
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 11:41:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7E7263C0E94
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 11:41:02 +0200 (CEST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9FCE61A00F6F
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 11:41:00 +0200 (CEST)
Received: by mail-ua1-f42.google.com with SMTP id z13so526147uaa.4
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 02:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H3exzN/SQVOsm119wOBKLlYZ4XmcyWofMmM0nGAo0Xc=;
 b=fafFwsZW6eRw+QDWmXVvd/8F672WA+1WCp/FOQnvg5yBrtPR1nrfaSF91prJpTlLp8
 KoA1eVNZtLKiNoKhQoWYmwUwePW7rkG99DJirN04jYdlNX9JEEi1aMH13UxXKXwkZjSx
 +Qr2QYORFNR2k6mT1tzNl2/dhVRPaoXbgUtbaElr35W7YJ6BPAAkvirlf8Qr7vAGFHlK
 MeccGOQOj5gY/zIJ9Hg1dn33LDfylahZuuoC+f1ws0qJRtAM9/jKdblLHO8gkrP+NyX/
 +IUAuKJrLtY7zuh4KbBfwifAfrFb8qiEKB3BJVlbhv1ZCIkKkpAHmIbUe2QxFmzIN4y8
 t+Vw==
X-Gm-Message-State: APjAAAUZ8TEZ/RYiQ0wDxaGa6dNdd4fDdjqnaKBaR+TLTvHmDfBtigEu
 JasiLGvBfoCk/M7r4dRAWRjmlctFkGWuFKd79qTuhg==
X-Google-Smtp-Source: APXvYqwUydN6u0DkHP8tJ3UwmWqFnq4PPMQhd8jaNopt7bPLObG7/NgenqeMUn1lNBwzpFR343GfyVRKY4J1pVp+rvs=
X-Received: by 2002:a9f:2e0e:: with SMTP id t14mr1861178uaj.119.1561542059383; 
 Wed, 26 Jun 2019 02:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071538.29486-1-liwang@redhat.com>
 <20190626071538.29486-2-liwang@redhat.com>
 <285629943.30156546.1561537194409.JavaMail.zimbra@redhat.com>
In-Reply-To: <285629943.30156546.1561537194409.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 26 Jun 2019 17:40:48 +0800
Message-ID: <CAEemH2d_7fq2RxEwZEMSUgErM7XG26RTsV1ogLTiLvALc810Gw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] pkey: add test for memory protection keys
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
Content-Type: multipart/mixed; boundary="===============0076852027=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0076852027==
Content-Type: multipart/alternative; boundary="000000000000c07b2a058c36d746"

--000000000000c07b2a058c36d746
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 26, 2019 at 4:20 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > +
> > +static void setup(void)
> > +{
> > +     int i, fd;
> > +
> > +     if (access(PATH_VM_NRHPS, F_OK)) {
> > +             tst_res(TINFO, "Huge page is not supported");
> > +             size = getpagesize();
> > +             no_hugepage = 1;
> > +     } else {
> > +             int val;
> > +
> > +             SAFE_FILE_PRINTF(PATH_VM_NRHPS, "%d", 1);
>
> This is still SAFE write, which may trigger TBROK:
>
> # ./pkey01
> tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
> safe_file_ops.c:301: BROK: Failed to close FILE
> '/proc/sys/vm/nr_hugepages' at pkey01.c:67: EOPNOTSUPP
> safe_macros.c:773: WARN: pkey01.c:91: umount(tmp_pkey) failed: ENOENT
> safe_macros.c:184: WARN: pkey01.c:92: rmdir(tmp_pkey) failed: ENOENT
>

Er, sorry about still not working here.

If a system(e.g PowerKVM guest) configured with NO huge page support, then
the file '/proc/sys/vm/nr_hugepages' exist but EOPNOTSUPP to read/write. In
this key01, perhaps I shouldn't use the "/proc/.../nr_hugepages" to detect
that at the beginning.

Seems the correct way is to use "/sys/kernel/mm/hugepages/" for huge page
detecting and leave the SAFE_FILE_* still in setup(). Because we need to
catch the "/proc/.../nr_hugepages" open/close or read/write issue in
testing.

What do you think? Should we mask the EOPNOTSUPP as a TCONF skipping or
others?

-- 
Regards,
Li Wang

--000000000000c07b2a058c36d746
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 26, 2019 at 4:20 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
----- Original Message -----<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i, fd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (access(PATH_VM_NRHPS, F_OK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
Huge page is not supported&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D getpagesize(=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_hugepage =3D 1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(PATH=
_VM_NRHPS, &quot;%d&quot;, 1);<br>
<br>
This is still SAFE write, which may trigger TBROK:<br>
<br>
# ./pkey01 <br>
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s<br>
safe_file_ops.c:301: BROK: Failed to close <span class=3D"gmail_default" st=
yle=3D"font-size:small"></span>FILE &#39;/proc/sys/vm/nr_hugepages&#39; at =
pkey01.c:67: EOPNOTSUPP<br>
safe_macros.c:773: WARN: pkey01.c:91: umount(tmp_pkey) failed: ENOENT<br>
safe_macros.c:184: WARN: pkey01.c:92: rmdir(tmp_pkey) failed: ENOENT<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Er, sorry about still not working here.</div></div><div><br><div =
class=3D"gmail_default">If a system(e.g PowerKVM guest) configured with NO =
huge page support, then the=C2=A0<span class=3D"gmail_default"></span>file =
&#39;/proc/sys/vm/nr_hugepages&#39; exist but EOPNOTSUPP to read/write. In =
this key01, perhaps I shouldn&#39;t use the=C2=A0&quot;/proc/.../nr_hugepag=
es&quot; to detect that at the beginning.=C2=A0</div><div class=3D"gmail_de=
fault"><br></div><div class=3D"gmail_default">Seems the correct way is to u=
se=C2=A0&quot;/sys/kernel/mm/hugepages/&quot; for huge page detecting and l=
eave the SAFE_FILE_* still in setup(). Because we need to catch the &quot;/=
proc/.../nr_hugepages&quot; open/close or read/write issue in testing.</div=
><div class=3D"gmail_default"><br></div><div class=3D"gmail_default">What d=
o you think? Should we mask the EOPNOTSUPP as a TCONF skipping or others?</=
div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"m_-40297812=
09951391135gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000c07b2a058c36d746--

--===============0076852027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0076852027==--
