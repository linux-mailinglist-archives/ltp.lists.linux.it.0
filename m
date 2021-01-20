Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 869EF2FC87E
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 04:10:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A1693C53EC
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 04:10:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E38993C2863
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 04:10:23 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B53B16000FC
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 04:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611112221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zf2rjI2iY2Kds2/NW9zqVk7O8UFkh1N0FThYOyBgumo=;
 b=Gzwo3/9g/O4PSMubiu4hCqLFpobjB3r5rFLDEa/Z4r7oENK3L/W8WYVYHrLt036azwMt3Y
 zzWbyH68vAYAaarDWbf4zCAWe94/6OZZtDkaI0lEtezWJsNiFg7oqiLALg+zlTLhVf2J8C
 R1lKghiFWnCxn2ZRrTKKmZXLGknig50=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-OnN15iByMPyNTrqU5eMevA-1; Tue, 19 Jan 2021 22:10:16 -0500
X-MC-Unique: OnN15iByMPyNTrqU5eMevA-1
Received: by mail-yb1-f199.google.com with SMTP id b62so18789737ybg.1
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 19:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zf2rjI2iY2Kds2/NW9zqVk7O8UFkh1N0FThYOyBgumo=;
 b=Tgc+GTJI0fZjyqcSSlTuivhQuGaD/yeC4rfMJzsam6R+7mDil0Xx/0yyxXPdMyZkee
 nLLdrIlwz9QBB50k1yhsVCKs846ZDSyWS9Sjtcf8lMUr7vFtHLWXzcdF7wB8Fv6f6kcc
 g9ZSdIv9w2XHse3s1Dd1dL/Wx5HNMtTwtNKX9tT4LI/WpKC4aOO+N9elsSArHmnecKTm
 6OzGNSoj0RI55LhjIT2Wg2EPLzxX2NGmbQoKdH9URNF1eNfkDOTWdb/2CR5IpAaPVPw6
 RICSuMxE1e9vKnRxJ69ZpC/aWbSkH+P1btbdxuWrE3vsPymeJ5Tvt8vyQE51/zVsaZ+a
 YG+A==
X-Gm-Message-State: AOAM530tnCQBY5rupqRJcqNB/GPp4o/G3tZchO2/wkYixJZoCby88C2A
 vqpFR7A83SQXM6qPt8kMviOLJG8G3PtcqjVFtjtqujZIkX6fqisQ2bO2Vsk5qDydxPvV/Vhpm1E
 Cbwr/OIuiUrnMuI0cGm6ewnU+iC4=
X-Received: by 2002:a25:da06:: with SMTP id n6mr10765622ybf.97.1611112215923; 
 Tue, 19 Jan 2021 19:10:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwd9lP504n4+uC0Ur/Yhrj5G9Cn+g1svxNhv0igzMEacCo3CZlUtJKjONTOku7gQk72vNMcsbplBhYOwCn5jw=
X-Received: by 2002:a25:da06:: with SMTP id n6mr10765608ybf.97.1611112215763; 
 Tue, 19 Jan 2021 19:10:15 -0800 (PST)
MIME-Version: 1.0
References: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
In-Reply-To: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 Jan 2021 11:10:04 +0800
Message-ID: <CAEemH2dj2KGi6dmYoJaxsvvG1wvecbM8GrpBshHh8CTkm7pe+A@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
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
Subject: Re: [LTP] [PATCH] mlock_8-1,
 munlock_10-1: don't use LONG_MAX as invalid pointer
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
Content-Type: multipart/mixed; boundary="===============0076091988=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0076091988==
Content-Type: multipart/alternative; boundary="00000000000050756905b94c4bbf"

--00000000000050756905b94c4bbf
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

I propose to reorg this patch with review comments (maybe apply it after
the new release).

Any thought?

-- 
Regards,
Li Wang

--00000000000050756905b94c4bbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Jan,=C2=A0</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I propose to reorg this patch with=C2=A0review comments (maybe apply it =
after the new release).</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">A=
ny thought?</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--00000000000050756905b94c4bbf--


--===============0076091988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0076091988==--

