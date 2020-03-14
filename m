Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559818569A
	for <lists+linux-ltp@lfdr.de>; Sun, 15 Mar 2020 00:54:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8F503C2035
	for <lists+linux-ltp@lfdr.de>; Sun, 15 Mar 2020 00:54:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 56ABB3C0BA3
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 00:54:09 +0100 (CET)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7639E1400274
 for <ltp@lists.linux.it>; Sun, 15 Mar 2020 00:54:08 +0100 (CET)
Received: by mail-pf1-x429.google.com with SMTP id l184so7566212pfl.7
 for <ltp@lists.linux.it>; Sat, 14 Mar 2020 16:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NcUZqNRlMi0k1urxZa79Qyw6ADt51TA+eS6R5B893JE=;
 b=AnQ68/HH3aGsOeFKp7AaUTaFVGzGsShZNVprIUneH3NLgw4NNaU+LwgAGCSem1KinP
 0VzNwWN+3ZGo+iBq/z+RKPkkTi+xjbqgBzSgvJVrSpX0+dMt+bWqdyXjXLCmWzONgGS3
 tmw7kSrfetKd3BEHq7IZ2MEZM5f8hfYqhSiXtjqE6rqGbO2l8z3+S/o6iKA5Cy2HcqPe
 0JMk9lKX6Y3/B3pta67m2KHnv84K0PLz+ODd/pBrN7r0CCKfuhr9/H54ylT6fE4WuZhO
 B9K4VumLWsMR676Tdy1r8gy8TWRtCYVbStwbP15Z9i7+uiRI3wvwz/+3i/RyZ8GNFwGN
 TCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NcUZqNRlMi0k1urxZa79Qyw6ADt51TA+eS6R5B893JE=;
 b=glFeN9gxS8PQkTV2feQ8jBVXOHvMfTiWgxW10cz+4AHhtYZau4y3QuZovJjzQNlyJ2
 OGjzXr7zFkZw7o+BhPC6q14rpdnsUDWB1uGH6LreFnjaqhXTgW2D+7tw0lH6PaiEA2pL
 wHBo25H8Sk/Sn5Tem2NeXMXbnbvgbCwn6eqZVetQN/uTP2F1vBnItHdWnXrSrj0XliGf
 MCCDz+1nV0oXitDXJhRcfp5IbevHjhGHEFi0LhHDt9eWhAGDH7zgPtFDEMMm0isWD55J
 eKf/OfY8Ul8CnZlsCqMZe2Ue9IyQcoj/5LfIi0mvUk1Bp38fRLhh/ioxFfswEmWh9ys1
 nrlA==
X-Gm-Message-State: ANhLgQ1KmI5kd/++iPbfAwtABGN3xd+5Otxt+zuRj1+H7efgd7kSMkHX
 HecnxAFz7CxBg0Nz/2rm7JwmNryHjQy2r3LgWhO28A==
X-Google-Smtp-Source: ADFU+vsV2iiiuV8XfUQepMNOirbroXAsfl1maGXXaweh3ATyD90ygYcJuN8KD3yyJeG9CCzBQk2iYWJucH94dU9q6YE=
X-Received: by 2002:aa7:8695:: with SMTP id d21mr21870245pfo.199.1584230046740; 
 Sat, 14 Mar 2020 16:54:06 -0700 (PDT)
MIME-Version: 1.0
From: Javier Romero <xavinux@gmail.com>
Date: Sat, 14 Mar 2020 20:53:52 -0300
Message-ID: <CAEX+82K_6yO1pB9utLg3TPheG91+oO-ode7kmMUPoLLe7aszxA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] Contribution to the LTP.
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
Content-Type: multipart/mixed; boundary="===============1718216989=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1718216989==
Content-Type: multipart/alternative; boundary="0000000000002db60b05a0d94d94"

--0000000000002db60b05a0d94d94
Content-Type: text/plain; charset="UTF-8"

Hi,

My name is Javier, work as a cloud engineer and have been working as a
Linux sysadmin for the last 10 years.

Would like to know if I can be useful for the Linux Test Proyect and
contribute as a tester.

Thanks for your kind attention and sorry for the inconvenience.

Best Regards

--0000000000002db60b05a0d94d94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">My name is Javier, work as a cloud engineer and have been w=
orking as a Linux sysadmin for the last 10 years.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Would like to know if I can be useful for the Lin=
ux Test Proyect and contribute as a tester.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Thanks for your kind attention and sorry for the inconv=
enience.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best Regards</d=
iv></div>

--0000000000002db60b05a0d94d94--

--===============1718216989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1718216989==--
