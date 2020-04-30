Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CF1BF005
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 08:07:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C5BB3C27E0
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 08:07:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4B7173C26E4
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 08:07:32 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BE5EB100023B
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 08:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588226849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FQroXCQREl/2iazpGKs4biMsKTHanJVvL3Hp2l9Af6Q=;
 b=FoUaawC7wmXmuc7FqWkEBSk2/5O28vNrGtOP0XmevUs+PYgWoL1V2UD3BQVVs+z7hfN1vO
 uTNmIBDrcPaPqFanjWArHAAXWHYBpFgjtoHcv7uQNq9fxD8vWmm26+/acfDDjjW2BR37eW
 H/NqL9CEfqXjKanNBpSJZf5Zx3gB5P4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-sJKsD7M9MjmTquhB0YYEBA-1; Thu, 30 Apr 2020 02:07:24 -0400
X-MC-Unique: sJKsD7M9MjmTquhB0YYEBA-1
Received: by mail-lj1-f199.google.com with SMTP id e18so821288ljg.7
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 23:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVEpQU5MSecsZmaDeZVj7ZqCa/ruOp05f3SgPXdv4pM=;
 b=R7DcMYunr/9F4HkgIhajgTcIyunlC9RcnF5v2cH2zHsUVeDItSoKMQZRTsPRi1AACV
 uWD43XUr5Sp+ze1IfrXvexLHJJTg2W6RiG/P/T8AthnZpP7MQn5z+srsAP1IbKNWHHcU
 Gln7Gkhq8OrhNX/e5yMB9nzk0u0L/3gVEgC15LnOnApajLpysY1mG5XRnFjNOtSGwL7n
 4qPTEkoyXZGa/rY3D6SVqNjBSp8YhdvqWJSeoSTn6RN3WDuXbthwu5ho+UAUx/8m345X
 wDArWXe6iLiLorHXNgevZjfIrcncJXagFwuCs3fk/06WN7OmhWL6fO8FNJdNaAM724l/
 WKsg==
X-Gm-Message-State: AGi0PuZOj9u3j5ZeG4HDiPyE42T0bpQ7D9cDa7kPV5cZmu/RRSCWFrK0
 X+2sUhFx/EQKkEjYRph3bjF07TUcH28wnUIEi0TJjgzKkx/v9BqhcNxIUW0UrBgyKuPwI0yHpr3
 M90bCF1S9cAcVe6BpuFdU/XLad2s=
X-Received: by 2002:a2e:8753:: with SMTP id q19mr1169155ljj.6.1588226842516;
 Wed, 29 Apr 2020 23:07:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypJFPQ/ZVr6G41Nml6EBLZO1jtzrPJLKywWtu9PAoxG19rBcRHGXqB6SQR1TCmx3VGLjRO6yQmwPkcT7BS187I8=
X-Received: by 2002:a2e:8753:: with SMTP id q19mr1169149ljj.6.1588226842321;
 Wed, 29 Apr 2020 23:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200429092601.6325-1-mdoucha@suse.cz>
 <CAEemH2fnv-hynqo2CeROs-C3EwRuVD1+YhRN4FtSHgbakwffrg@mail.gmail.com>
In-Reply-To: <CAEemH2fnv-hynqo2CeROs-C3EwRuVD1+YhRN4FtSHgbakwffrg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 30 Apr 2020 14:07:10 +0800
Message-ID: <CAEemH2ce9EMoLskLwVDkCi=KN-18dQm7mU9GwhkHSoKb74njrw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] tst_is_virt(): Allow checking for any
 hypervisor
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
Content-Type: multipart/mixed; boundary="===============1623787546=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1623787546==
Content-Type: multipart/alternative; boundary="000000000000c282c705a47be0eb"

--000000000000c282c705a47be0eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pushed, thanks!

--=20
Regards,
Li Wang

--000000000000c282c705a47be0eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><span class=3D"gmail_defau=
lt" style=3D"font-size:small">Pushed, thanks!</span>=C2=A0</div></div><div>=
<br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000c282c705a47be0eb--


--===============1623787546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1623787546==--

