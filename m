Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD9531E6A7
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 08:08:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 483C83C58E9
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 08:08:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9E6AD3C58E1
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 08:08:40 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5CDEA600C25
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 08:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613632116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8tHQu1o0Sej9YmZalqkMlpiyD1PkhEKj1HJAKwA9C5Y=;
 b=W/3uvCdMryxL+nIRD/p9p1gYvEWkvQ7MhmOFD5wcCCEDK0M61ekGceLxa4IN4B8AKEAJ1k
 5iN/E8eHZRYj1QTq2CHnslL0DFRWjVV+xcwt39k/dg2tWamj1psSQO76hkgH7LcSZeXsMl
 YxliS+IyvByC6jE6u/zwTuOcaaHJ18Q=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-wcYxJkn8MT-dav1XIih9Vw-1; Thu, 18 Feb 2021 02:08:33 -0500
X-MC-Unique: wcYxJkn8MT-dav1XIih9Vw-1
Received: by mail-yb1-f198.google.com with SMTP id v62so1611331ybb.15
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 23:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tHQu1o0Sej9YmZalqkMlpiyD1PkhEKj1HJAKwA9C5Y=;
 b=X1BlMymP7/oGCzvIVks1ORjJA4kg+xd2K/vMGWLxCe48GLuZ6o7KfvmUhBcnHcFE7K
 ygbYgQ9Z8Vlb/WMHOqFpPrzr3BBM04ogWPWrj2tycf8rzKm8eyQRXujnKIlzRzxYmcAq
 EZxTrjlEw2SecH3txhX4PlIOUluAJ4HkaU/r6UvWOEiLLKSmtn7Wfz7SKO5Iu5Hq86B3
 VtfViwV9+eEwzhkhg5NDsujyaICiB8i4vNoKz+UztLFeXRu7sOGgoVdGnV9qxWsIUDxK
 rmQ6KF/xNyHxqfQmGvxAqhlYVOAy6nv/1mIcHCtN2/Ti5RJNB7dF21ifZcnFmDkgKYCr
 MtQQ==
X-Gm-Message-State: AOAM530IqQPblV/vXEo69gzsnNeLl8YI506Te0ZK81pDTmoKKaQe+Ogc
 bTQe6EGVLafDnyp/LxKOyMvpoqZwmML5uRW+wLS1SBwWMtLKWwG9TFjFRhV/OvpxsJJVX7RoVkZ
 HtKEMHWyQvyCFe93PfS8r2gBHS5U=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr4899921ybd.243.1613632113340; 
 Wed, 17 Feb 2021 23:08:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfVyxzjRlLyFep9w9EKndpXC0XM/XkKEqJDwfzyXjDYLgLDhl1rmLiFmDnPAhHQFSKWJugIM0d53hLHNdtJvU=
X-Received: by 2002:a25:ea06:: with SMTP id p6mr4899899ybd.243.1613632113132; 
 Wed, 17 Feb 2021 23:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20210205011635.177469-1-zhaogongyi@huawei.com>
In-Reply-To: <20210205011635.177469-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 18 Feb 2021 15:08:21 +0800
Message-ID: <CAEemH2fmNvrYWcaBepS7gSXSJdZo+oHLAfBSFHGkiEQmxN8DHw@mail.gmail.com>
To: zhao gongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ttype: using TERRNO to macth errno
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
Content-Type: multipart/mixed; boundary="===============1024785953=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1024785953==
Content-Type: multipart/alternative; boundary="000000000000e6db6d05bb970052"

--000000000000e6db6d05bb970052
Content-Type: text/plain; charset="UTF-8"

Pushed, thanks!


-- 
Regards,
Li Wang

--000000000000e6db6d05bb970052
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Pushed, thanks!</div></div><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr"><br></div></div><div><br></div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></di=
v><div>Li Wang<br></div></div></div></div>

--000000000000e6db6d05bb970052--


--===============1024785953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1024785953==--

