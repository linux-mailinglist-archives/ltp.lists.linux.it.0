Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A7D262731
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 08:32:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A4D53C2C67
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 08:32:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AE1013C26DF
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 08:32:23 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 351591400DBA
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 08:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599633141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ur5AWBHMC+qYN1tRjRbMSZf1cZL2zQDKRmhxIzyyUUE=;
 b=P8b0tI3UuctY36Y5fLEqwEPZntf5k5OmAsot88V298VVOVXdAUydCgtyFVRGnZaHEkxxHl
 he2Nc94H/X73wog7IK3Lp/UZGzkoS18eunnxZMZ85084edsAozsUkL4xWW11GizSN8pv1p
 LYbcGBg0CyZo5Vil4IGl8SXKs/VToSk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-kyZXaRAoPxatbMdMnuIMEQ-1; Wed, 09 Sep 2020 02:32:19 -0400
X-MC-Unique: kyZXaRAoPxatbMdMnuIMEQ-1
Received: by mail-yb1-f200.google.com with SMTP id u18so1583437ybu.0
 for <ltp@lists.linux.it>; Tue, 08 Sep 2020 23:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ur5AWBHMC+qYN1tRjRbMSZf1cZL2zQDKRmhxIzyyUUE=;
 b=aa6gdfxELZ0Og36FI0ULXHNJd/1OwBvB5RYm+vuDygyfSArgV2Tr+XP7wG8NHOdbvZ
 fyhMin/sLS2gq/+QNA5upaM9KVR5Z8W5JYAiXPnT8bXOHIN2JD6dxx9RHsLvVnsVwl1K
 MdQeccsTPEMKedf9ayA25SNXSCWki76XfqEDtMvnbJqTutovbWboaiwToMJV8gTbWtuZ
 P2NpB4cFBIV8vgoUis8zu0Sgc0lf4uH6w0jAmto4xnEBaTP1GUaAfMDgqymxE9uy3Psb
 1B4x6UMuoPKoMWvNuNX7miUedeg+KywH4dJk2UWZGVxLil3WwRwsdf/Z+H3dt2jVI6/C
 GcPw==
X-Gm-Message-State: AOAM533o5783aY6gQDLfHsvSFkpIdeaTk6SgPuj5PL/BrzfC5XWJnHSq
 qFsF++ldQwf5RcNV2K1T2s4UaRqzw3pfNTDrL2n8lsNjXVaBCtzLXZ2KaW0XU7Yz04jP3CmRBTe
 5okqWZ9uGAlC3BN6NIrKhQ6p4ukA=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr3893345ybf.110.1599633138698; 
 Tue, 08 Sep 2020 23:32:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5SgwxkfkTTXmuxthwG8KPQonQcXXGr0tM4qGhgzh5jqQ01UYuXBASa12POYR7ecNfIN4QUQjj2eZn6R1T/J0=
X-Received: by 2002:a25:cc14:: with SMTP id l20mr3893323ybf.110.1599633138447; 
 Tue, 08 Sep 2020 23:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200907150157.23886-1-chrubis@suse.cz>
In-Reply-To: <20200907150157.23886-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Sep 2020 14:32:07 +0800
Message-ID: <CAEemH2c616VZjw6W5tmymBNJMXshZ2f3+T4dx17+9VT0nfh4Yg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/10] Rewrite shmctl() testcases
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
Content-Type: multipart/mixed; boundary="===============1902540272=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1902540272==
Content-Type: multipart/alternative; boundary="000000000000fd108505aedb9c79"

--000000000000fd108505aedb9c79
Content-Type: text/plain; charset="UTF-8"

For the series:
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000fd108505aedb9c79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">For the series:</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com=
" target=3D"_blank">liwang@redhat.com</a>&gt;<br></div></div><div><br></div=
>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--000000000000fd108505aedb9c79--


--===============1902540272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1902540272==--

