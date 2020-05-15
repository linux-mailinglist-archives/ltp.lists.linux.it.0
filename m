Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD81D456C
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 07:53:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1580A3C53C0
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 07:53:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D2E593C094C
 for <ltp@lists.linux.it>; Fri, 15 May 2020 07:53:00 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 11CBC600202
 for <ltp@lists.linux.it>; Fri, 15 May 2020 07:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589521977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=np8gRsGnN+EA+Nxj0mfGMCXD4xInnSs91iia1FWgZLU=;
 b=YeqhzZouCycvLrHmITciFLsFsgpIU4ACAp5VvHQScIHqt5b4kT6Nh7q1KdFSGYuZJvoXKA
 iUbAFYvTH6X+8GeIgUXCy/ONzCcwe3h59thaxgusILNBrUPrvaSqW/4ydOq6ga9uhXbovj
 yxZQcATo6SppxHwlPcoWYzLFe5MTTM0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-bWbLiovVMPupRcmyDOZK9g-1; Fri, 15 May 2020 01:52:54 -0400
X-MC-Unique: bWbLiovVMPupRcmyDOZK9g-1
Received: by mail-lf1-f71.google.com with SMTP id j12so447406lfe.7
 for <ltp@lists.linux.it>; Thu, 14 May 2020 22:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=np8gRsGnN+EA+Nxj0mfGMCXD4xInnSs91iia1FWgZLU=;
 b=jnxur4uMgmcSmcr0vnFFQIFBf4LAwqVMj2Od15RZIpI+JzLNlW36XTIFPfRJWH88T3
 BhND9Etc4Oc5rJWFRaPWj8CtZ+jZIepyeDmnod2YK03YbbfyeCm//nOfXo5BGNfbV3Qc
 DxoOkMWJEFrXqIg8L2zTCHFXgvHYTHpzNRbko0iRiwJfdTuoR9g9tuZhC0iNDR54UNlD
 GMJx5I+cMkd+8nisCr0ezNABXo6Akre2ef7qvlsFfUVbNRL5k1/C5thC1T6+l9BMvOwr
 HPrbjP2d2COhhh379CojoT0yergx4zCwrIeiL8dKdNXfbrl4NYtwFBgtj62BNAnXL70u
 myZA==
X-Gm-Message-State: AOAM5310l7hcKab3rlkCEExTA0mRabJMb9HZWZ7OWUReJtjQeQyhCFLA
 S5NBERtPfqhR7joOxNIiABHjkbnDe9poND4A35XTMVbybwNfj+XORBZ51vXreDom7zRljvKxKHr
 WoIdERZb/Q7lRFaugO1iqMuZVyLE=
X-Received: by 2002:ac2:5212:: with SMTP id a18mr1164186lfl.83.1589521973208; 
 Thu, 14 May 2020 22:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHmiscAjdxlLJApbrmMKw98S49AsK+KyUtc2TE3M3oNbHRbu6cgu9HH70B1yMvKyuEECj1EsofwzOvDml5ZRk=
X-Received: by 2002:ac2:5212:: with SMTP id a18mr1164179lfl.83.1589521972940; 
 Thu, 14 May 2020 22:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200514190906.27130-1-pvorel@suse.cz>
In-Reply-To: <20200514190906.27130-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 15 May 2020 13:52:41 +0800
Message-ID: <CAEemH2e5G53VPLp4bOe_i-2_4eRSF9dbTC378rqN-AwGanUTEw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] INSTALL: Update requirements
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
Content-Type: multipart/mixed; boundary="===============1470887658=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1470887658==
Content-Type: multipart/alternative; boundary="0000000000008f74c205a5a96cc0"

--0000000000008f74c205a5a96cc0
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

As we know most distributions provide the requirements packages already,
so I'm thinking if we can replace the download link only by installing
commands, that will make people easily prepare their test environment.

Which something maybe likes:
--------------------------------------

