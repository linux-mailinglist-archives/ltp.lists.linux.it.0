Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CC113C0B
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 07:59:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8837F3C2445
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 07:59:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1EB783C2395
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 07:59:48 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5F60D60242E
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 07:59:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575529185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KGhQbIZAsSyjqQs7cwNo8viyP0qFMVYaq9JnJvT7wkw=;
 b=MZuzREWZVRV2nymoQHdcdybU1HhMqVbtovVKkDRT2vtJxFXDJ436A3dug1yZkRPbgin7/P
 9zpCQkvq4kWReJpAi25I/uIlX1ZhJ1BmvTDNDhaz+55UxXbAd1fwECyWrvaVCj+feSKZyv
 5Ijvnef8HDfCyWl8WcAUAVzJ4OUMps0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-hcjGI8BVO5CYqb0KrR7UYw-1; Thu, 05 Dec 2019 01:59:41 -0500
Received: by mail-ot1-f71.google.com with SMTP id a20so1337943otl.11
 for <ltp@lists.linux.it>; Wed, 04 Dec 2019 22:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8WCYfjRdsvNLtF6uLCHrXaTj8vQLaaImrIEaSnKnd8=;
 b=LOWoFTkKtPKpS5L/1DVgluFTYfrDl8k4mZ3aMrdNekhwZU0mXzrylnC2LPZvu81Hvc
 6ti7niOt1ti37gjs5Y1POON6lBOInfJBJQpg6bnZakY4YRKIWH5PzyYWWIpCLN1ZALQI
 Mu6Jwb8dkRfDu8U+k2Z+qv2UDVOT7sxkrxcsf4A0G5XTNjRARpG7c5OwibfEDxPBno4w
 OCPjSrR7925O1+d2dhzdecibFy4OVx5B5ERMsaVWQXZe7e5fmRKWouhF9mkpWotW+SGQ
 0F3Fq829RaOXqeiQPHA27RMSbKLQnnpDSyDtXrcAAQsc8WiXcvBt2vFDPHKqqA3y+4St
 JFbA==
X-Gm-Message-State: APjAAAVwJP5n0vz4S0zYFYYuUCDtXMe4+Cyxv/Y8e81OWA6VPT/PwbAn
 WRcgQg3SviWC3O1ZpSCa11iOy5Vip7VkmCh+yDuXn5jPTZvR54pxDrI7UvHruyGqpLoO9ZFApSG
 /WMCJl+YmiwnEhbRw4nlE2wnEoLI=
X-Received: by 2002:a9d:a2f:: with SMTP id 44mr5538974otg.264.1575529181240;
 Wed, 04 Dec 2019 22:59:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGf1rreEBentkk7uDY2fqG4pc6UhZgtXX49G/jmWuwM8ngFPm2FJaeTID4OHfePj2ay4L4yb0i4zBj4GhKHL8=
X-Received: by 2002:a9d:a2f:: with SMTP id 44mr5538966otg.264.1575529180902;
 Wed, 04 Dec 2019 22:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20191205063021.9564-1-yi.zhao@windriver.com>
In-Reply-To: <20191205063021.9564-1-yi.zhao@windriver.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 5 Dec 2019 14:59:30 +0800
Message-ID: <CAEemH2fWY+moW82Hj4ZXr76RL5SJfGWEWgYz0mOd0wDs0gv+vQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
X-MC-Unique: hcjGI8BVO5CYqb0KrR7UYw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pidfd_send_signal03: fix compile error with
 -Werror=format-security flag
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
Content-Type: multipart/mixed; boundary="===============1718419380=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1718419380==
Content-Type: multipart/alternative; boundary="000000000000295d920598ef7993"

--000000000000295d920598ef7993
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pushed. Thanks for the fix.

--=20
Regards,
Li Wang

--000000000000295d920598ef7993
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Pushed. Thanks for the fix.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div>

--000000000000295d920598ef7993--


--===============1718419380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1718419380==--

