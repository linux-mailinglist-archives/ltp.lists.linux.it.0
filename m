Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E5354D6B
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:09:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 895D83C1E0A
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 09:09:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A64493C209A
 for <ltp@lists.linux.it>; Sun,  4 Apr 2021 13:59:04 +0200 (CEST)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 070D26000F5
 for <ltp@lists.linux.it>; Sun,  4 Apr 2021 13:59:04 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id x9so6698079qto.8
 for <ltp@lists.linux.it>; Sun, 04 Apr 2021 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2vRuM4nP4EdEA7AbGp03uObA5MQp8hjKM/wopybzZn8=;
 b=c8/vL1cV5PwUngc7E+ojujkrKV6e0v1Em0UUZur4ZR8SJhZ0DIOFvyBeoef6tdDaRa
 yokEYv7XMoBDY+afraQ10G92RD6tf+yROUqeqclDODzX90r9pTiCJZ/5IV4cngzgkFHw
 PcM5Nn6g/HxcvJO4Xv38QdyVQ6sQNdaHqfq2pGOE0o4Mt6L+2OzDt5R7WGo9cg44gzsL
 Yuae9sifASf4FLK15e8Z9EyTYF+ob0Pea9ZIBU0JaRH4x4FmN+ojdKWw+fc3bXzfRscz
 LHAhHSHJHrgDPX4uqebM4XZfhwVSAhUngYU4Gh+UXBOlAbMBK4HTvxQiX/SBr2OGsmXY
 w+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2vRuM4nP4EdEA7AbGp03uObA5MQp8hjKM/wopybzZn8=;
 b=lFHF5L29ivf/Tzncy4DDc5RolFSLS/nSNJFjGz1YVjbWrpRP/Fm+iS6YV+xv8mzxia
 MrYAYS1j6oTBv0MoQgIwkwdfN3LdXqo3at4E0wnJFAnFKpUSteV3ZK87RLWOWoUPBmL0
 +OkLTr6duy+3dQC3cqtIWVEtdCQE8hLYBkCcZwQVFGBRNqXqch91KpKGADiJkOjVUzhL
 4jK2zU3GbN42wBjrto7ii0kXj3lmECGtknN/9c0xkZbifhlUoOTAlPjjCnmVUJmi+sqQ
 0scm5gZsbXz4hC46cnTqojvfelQ78VqUDVENoviiTWAWu+sSV1L0EWf/7TebztWgQ4De
 aHsQ==
X-Gm-Message-State: AOAM5330wbugdHzkT5PqTssFLpSVeaaKu29jEwD98dLil6JZrndcx7ZH
 FZkrJbz8qWeEKKsT1CYhtUCXNiXxustqt8GwaOfbWXFJOapFkQ==
X-Google-Smtp-Source: ABdhPJy5Put8lh0W29m2R6dgXUsSxOgTpw4GiPP3TBQ52inf6ynCgDEdkRbL92ziG2xFotUEhYnt3BxSVPS+Z5sTjFY=
X-Received: by 2002:a05:622a:1487:: with SMTP id
 t7mr17754820qtx.345.1617537542558; 
 Sun, 04 Apr 2021 04:59:02 -0700 (PDT)
MIME-Version: 1.0
From: Akshay Mhaske <amhaske01@gmail.com>
Date: Sun, 4 Apr 2021 17:28:51 +0530
Message-ID: <CAEQtK3eWPsFFqBmQ9RpiOaWo5QhUSy_=-PNQCjNDJNiTOZNqKg@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 06 Apr 2021 09:09:55 +0200
Subject: [LTP] cve-2015-3290
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
Content-Type: multipart/mixed; boundary="===============1055858686=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1055858686==
Content-Type: multipart/alternative; boundary="000000000000a296c905bf244e1d"

--000000000000a296c905bf244e1d
Content-Type: text/plain; charset="UTF-8"

Hi ,

I am running kernel ltp test cases on android x86 platform,
and cve-2015-3290 test case is failing only for 32bit and passed for 64bit.

I can see here, test case itself is broken with SIGBUS error and not giving
any result






*pid: 5316, tid: 5324, name: cve-2015-3290  >>> cve-2015-3290 <<<04-03
07:59:29.741  5327  5327 F DEBUG   : uid: 004-03 07:59:29.741  5327  5327 F
DEBUG   : signal 7 (SIGBUS), code 128 (SI_KERNEL), fault addr 0x004-03
07:59:29.742  5327  5327 F DEBUG   :     eax 00000007  ebx 652457bc  ecx
00000000  edx 0000002304-03 07:59:29.742  5327  5327 F DEBUG   :     edi
00000007  esi e7ac41c804-03 07:59:29.742  5327  5327 F DEBUG   :     ebp
00000800  esp e7ac4110  eip 6523a800*

I think assembly code is causing wrong memory address or some memory
alignment is not proper and so we are getting SIGBUS error.

Can you please help me on this.

Thanks & Regards,
Akshay Mhaske

--000000000000a296c905bf244e1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ,<div><br></div><div>I am running kernel ltp test cases=
 on android x86 platform, and=C2=A0cve-2015-3290 test case is failing=C2=A0=
only for 32bit and passed for 64bit.</div><div><br></div><div>I can see her=
e, test case itself is broken with SIGBUS error and not giving any result</=
div><div><br></div><div><b>pid: 5316, tid: 5324, name: cve-2015-3290 =C2=A0=
&gt;&gt;&gt; cve-2015-3290 &lt;&lt;&lt;<br>04-03 07:59:29.741 =C2=A05327 =
=C2=A05327 F DEBUG =C2=A0 : uid: 0<br>04-03 07:59:29.741 =C2=A05327 =C2=A05=
327 F DEBUG =C2=A0 : signal 7 (SIGBUS), code 128 (SI_KERNEL), fault addr 0x=
0<br>04-03 07:59:29.742 =C2=A05327 =C2=A05327 F DEBUG =C2=A0 : =C2=A0 =C2=
=A0 eax 00000007 =C2=A0ebx 652457bc =C2=A0ecx 00000000 =C2=A0edx 00000023<b=
r>04-03 07:59:29.742 =C2=A05327 =C2=A05327 F DEBUG =C2=A0 : =C2=A0 =C2=A0 e=
di 00000007 =C2=A0esi e7ac41c8<br>04-03 07:59:29.742 =C2=A05327 =C2=A05327 =
F DEBUG =C2=A0 : =C2=A0 =C2=A0 ebp 00000800 =C2=A0esp e7ac4110 =C2=A0eip 65=
23a800</b><br></div><div><b><br></b></div><div>I think assembly code is cau=
sing wrong memory address or some memory alignment is not proper and so we =
are getting SIGBUS error.</div><div><br></div><div>Can you please help me o=
n this.</div><div><br></div><div>Thanks &amp;=C2=A0Regards,</div><div>Aksha=
y Mhaske</div></div>

--000000000000a296c905bf244e1d--

--===============1055858686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1055858686==--
