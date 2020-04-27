Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AD1B9AC8
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 10:49:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 340223C2865
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 10:49:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 232AD3C285B
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 10:49:42 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 337E01400DA3
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 10:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587977380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6VhneFH5Os5kYLEYqm4neaV1N5jv8UBLxv36kjTl3H4=;
 b=Vt4HYylAcT4tNt5u/K8j0ZmoyfHX4BDYxqWPw7Hkov+DkGz5jyeqK8GYGgd0cB2hw97ZKO
 h34lDEpHu8gOrkjxdyFjylD3Dl6pDunLejxXpyfOqKLg+CzMnF61uCPOeea1GVDXgaiBBs
 nGvXM48eJr9fhgbRL3DuFgXYb8BF0q8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-FU9r_dTTOI6Mw89cyjIdZw-1; Mon, 27 Apr 2020 04:49:35 -0400
X-MC-Unique: FU9r_dTTOI6Mw89cyjIdZw-1
Received: by mail-lf1-f69.google.com with SMTP id 66so7217588lfa.7
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 01:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+oVcCNwhiE9yDWOuDoqxQ0z4qZQnI7bJjeNLdgtvVCw=;
 b=lsiAd9PrJsGzsDZjMDMeiaDfsGaub49PfJjt3iwHh4s0Z3iZ+XMeD1BO9EpRYeB1Ie
 Gn26B3O6tNU7TNIBQxVGbD5AB2sScNoKh98+a6kat9lUrnNOnSYzEpZQVlq1AVyFKRcB
 6uN1J4rnTJVe1xUtXwIcSZ0XlIuGBuqRb9cgk3qXRSYcwtXPlGneyPAaUqnAbwvjd8gX
 QkhPm/ObUC6NoKlfBzloOBEK3hPZOxkVFwZfhNkquSFlbVSOpeA/5vTRPzCkTPMfrW2A
 hStvd/G0Y4nxufJ2hqLwDh5PLYmBY8Yo7AZ6KWHCXseUEEIH/rDZMS2MuOBpCOLeEICc
 4IVw==
X-Gm-Message-State: AGi0Pub2D/2WArd4SqNefuAL7KcGkpz/jGaRXEsYQiMnZJHyRF/qnnBe
 YQlXIRlHpb2N3K+TK1b1m8rgnVdTEgVeLBAN3HIE7yR1NJzq+NCr1CgRGdGHMbELTBbyYkazcjw
 gTKZarP8OpEINAFANPdvYNwuv/ME=
X-Received: by 2002:ac2:489b:: with SMTP id x27mr15027678lfc.60.1587977374312; 
 Mon, 27 Apr 2020 01:49:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypLehxRjsMDEKttE6uOlDuwbecUG6S7HGburTeNluUeIJj7RBwBTQtIPgSops9goJZkdY7nVgYXeT5ICLyWnjpg=
X-Received: by 2002:ac2:489b:: with SMTP id x27mr15027666lfc.60.1587977374107; 
 Mon, 27 Apr 2020 01:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200424150422.17467-1-mdoucha@suse.cz>
 <20200427053125.GA21164@dell5510>
 <951270734.10286613.1587972682386.JavaMail.zimbra@redhat.com>
In-Reply-To: <951270734.10286613.1587972682386.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 27 Apr 2020 16:49:22 +0800
Message-ID: <CAEemH2daE69UT7mFGXOFQaj3bjqq8CRJr6bnhssyK3_7JPdHng@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add env variable as workaround for test issues in
 VMs
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
Content-Type: multipart/mixed; boundary="===============1499528314=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1499528314==
Content-Type: multipart/alternative; boundary="0000000000004ba0f005a441cb5b"

--0000000000004ba0f005a441cb5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 3:31 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Hi Martin,
> >
> > > Timer tests often fail on sleep overrun when LTP is running inside a
> VM.
> > > The main cause is usually that the VM doesn't get enough CPU time to
> wake
> > > up
> > > the test process in time.
> > Cannot we detect presence of "hypervisor" in flags in /proc/cpuinfo?
> > I though it was quite reliable for detecting VM.
>
> We have tst_is_virt().
>

I take a rough look and doubt there is a bug in try_systemd_detect_virt().
Shouldn't strncmp() return zero the 'kvm'/'xen' is found?  I guess they
wanted:

--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -93,10 +93,10 @@ static int try_systemd_detect_virt(void)
        if (ret)
                return 0;

-       if (strncmp("kvm", virt_type, 3))
+       if (!strncmp("kvm", virt_type, 3))
                return VIRT_KVM;

-       if (strncmp("xen", virt_type, 3))
+       if (!strncmp("xen", virt_type, 3))
                return VIRT_XEN;

        return 0;

Apart from that two(kvm/xen) , we need to detect more virtualization tech
for ppc/s390 I think.

# uname -r
4.18.0-193.el8.s390x

# systemd-detect-virt
zvm

--=20
Regards,
Li Wang

--0000000000004ba0f005a441cb5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 27, 2020 at 3:31 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Hi Martin,<br>
&gt; <br>
&gt; &gt; Timer tests often fail on sleep overrun when LTP is running insid=
e a VM.<br>
&gt; &gt; The main cause is usually that the VM doesn&#39;t get enough CPU =
time to wake<br>
&gt; &gt; up<br>
&gt; &gt; the test process in time.<br>
&gt; Cannot we detect presence of &quot;hypervisor&quot; in flags in /proc/=
cpuinfo?<br>
&gt; I though it was quite reliable for detecting VM.<br>
<br>
We have tst_is_virt().<br></blockquote><div><br></div><div class=3D"gmail_d=
efault" style=3D"font-size:small">I take a rough look and doubt there is a =
bug in try_systemd_detect_virt().</div><div class=3D"gmail_default" style=
=3D"font-size:small">Shouldn&#39;t strncmp() return zero the &#39;kvm&#39;/=
&#39;xen&#39; is found?=C2=A0 I guess they wanted:</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div>--- a/lib/tst_virt.c<br>+++ b=
/lib/tst_virt.c<br>@@ -93,10 +93,10 @@ static int try_systemd_detect_virt(v=
oid)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 =
if (strncmp(&quot;kvm&quot;, virt_type, 3))<br>+ =C2=A0 =C2=A0 =C2=A0 if (!=
strncmp(&quot;kvm&quot;, virt_type, 3))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return VIRT_KVM;<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=
=A0 if (strncmp(&quot;xen&quot;, virt_type, 3))<br>+ =C2=A0 =C2=A0 =C2=A0 i=
f (!strncmp(&quot;xen&quot;, virt_type, 3))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VIRT_XEN;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br><div class=3D"gmail_default" style=3D"font-size:sma=
ll"></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Apart from tha=
t two(kvm/xen) , we need to detect more virtualization tech for ppc/s390 I =
think.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small"># uname -r<br>4.18=
.0-193.el8.s390x<br><br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small"># systemd-detect-virt <br>zvm<br></div><div><br></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></=
div><div>Li Wang<br></div></div></div></div>

--0000000000004ba0f005a441cb5b--


--===============1499528314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1499528314==--

