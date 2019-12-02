Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD5910E4E1
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2019 04:37:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCE593C2439
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2019 04:37:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7BA303C242C
 for <ltp@lists.linux.it>; Mon,  2 Dec 2019 04:37:29 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id CB1A160210E
 for <ltp@lists.linux.it>; Mon,  2 Dec 2019 04:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575257846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PbkX6XevDB2YC3z1qN5QMt0hZibHRr1vzvMjmHAk8v4=;
 b=X+ynp7d6xNCDwsfkWyVPOoIbSJBA+1yc3fIEOnmXdViBuKSbkxaLT8GVLflqmh0EqYaXbJ
 +X27KwmusncHLTcYEMtegENQwOoW9hdSIO7pM41t7yF8nXcwMK4R+9jhPVbvwHYGmrwSEu
 Un9KcwEAvbdssN42utGTsQBlSvEJXQI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-VG9nIWonNrCJOufOkjvRyg-1; Sun, 01 Dec 2019 22:37:23 -0500
Received: by mail-oi1-f198.google.com with SMTP id k137so8940911oib.15
 for <ltp@lists.linux.it>; Sun, 01 Dec 2019 19:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Llo0Yp2sBm/7QMv8qQc7MZbgu71saxEAr/NGAeRIEao=;
 b=F+0di6lXpR8nDAHRS64tcpOaHpwuT86RhoVismhqbsfVvD10OslNYVl1HK3QVKJfRr
 3WME6QDs+gUfnSR2tI1j4CLCJYEr3pqj6NFZJuu/9mz2FegUorWnwC1gk50mLQPTr60O
 vPY48CgumzlsNvZ4NxpTEZlZfQGg5Zjn54W6mb9BNInOMcSzYHrL0xSKm0XvcHrbbgS7
 iDbeRtpxNaU3/SB6CFQ2Xusj7yt3jaxzuUk+cWov1pclmfvcWRcbcHfcVIRtnWQ8Or7h
 s386dr7wW+CvcEaL8KPbvK0GyINsjTtLCscWXtzXsds68POARc7kZgCgH3OCGp1Oas4x
 3RpA==
X-Gm-Message-State: APjAAAUERHCKbIMjHH1PCSSVR7NPkpwmdqgb6t6NGispE3yc78wqTuPn
 a3wYdJcRSlEj5ohg3JfLYhnSk+XqvTtxpIb5G7iACZNhjRnzdhtYzqf0t395fvRC23HDWZvNcML
 MHbJFXmmWSxQ+/JWDJPU0+cgoLeY=
X-Received: by 2002:a05:6830:142:: with SMTP id
 j2mr18720857otp.26.1575257843074; 
 Sun, 01 Dec 2019 19:37:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwWzD3lbjGI2m6fAqldI0PdM58EFamlXCSWyrsbqmmq6qeSfz00+q8uXKgP3WZKZslcOm7HDhkAJg8dj26wClM=
X-Received: by 2002:a05:6830:142:: with SMTP id
 j2mr18720847otp.26.1575257842794; 
 Sun, 01 Dec 2019 19:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20191128045525.15454-1-liwang@redhat.com>
 <615998340.14360504.1575029808785.JavaMail.zimbra@redhat.com>
In-Reply-To: <615998340.14360504.1575029808785.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Dec 2019 11:37:11 +0800
Message-ID: <CAEemH2f2Nu8KozVY2kgxTVLsOBThsSOKimJS5xmRZkhD1-xzcw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>, Petr Vorel <pvorel@suse.cz>
X-MC-Unique: VG9nIWonNrCJOufOkjvRyg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mtest01: correct the ALLOC_THRESHOLD definition
 on s390x
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
Content-Type: multipart/mixed; boundary="===============0045461986=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0045461986==
Content-Type: multipart/alternative; boundary="0000000000002660ec0598b04ce0"

--0000000000002660ec0598b04ce0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pushed, thanks for the review.

--=20
Regards,
Li Wang

--0000000000002660ec0598b04ce0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Pushed, thanks for the review.</div></div><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000002660ec0598b04ce0--


--===============0045461986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0045461986==--

