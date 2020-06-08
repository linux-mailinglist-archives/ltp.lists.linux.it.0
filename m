Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD61F1695
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:18:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4A9E3C2E80
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:18:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E1DE33C2029
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:18:48 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6A395201012
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591611526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xb0NXK/hEBNIzesXGRMu/AJn5Fu2avSaGDL+Em/GfwU=;
 b=Eju1ZhQMaarKpJxVcHPv3XYYXPsFw4SmYTiqVR7/U8+acjvAY1JuWW5aizXQCjCsc6mFEj
 QHD5Olxko4w9dEQQEoc/kK4pVduNR6rB8s1IrFCWNJkRfumz4t/sdczTk8lYoxDzfoNpPG
 f3PJuxaRRj6+BJ3TAy1NmtCbEvkj2Tw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-VOnDDG65Nfi0vHBaqJfI3w-1; Mon, 08 Jun 2020 06:18:44 -0400
X-MC-Unique: VOnDDG65Nfi0vHBaqJfI3w-1
Received: by mail-lj1-f199.google.com with SMTP id u3so1758975ljo.0
 for <ltp@lists.linux.it>; Mon, 08 Jun 2020 03:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xb0NXK/hEBNIzesXGRMu/AJn5Fu2avSaGDL+Em/GfwU=;
 b=d513asx0BkJiMs+VnkmY5Kr4I1MtJondjgNGVervKTJlvKGmCkYEfIMIthi/QWESbP
 RK52Ey6ktYHgA+7oJImMhNY9yuytqiLoy4ROgyYfqyUfLobn+5biFJ0xndeESM5WX0jV
 +2QA5jf+Vdx/NMefXwH09nSgqdjONbmFx2p/sdoSPE1fVxtVOoIQboJxzmxxRVx49ZDe
 loeOsKeEYg7cS2uD+rre+yqLgBlc5wvLiReYB9n5x6OGBm8z+RrzA18olNGecw7WtJdw
 7RezO5BQdAGgcHRhLzZwpOueugg0kHF4yp1rEe3KiZZqY79nDnoOsEsAx2iS1VJ9ImHP
 HGEg==
X-Gm-Message-State: AOAM530ZvYbielYJc3GIx2Tfvnl1fdTrjrSlrDIpa0JqbIeHDN+8aVtm
 8WM7HmP7x03ZBqtLPdUgf10DsLTB6imeWnDXlGwUzViI3/Tw7dEFsjH6h4ovhf1BYMcy7DBSU/1
 ej61NtOfZNe7UIqnwxBaRGwYOR2s=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr10997458ljd.468.1591611523299; 
 Mon, 08 Jun 2020 03:18:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCubSYefjO9mcDHMriIfxz+BLetayOTjlMSWBKpKdBsoJWOq0bANzcKPV3o9Fh2g+waAgVR9bIomm07GKP4vM=
X-Received: by 2002:a2e:5757:: with SMTP id r23mr10997453ljd.468.1591611523071; 
 Mon, 08 Jun 2020 03:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200601100459.32511-1-liwang@redhat.com>
 <CAEemH2ffNHY6Ej-Er5a4Ng_9zw+RX+wEBc0widntmYqDLNRqxw@mail.gmail.com>
 <20200602121232.GA22599@janakin.usersys.redhat.com>
 <CAEemH2d7OzG6jBZ15bYGRHm7ry-gVjzuwJYhbHp3yitB3_928w@mail.gmail.com>
 <20200603104314.GA12583@janakin.usersys.redhat.com>
 <CAEemH2ey08M+-ddqh1DNWSOWSi7RNYz8ho=MSPQryYHSqamffg@mail.gmail.com>
 <20200605101443.GA6826@janakin.usersys.redhat.com>
 <CAEemH2cCLY1htBYPm9tuefyzdg6EqmFRrcMin76kf_LcMA2f3A@mail.gmail.com>
 <595558785.15122565.1591609722778.JavaMail.zimbra@redhat.com>
In-Reply-To: <595558785.15122565.1591609722778.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 8 Jun 2020 18:18:31 +0800
Message-ID: <CAEemH2cDdCowDZEYVuqV4aTFgBK69CO10hhFRM2X-XHEazK1Tg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============0628465720=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0628465720==
Content-Type: multipart/alternative; boundary="00000000000074178805a78fefe2"

--00000000000074178805a78fefe2
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 8, 2020 at 5:48 PM Jan Stancek <jstancek@redhat.com> wrote:

> ...
>
> But there would be clear connection between function and variable.
>   new_path = tst_cgroup_get_path(cgroup_dir);
>

Yes, that's easier to understand the code workflow.

> vs.
>   tst_cgroup_get_path(cgroup_dir);
>   // fyi, tst_cgroup_new_path is updated as side-effect of call above
>   // What other calls do update tst_cgroup_new_path? Have a look at
> implementation.

...
>
> That makes it somewhat better, since it's only concern of library code now.
> But since there are no tests using "tst_cgroup_new_path", does it still
> need to be global variable?
>

Sure, we could delete tst_cgorup_mnt/new_path variables, since we have
tracking all mount paths in the list, so it will be easy to find new_path
in each
function.

Hope v4 is the final version:).

-- 
Regards,
Li Wang

--00000000000074178805a78fefe2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 8, 2020 at 5:48 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_=
default" style=3D"font-size:small">...</span><br>
<br>
But there would be clear connection between function and variable.<br>
=C2=A0 new_path =3D tst_cgroup_get_path(cgroup_dir);<br></blockquote><div><=
br></div><div class=3D"gmail_default" style=3D"font-size:small"><span class=
=3D"gmail_default"></span>Yes, that&#39;s easier to understand the code wor=
kflow.=C2=A0<span class=3D"gmail_default"></span></div><div class=3D"gmail_=
default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
vs.<br>
=C2=A0 tst_cgroup_get_path(cgroup_dir);<br>
=C2=A0 // fyi, tst_cgroup_new_path is updated as side-effect of call above<=
br>
=C2=A0 // What other calls do update tst_cgroup_new_path? Have a look at im=
plementation.=C2=A0</blockquote></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
That makes it somewhat better, since it&#39;s only concern of library code =
now.<br>
But since there are no tests using &quot;tst_cgroup_new_path&quot;, does it=
 still<br>
need to be global variable?<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Sure, we could delete tst_cgorup_mnt=
/new_path variables, since we have</div><div class=3D"gmail_default" style=
=3D"font-size:small">tracking all mount paths in the list, so it will be ea=
sy to find new_path in each</div><div class=3D"gmail_default" style=3D"font=
-size:small">function.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Ho=
pe v4 is the final version:).</div></div><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div=
>Li Wang<br></div></div></div></div>

--00000000000074178805a78fefe2--


--===============0628465720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0628465720==--

