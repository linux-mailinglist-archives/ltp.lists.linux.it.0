Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7F18F174
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:11:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F2693C4E45
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:11:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 86EF23C0430
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:11:14 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CEBFE1A010FA
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584954672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KJlO1KB5KeHEpaMO/ijTAQaAyra9ahmeNPrHI2QGtAs=;
 b=cmWIkjgjjSloFHnD+gCWwHanCoT0+iWMYQm+RhpQ/aJ3dQ7SMRErm1jhfW4OWPyrNoLXe8
 5Yf5IX1J01faDHC9WGvjerw+A2dD7KhB1cbvxw4AuqNhMBVC6YCC7fUfV2J7cSrYVt3GOS
 B6a4NBysN9J7rbruJ+qD9cZm09zO7HI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-OV18L05jN7u1lVp0EDKlKg-1; Mon, 23 Mar 2020 05:11:10 -0400
X-MC-Unique: OV18L05jN7u1lVp0EDKlKg-1
Received: by mail-oi1-f199.google.com with SMTP id i126so6575316oif.0
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 02:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5f8aY+9dKP1C9zmmhFSDqBPDi8WGHTZbKLhmJ/nHK8=;
 b=S6cmqBvUei9/NqmHYnZwRwGZydGmfOtzwyR94EV9sHI4ZDNx6ZWQhcki92Dzkfbt0D
 xSQ0tKNIbz9maJFlOo29NoMzN2pwUwype4mgUQXuApobYx4FBCE5Ej4dKffOefwsMJoe
 3iPEZRq8ZnQgWYfDupuV1jhockM537TcxyXv11T8p5k5V0bs6HEBQ4+e38DBuYdWaSNG
 ZPvNqSVHRrhijs0ThNraQQJ9eMmgI7iHRicaMR2/otor/isW17CTLKnWtBUOcrzAbA/P
 Fp+qzG/Mg/lCPBFo0Ems7f7Fcpj51RDd7q9eFUNpB36n12PJ4YyfRRyo2ev4wOt2nSZw
 WyOw==
X-Gm-Message-State: ANhLgQ33LI8ud84neXK84I6RhsCZFo8ODeFInVlenoS3dQ6xvNc1EHUY
 wuC519YMXx6+DbtapIwz0aytTrYeE+ipU6ZSrnNTmKw6xoLZ05SaZFCBH/5EASvtlbLaISyzOeq
 NIh5YIR+VhHpkdG73tZAXqGMKsFs=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr17849963otb.17.1584954668474; 
 Mon, 23 Mar 2020 02:11:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtR19vtDSwSaFauuCGJBi3ep0VrsI46SrYfEepPiYa8qcFAI1aQeyQAaflPfi1UZwVArLNaMNCT1HUL+UShc8I=
X-Received: by 2002:a9d:2c64:: with SMTP id f91mr17849943otb.17.1584954668096; 
 Mon, 23 Mar 2020 02:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
In-Reply-To: <20200320134937.16616-2-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 23 Mar 2020 17:10:56 +0800
Message-ID: <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Content-Type: multipart/mixed; boundary="===============2099025203=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2099025203==
Content-Type: multipart/alternative; boundary="000000000000fa2ce805a1820399"

--000000000000fa2ce805a1820399
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Fri, Mar 20, 2020 at 9:50 PM Petr Vorel <pvorel@suse.cz> wrote:

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/syscalls/add_key/add_key05.c   | 15 ++-------------
>  testcases/kernel/syscalls/quotactl/quotactl01.c | 14 ++------------
>  testcases/kernel/syscalls/quotactl/quotactl06.c | 12 +-----------


Apart from the three, do you consider converting to SAFE_RUNCMD for the
rest testcases?
(it seems not too much work remaining since only a few test case uses
tst_run_cmd)

kernel/syscalls/setpriority/setpriority01.c
kernel/syscalls/copy_file_range/copy_file_range02.c
...


--=20
Regards,
Li Wang

--000000000000fa2ce805a1820399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20, 2020 at 9:50 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-=
off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">=
pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/add_key/add_key05.c=C2=A0 =C2=A0| 15 ++----=
---------<br>
=C2=A0testcases/kernel/syscalls/quotactl/quotactl01.c | 14 ++------------<b=
r>
=C2=A0testcases/kernel/syscalls/quotactl/quotactl06.c | 12 +-----------</bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Apart from the three, do you consider converting to SAFE_RUNCMD fo=
r the rest testcases?</div><div class=3D"gmail_default" style=3D"font-size:=
small">(it seems not too much work remaining since only a few test case use=
s tst_run_cmd)</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><span class=3D"gmail_default" style=3D"font-size:small"></span>ke=
rnel/syscalls/setpriority/setpriority01.c</div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">kernel/syscalls/copy_file_range/copy_file_r=
ange02.c</div><div class=3D"gmail_default" style=3D"font-size:small">...</d=
iv><br><div class=3D"gmail_default" style=3D"font-size:small"></div></div><=
/div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<=
br></div><div>Li Wang<br></div></div></div></div>

--000000000000fa2ce805a1820399--


--===============2099025203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2099025203==--

