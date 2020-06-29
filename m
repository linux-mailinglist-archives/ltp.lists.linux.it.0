Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9754720CD98
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 11:31:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1169D3C2B08
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 11:31:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 626B53C2AD7
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 11:31:34 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id AE4411001561
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 11:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593423092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OSSmYx183iLEMcQnMmXklkZB5Rag8X82AFKvVHu6H8g=;
 b=E0YccCiE/Nvqxe+q2SIF8xFgYZC3/KxqLh+tU+FTpBPgkPKxvsJtc2aiK3srEI3qmLYb12
 hWgyQRhJ3wZWTKD51Zk6LRnD/TJsWyu8UK9bgQwqp9tjH3vo0uGajBd7EjEWCYtdrwSTHr
 0ZLEt7lizXwRXJ5G1WwzhB7r0yMC/EE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-uJ6p6zZIOFWV8IkxcN0Awg-1; Mon, 29 Jun 2020 05:31:29 -0400
X-MC-Unique: uJ6p6zZIOFWV8IkxcN0Awg-1
Received: by mail-lf1-f71.google.com with SMTP id c9so573940lfr.6
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OSSmYx183iLEMcQnMmXklkZB5Rag8X82AFKvVHu6H8g=;
 b=T6wbgjL9onAB6yyIiwxeywNxG4kNchZ4ifC4nDtQGdBNSzC37TxSOki73cik5K9qN9
 lrq88Uuou4XGn91mmBknY8hDyhc5vU6RbLKu4KusPSOvRDWYCK+CV36zSeYNiBRYhGcQ
 sk4fCEDlMXvFSG114mmsh71SCLx9a4XCBz7MAJB9kM8AW1pEDhshb9ldQ/Lxr6/ZWG3b
 vnaqhXJT8KDf6I3JeW1L+QGrVes812yKd1VV2ZNF1vCVk8wzJHi80MrHEKKmL5/n4CmZ
 6l/Y60OuayS0VsOFydxFWWS9WpfYCGS9cRw4BXLhORUf5pr6Kl4F7O6FPtlzbalv9gn8
 un/g==
X-Gm-Message-State: AOAM530ObbL8vVcSyYrkbBcq4st1+0CNRehk7jmQL83/viMU7bXQ6Dvl
 rq4XNyli0Fo7e186hDjBUsDqG1KKYS0BrwU3m2wPkvf4itJtq1XJz5fL6WT5QtZmeNwTXpx1W5i
 wtIf4rwq1Fi5fS/zAuFkbthibXoY=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr8106192ljc.100.1593423087623; 
 Mon, 29 Jun 2020 02:31:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFsc3LJPM8fVFoKlBNepIeIfxQ4eFIMMZ44vm80SgHI5HfT1zCQv2Tf4DA1mxRSnRxKmhyQFbrddBKCCPwdto=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr8106190ljc.100.1593423087395; 
 Mon, 29 Jun 2020 02:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <1593417968-3275-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1593417968-3275-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 29 Jun 2020 17:31:15 +0800
Message-ID: <CAEemH2fUiCRhcYD=fUfR0fdw6ywwyR5R593q0d6oUsX9POTfPQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_cgroup.c: Fix general protection fault
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
Content-Type: multipart/mixed; boundary="===============0646601237=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0646601237==
Content-Type: multipart/alternative; boundary="00000000000019fdbf05a935b94f"

--00000000000019fdbf05a935b94f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 29, 2020 at 4:06 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> When I test ksm04 on 3.10.0-1136.el7.x86_64, it failed as below:
>  ./ksm04
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> tst_device.c:417: INFO: No device is mounted at /tmp/cgroup_mem
> tst_cgroup.c:96: INFO: Cgroup(memory) v1 mount at /tmp/cgroup_mem success
> tst_test.c:1292: BROK: Test killed by SIGSEGV
>
> dmesg as below:
> [10096.547468] traps: ksm04[25785] general protection ip:410673
> sp:7ffc1b1dc870 error:0 in ksm04[400000+22000]
>
> addr2line -e ksm04 -f 410673
> tst_cgroup_set_path
> /root/ltp/lib/tst_cgroup.c:199
>
> It detects uninitialized mem when using a->next, so it was killed.
>
> Also ksm04_1 and oom5 have the same problem.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  lib/tst_cgroup.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index 341ecf599..ba420d5f8 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -190,6 +190,7 @@ static void tst_cgroup_set_path(const char *cgroup_dir)
>         tst_cgroup_path = SAFE_MALLOC(sizeof(struct tst_cgroup_path));
>         tst_cgroup_path->mnt_path = SAFE_MALLOC(strlen(cgroup_dir) + 1);
>         tst_cgroup_path->new_path = SAFE_MALLOC(strlen(cgroup_new_dir) +
> 1);
> +       tst_cgroup_path->next = NULL;
>

I remember I have fixed this in my local branch(probably v4), but it gets
lost in patch merging.
Anyway, thanks for fixing, pushed.

-- 
Regards,
Li Wang

--00000000000019fdbf05a935b94f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 29, 2020 at 4:06 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When I=
 test ksm04 on 3.10.0-1136.el7.x86_64, it failed as below:<br>
=C2=A0./ksm04<br>
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s<br>
tst_device.c:417: INFO: No device is mounted at /tmp/cgroup_mem<br>
tst_cgroup.c:96: INFO: Cgroup(memory) v1 mount at /tmp/cgroup_mem success<b=
r>
tst_test.c:1292: BROK: Test killed by SIGSEGV<br>
<br>
dmesg as below:<br>
[10096.547468] traps: ksm04[25785] general protection ip:410673 sp:7ffc1b1d=
c870 error:0 in ksm04[400000+22000]<br>
<br>
addr2line -e ksm04 -f 410673<br>
tst_cgroup_set_path<br>
/root/ltp/lib/tst_cgroup.c:199<br>
<br>
It detects uninitialized mem when using a-&gt;next, so it was killed.<br>
<br>
Also ksm04_1 and oom5 have the same problem.<br>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0lib/tst_cgroup.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
index 341ecf599..ba420d5f8 100644<br>
--- a/lib/tst_cgroup.c<br>
+++ b/lib/tst_cgroup.c<br>
@@ -190,6 +190,7 @@ static void tst_cgroup_set_path(const char *cgroup_dir)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_path =3D SAFE_MALLOC(sizeof(struct t=
st_cgroup_path));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_path-&gt;mnt_path =3D SAFE_MALLOC(st=
rlen(cgroup_dir) + 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_cgroup_path-&gt;new_path =3D SAFE_MALLOC(st=
rlen(cgroup_new_dir) + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_cgroup_path-&gt;next =3D NULL;<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I remember=C2=A0I have fixed this in my local branch(probably v4), but =
it gets lost in patch merging.</div></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Anyway, thanks for fixing, pushed.</div><div>=C2=A0</=
div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000019fdbf05a935b94f--


--===============0646601237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0646601237==--

