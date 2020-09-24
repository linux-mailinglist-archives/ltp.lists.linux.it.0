Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F41992767FD
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 06:52:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DE0A3C4D2E
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 06:52:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 21C3E3C2885
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 06:51:58 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 91A5E6011B6
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 06:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600923116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A+D6xXrPRLnMflz74cHaoM4cNmtssUgBIYdZf1Vjv68=;
 b=JrfSGP+oDmf5hn8rD0/+CcaimIuU4qsAVchnME2ydEda/1FD/TvP33EgXhpFO2HF5KMVGg
 iVNQhyPuNMYc54KcMz/pJ9aSaVtufQ3S8oMjpWE50WeeqxJNTLl5I6VWoxsRFDEfobBlfG
 23r97zz2EOl5m6s/3+rjIrs4RfEJTGc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-ErCsT0oiNoiOxO0snC5BLw-1; Thu, 24 Sep 2020 00:51:52 -0400
X-MC-Unique: ErCsT0oiNoiOxO0snC5BLw-1
Received: by mail-yb1-f199.google.com with SMTP id u35so1776217ybd.13
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 21:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A+D6xXrPRLnMflz74cHaoM4cNmtssUgBIYdZf1Vjv68=;
 b=pVIUSHTbFlIPWepic1fXhsppocVHAxLMG3aPeVVzVsTDsaNMf48dIqu3SL1UPv0Ha7
 OifjyP9CFohmqp30Cxj6ue2z5WMZGyKuN6w46DGYrg0Rd2FTOKeu8LgCptUWB1OPJyI/
 RybrVdH59ZCoglWBSfgo9fiJlSLkLmX6GlAmpUGg9uqlojXSIZUyIKVhy8NbRO9Sij91
 ykcdVXI12bmQ5RTnzLGp3BOsRt6asqgeYCoW+yP1KHKKkbpci6jJRl298Lh8+2ycyN0a
 seBIqp2cpgSiJgiJZNGysSY3/CC3EUPZOHO/WanHNF+yDkOx483VHjDHnZLhyU/Y+RYT
 VlqA==
X-Gm-Message-State: AOAM532E/G9xJqduK7KZPyn9bQkwu9AWbolArfkksFaKVQbdzYrQleym
 ZELpN2rf5SZTNhNhlfUmlk33PtNjPp2QYVYhqnfTu+O1La+oCrOu67/VzLSow93K279+jRvRhNt
 12xfjJZ2v3CKZSxVjwcPNon5LPiE=
X-Received: by 2002:a25:730a:: with SMTP id o10mr4726916ybc.403.1600923111804; 
 Wed, 23 Sep 2020 21:51:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkmZMfUpjvSWCKVYfo9oQux8WThv6FX0saU0o36iqs8kQEsw0vg7/09c9TaYfHA9mQ2esaSsB+1/CBUKRQBCQ=
X-Received: by 2002:a25:730a:: with SMTP id o10mr4726902ybc.403.1600923111577; 
 Wed, 23 Sep 2020 21:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200923152902.8738-1-pvorel@suse.cz>
In-Reply-To: <20200923152902.8738-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 24 Sep 2020 12:51:39 +0800
Message-ID: <CAEemH2fej8MobmUmGQz5ZqfFrd0imB3Bwt4quvQqc3jypahCYA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] sendto: Add PACKET_VNET_HDR to lapi and
 use it
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
Content-Type: multipart/mixed; boundary="===============0404066909=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0404066909==
Content-Type: multipart/alternative; boundary="00000000000060f46005b007f535"

--00000000000060f46005b007f535
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 11:29 PM Petr Vorel <pvorel@suse.cz> wrote:

> to fix build on CentOS 6
>
> Fixme: b59c66210 ("Add test for CVE 2020-14386")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>


Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000060f46005b007f535
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 11:29 PM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">to fix build=
 on CentOS 6<br>
<br>
Fixme: b59c66210 (&quot;Add test for CVE 2020-14386&quot;)<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;</blockquote><div><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"ma=
ilto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt;</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small"></div></div>-- <br><div dir=3D=
"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--00000000000060f46005b007f535--


--===============0404066909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0404066909==--

