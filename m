Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E52931BDD76
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:23:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D4D33C5ED7
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:23:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C20DA3C283C
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:23:33 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 376271A01460
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588166611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/F+b8E97DYFYntDpb/j6q+kFeah2vMehawpSGIwjSc=;
 b=bUhgvVSIsZtd4kTfJq5GOQEFqnxB/7Jp+ui1Rz9cpZaCkXCC0Fge+gmSveICgSA3WThcF7
 GBs1DbvnxjgjZ5ovbRHxWEo38cLEEWKxHE8LhxJCdfphZ3lkOKIHmxMWLtiz0QGBLiV08y
 Uue0NjREo8GFUFRaqVTfgKiKvGtwRI8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-afh5LjERN3al9odgcjlo2A-1; Wed, 29 Apr 2020 09:23:26 -0400
X-MC-Unique: afh5LjERN3al9odgcjlo2A-1
Received: by mail-lf1-f72.google.com with SMTP id b5so745237lfg.5
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 06:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCELZ1qf6U3st9DJ23fQRwjQzoOQ51Rna6dz4CJ6ZFw=;
 b=WMyEwY0VDaQpxfLW/o60EJrE62Dx8dyvGvBtD9gtPOjEMNcyt8UinC12tjno9KDgSc
 isrwTNXivzXuHmTeCqJNjM1g9hYQ86mq0fu8GJqtUFr7LeSILBcHPP7cp1vQqyBzisvu
 hcF6RrQlztwQt3nX1k1x00aUC/ZM9zEGOgLkK7An2ilXoYpgfs6HzWXUgQqGkvbdo7P5
 08bQP71lBAKh3a50D3B0NtRpu61veNAOLGmeQPQXYgkp22p49f0FG96gFD/wTPb1q3z7
 2NvQeaOi9HKHSnU1jFvDxwHnINgRkdhBLnPqIUhcL9NF+C4TmoWmYnFL3vOyaia2gCdF
 rKeA==
X-Gm-Message-State: AGi0PuYtqzfG+AG2tUBhoKmOx/dxzc6nYCyjnvXKHntRqQejwz8ik8CI
 qYUESJpW49RxbdWwBDdSzf+J0UEKI0qwHm2zA9Gapw4kuy5BN0NSREBbNr1DjBBlY5NLQg1b0PU
 O0zLsOHMEGG8Ou7YieGWTOn2HtYc=
X-Received: by 2002:a2e:9255:: with SMTP id v21mr21032932ljg.222.1588166605187; 
 Wed, 29 Apr 2020 06:23:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypK1Wkjr0At0oc8p7fzxfu6YAZ88ENe5GFJ0Utg8nWOaXLd5tHOE9sQkCdWCkF45/PibLtUu2Bnr/PT/OvqBNt4=
X-Received: by 2002:a2e:9255:: with SMTP id v21mr21032926ljg.222.1588166604934; 
 Wed, 29 Apr 2020 06:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200428154727.29206-1-mdoucha@suse.cz>
 <20200428154727.29206-2-mdoucha@suse.cz>
 <797241805.10630970.1588143297978.JavaMail.zimbra@redhat.com>
In-Reply-To: <797241805.10630970.1588143297978.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 29 Apr 2020 21:23:12 +0800
Message-ID: <CAEemH2cRhQQL-Z16H37KPOXOuVSV87vAyvKiPYy4ZVK6gA3Rmw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Skip oversleep checks in timer tests under
 VM
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
Content-Type: multipart/mixed; boundary="===============0576115146=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0576115146==
Content-Type: multipart/alternative; boundary="00000000000054ee9105a46ddaa2"

--00000000000054ee9105a46ddaa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 2:55 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Timer tests often fail on sleep overrun when LTP is running inside a VM=
.
> > The main cause is usually that the VM doesn't get enough CPU time to
> wake up
> > the test process in time. Disable oversleep tests if tst_is_virt()
> detects
> > any hypervisor.
>
> > BTW, systemd-detect-virt can't detect the PowerPC LPAR hypervisor.
>
> Same with virt-what. We could (in separate patch) add check for
> 'pseries_platform' (powerpc-utils) output:
>

+1 that makes sense to me.


>
> # pseries_platform
> PowerVM pSeries LPAR
>
> # pseries_platform
> PowerNV Host
>
> # pseries_platform
> Power KVM pSeries Guest
>
> >
> > +     /*
> > +      * Running tests in VM may cause timing issues, disable upper bou=
nd
> > +      * checks if LTP_VM_ENV is set to non-zero.
> > +      */
> > +     virt_env =3D tst_is_virt(VIRT_ANY);
>
> The comment still mentions LTP_VM_ENV. Other than that, I don't have majo=
r
> objections. Maybe somebody would like to run strict checks on VMs too, bu=
t
> that's something we could add later with an env. variable.
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--00000000000054ee9105a46ddaa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Apr 29, 2020 at 2:55 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Timer tests often fail on sleep overrun when LTP is running inside a V=
M.<br>
&gt; The main cause is usually that the VM doesn&#39;t get enough CPU time =
to wake up<br>
&gt; the test process in time. Disable oversleep tests if tst_is_virt() det=
ects<br>
&gt; any hypervisor.<br>
<br>
&gt; BTW, systemd-detect-virt can&#39;t detect the PowerPC LPAR hypervisor.=
<br>
<br>
Same with virt-what. We could (in separate patch) add check for<br>
&#39;pseries_platform&#39; (powerpc-utils) output:<br></blockquote><div><sp=
an class=3D"gmail_default" style=3D"font-size:small"><br></span></div><div>=
<span class=3D"gmail_default" style=3D"font-size:small">+1 that makes sense=
 to me.</span></div><div><span class=3D"gmail_default" style=3D"font-size:s=
mall"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
# pseries_platform<br>
PowerVM pSeries LPAR<br>
<br>
# pseries_platform<br>
PowerNV Host<br>
<br>
# pseries_platform<br>
Power KVM pSeries Guest<br>
<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Running tests in VM may cause timing issues, d=
isable upper bound<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * checks if LTP_VM_ENV is set to non-zero.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0virt_env =3D tst_is_virt(VIRT_ANY);<br>
<br>
The comment still mentions LTP_VM_ENV. Other than that, I don&#39;t have ma=
jor<br>
objections. Maybe somebody would like to run strict checks on VMs too, but<=
br>
that&#39;s something we could add later with an env. variable.<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000054ee9105a46ddaa2--


--===============0576115146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0576115146==--