+       #### Debian/Ubuntu
+       ```
+       sudo apt-get install make
+       sudo apt-get install pkgconf
+       sudo apt-get install autoconf
+       sudo apt-get install automake
+       sudo apt-get install byacc
+       sudo apt-get install flex
+       sudo apt-get install m4
+       ```
+
+       #### OpenSUSE
+       ```
+       sudo zypper install make
+       sudo zypper install pkgconf
+       sudo zypper install autoconf
+       sudo zypper install automake
+       sudo zypper install byacc
+       sudo zypper install flex
+       sudo zypper install m4
+       ```
+       #### Fedora/CentOS/RHEL
+       ```
+       sudo yum install make
+       sudo yum install pkgconf
+       sudo yum install autoconf
+       sudo yum install automake
+       sudo yum install byacc
+       sudo yum install flex
+       sudo yum install m4
+       ```

Anyway, this is a good update for documents, I hope these could be involved
in the newly released.
[CC Cyril to notice this]

-- 
Regards,
Li Wang

--0000000000008f74c205a5a96cc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">As=
 we know most distributions provide the requirements packages already,=C2=
=A0 so I&#39;m thinking if we can replace the download link only by install=
ing commands, that will make people easily prepare their test environment.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Which something maybe lik=
es:</div><div class=3D"gmail_default" style=3D"font-size:small">-----------=
---------------------------</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">+ =C2=A0 =C2=A0 =C2=A0 #### Debian/Ubuntu<br>+ =C2=A0 =C2=A0 =C2=A0 ```<=
br>+ =C2=A0 =C2=A0 =C2=A0 sudo apt-get install make<br>+ =C2=A0 =C2=A0 =C2=
=A0 sudo apt-get install pkgconf<br>+ =C2=A0 =C2=A0 =C2=A0 sudo apt-get ins=
tall autoconf<br>+ =C2=A0 =C2=A0 =C2=A0 sudo apt-get install automake<br>+ =
=C2=A0 =C2=A0 =C2=A0 sudo apt-get install byacc<br>+ =C2=A0 =C2=A0 =C2=A0 s=
udo apt-get install flex<br>+ =C2=A0 =C2=A0 =C2=A0 sudo apt-get install m4<=
br>+ =C2=A0 =C2=A0 =C2=A0 ```<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 #### OpenSUSE<=
br>+ =C2=A0 =C2=A0 =C2=A0 ```<br>+ =C2=A0 =C2=A0 =C2=A0 sudo zypper install=
 make<br>+ =C2=A0 =C2=A0 =C2=A0 sudo zypper install pkgconf<br>+ =C2=A0 =C2=
=A0 =C2=A0 sudo zypper install autoconf<br>+ =C2=A0 =C2=A0 =C2=A0 sudo zypp=
er install automake<br>+ =C2=A0 =C2=A0 =C2=A0 sudo zypper install byacc<br>=
+ =C2=A0 =C2=A0 =C2=A0 sudo zypper install flex<br>+ =C2=A0 =C2=A0 =C2=A0 s=
udo zypper install m4<br>+ =C2=A0 =C2=A0 =C2=A0 ```<br>+ =C2=A0 =C2=A0 =C2=
=A0 #### Fedora/CentOS/RHEL<br>+ =C2=A0 =C2=A0 =C2=A0 ```<br>+ =C2=A0 =C2=
=A0 =C2=A0 sudo yum install make<br>+ =C2=A0 =C2=A0 =C2=A0 sudo yum install=
 pkgconf<br>+ =C2=A0 =C2=A0 =C2=A0 sudo yum install autoconf<br>+ =C2=A0 =
=C2=A0 =C2=A0 sudo yum install automake<br>+ =C2=A0 =C2=A0 =C2=A0 sudo yum =
install byacc<br>+ =C2=A0 =C2=A0 =C2=A0 sudo yum install flex<br>+ =C2=A0 =
=C2=A0 =C2=A0 sudo yum install m4<br>+ =C2=A0 =C2=A0 =C2=A0 ```</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Anyway, this is a good update for do=
cuments, I hope these could be involved in the newly released.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">[CC Cyril to notice this]</=
div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Rega=
rds,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000008f74c205a5a96cc0--


--===============1470887658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1470887658==--

