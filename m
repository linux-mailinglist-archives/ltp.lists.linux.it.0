Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15916160316
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 10:10:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C146C3C2467
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 10:10:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3D0693C2297
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 10:10:17 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 142916008C3
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 10:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581844213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ejLIVPGjcCqQ1Goa/q1ruVou+z5qQNGgS+I0QiN2e/Y=;
 b=fFZGNWyp4baIZO4F86p6SwdYdkhgJ79h5h1bbuCuTG8s9Q824aYJkXNOi0lMzyc3G2vAMJ
 TCF/ykKIun2plHIrhqXMhIhknPikgTQy9I+/vJt5GrOXdfTAPavDRitQRPXHLfP5SoHN0I
 +CzVnEpXkYjsgqa8CjZ0SK8z4aAbBl8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-JFCY7FSOOiWKfS8deM3xDg-1; Sun, 16 Feb 2020 04:10:05 -0500
Received: by mail-oi1-f197.google.com with SMTP id s25so6735810oic.17
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 01:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8moPBhqTpfazFZGC5Z0xWjYYpzwg5p4L/IIYWz53/J4=;
 b=NThFVC4Od9IPxXb5O6pNoEO0ZeW4BK3Ou4p6BV6WT/tVP9Tr8Pfn2u1mnVNWM0Yb4X
 GP46HYaGhH2xadRgOdvw04CVgHKiW4kEcLcvGnlJQgjhl3g2K/UA6Y7qR1RyG6jFQpu2
 dIZyVvFJPsHMZ884/6egZzHW5jjnvbqx13cdtXxAtuBY3zdrPMGyhD6XSn92d/eepppp
 A+HdBFjJ1Apy3RAJ6enRMjiYBpa277Eirah4dqn4T6DSbKdXJiJfpS2nLPXgyrlI0coh
 uU/7KvpEWjTkMeO0tIWmwr5iOpyvcS+8kRQb4ABBx+jRL8MvQDL4DqUHhlym0B4wUdhe
 CVeA==
X-Gm-Message-State: APjAAAUaqZ3ym7hUIZrjlee0xST65xuQA6kWhgljgQVMEKH+EJBcztcn
 HmsJipvx5MsLu03czMbPgJdKsKmasJx5Un+UgRYuTa6TxQ8UUGq3ssoLySN8JvLdDlGlVhKftqZ
 bC5H6NDzR1l47RZ19rY7sx0ey51M=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr6611773oie.144.1581844205121; 
 Sun, 16 Feb 2020 01:10:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYbuVkwoBstm6s0OexJCJ7UiQQbkKOUzqxOxt0SUbzbipdkq1KBEX7W2O4GJuc48ro86Fdd+AP+oOaFD5ut7E=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr6611753oie.144.1581844204773; 
 Sun, 16 Feb 2020 01:10:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <98f8a5780f679b90f53fdded8b1b8821d7eb1ce9.1581680021.git.viresh.kumar@linaro.org>
In-Reply-To: <98f8a5780f679b90f53fdded8b1b8821d7eb1ce9.1581680021.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Sun, 16 Feb 2020 17:09:53 +0800
Message-ID: <CAEemH2eju4-Gv8P_H8teuo3qDYbFmfKL6EZbWQfw6xLHqWa5Xg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: JFCY7FSOOiWKfS8deM3xDg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/7] lapi/fsmount: Add definitions for fsmount
 related syscalls
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0217943080=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0217943080==
Content-Type: multipart/alternative; boundary="000000000000ea7805059eadcd87"

--000000000000ea7805059eadcd87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

Thank you for creating new tests for LTP.

Unfortunately, this 1/7 patch has overlap with zlang@'s patch[1]. It
probably can not be merged if the patch[1] applies first. But the remaining
part is valuable to LTP, you can drop some of this and rebase your code to
make use of the header file again.

[1] http://lists.linux.it/pipermail/ltp/2020-February/015336.html

[CC zlang, pvorel] to have a look at this.

--=20
Regards,
Li Wang

--000000000000ea7805059eadcd87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Viresh,</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Thank you for creating new tests for LTP.=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Unfortunately, this 1/7 patch has overlap with =
zlang@&#39;s patch[1]. It probably can not be merged if the patch[1] applie=
s first. But the remaining part is valuable to LTP, you can drop some of th=
is and rebase your code to make use of the header file again.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">[1]=C2=A0<a href=3D"http://lists.linux=
.it/pipermail/ltp/2020-February/015336.html">http://lists.linux.it/pipermai=
l/ltp/2020-February/015336.html</a></div></div><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gm=
ail_attr"><div class=3D"gmail_default" style=3D"font-size:small">[CC zlang,=
 pvorel] to have a look at this.</div><br></div></div>-- <br><div dir=3D"lt=
r"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--000000000000ea7805059eadcd87--


--===============0217943080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0217943080==--

