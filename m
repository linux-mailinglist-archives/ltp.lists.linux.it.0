Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F497526
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:38:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A58383C1CFE
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:38:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B35F33C1866
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 04:25:26 +0200 (CEST)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D41B81000D8A
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 04:25:19 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id p17so446311wrf.11
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 19:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=L3fmyO7RdwoBeCqdNOhvaQTZYSyba5tKYQjpTl+Riao=;
 b=ALZl8BebKhKB1CxzJP9MF5RAfsz1RQ6vMBJHPUdj7eWzoEMerigG1oX4IMMTKRPr6o
 F6UgMHWo8WDHbGJh6Rv/AQSeHqHhi+8OfI11vpm04u+phS3yKtk532XJYpSE5IZr3R5R
 0TsM9emQb8fEczoH4bw9Qkc7LhFP/vCJ0nSozC0HagbjX5iijht0dmeWg++pESr/nRRm
 dXtE+n4V5dS0wth7F+Acxh2K2ejWKBCanZmB2h68iRuoCL6wOYDavDEI3HoBUxoXPiFL
 41a+lKodfOEp+qIyyT9IiJulNfoIFf6k2tdHg9AtdbhMG4qoH/rlzjNz5B/GSVqVkxzu
 r+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L3fmyO7RdwoBeCqdNOhvaQTZYSyba5tKYQjpTl+Riao=;
 b=AiU1avdB8BP4PfAnBayCNuucGfOiHom2OGJmaxIunY5dXjQq8zmifEoPk5SoXSOfS6
 LnsTNrpJ19/ozhnKwFxBZbqD5uanziAIL+XGooauw6Jn1xexuSaq337KsqEbrYz2DZdn
 zulZkbELZt0QVZWYo9OdF4vv0ADKLGSZCHPV0Xc46Ysza9AuGQxt3gWBmXBeUlFcWrmF
 +QDBJ5GHvGJegaMRPjlD6DmmDYoGWPBV3ojs6Vb4R0ZMTcEU6R4Jgg3vYjcuRKxqwzXi
 MLVRC4Dm1SEstCphXiXVNz9QfsXI6X8TMQkItKJxZdVLaWIRSUgksOVYQYD0sA8995Q1
 9zIQ==
X-Gm-Message-State: APjAAAVkVboY5IWipIy9bXr1f9eNGAf1zJNStiGR2WCA8R1E/I3E/0nu
 Qcouf7AzSUn/hGS1G+asEG01Hx+YgH4NdsqSufITLQ==
X-Google-Smtp-Source: APXvYqwDE4JPdcdqpCDRvn3fhMZQyLsBl5ikxKW5jbZRaMQrbbNbBgus4QhFzdulRO3ETojx2pM9IqqqN+0sJNbBHcI=
X-Received: by 2002:a05:6000:4f:: with SMTP id
 k15mr597649wrx.221.1566354325840; 
 Tue, 20 Aug 2019 19:25:25 -0700 (PDT)
MIME-Version: 1.0
From: Jim Woo <wsy940401@gmail.com>
Date: Wed, 21 Aug 2019 10:25:15 +0800
Message-ID: <CAJwJstDWVJ8HG=Fe1VZtPDTAsCawfoKkdLAikFMQZ-hXhOprvA@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 21 Aug 2019 10:38:53 +0200
Subject: [LTP] (no subject)
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
Content-Type: multipart/mixed; boundary="===============0204347185=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0204347185==
Content-Type: multipart/alternative; boundary="0000000000002f2ac905909749ab"

--0000000000002f2ac905909749ab
Content-Type: text/plain; charset="UTF-8"

Hi, all:

I want to ask if I can use ltp for stressing CPU and Memory with Linux OS?
If the answer is yes, Can I get the detailed explanation about the hierachy
of ltp because I think the document of ltp did not explain that.

Thanks very much !

--0000000000002f2ac905909749ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, all:<div><br><div>I want to ask if I can use ltp for s=
tressing CPU and Memory with Linux OS?</div><div>If the answer is=C2=A0yes,=
 Can I get the detailed explanation about the hierachy of ltp because I thi=
nk the document of ltp did not explain that.</div><div><br></div><div>Thank=
s very much !</div></div></div>

--0000000000002f2ac905909749ab--

--===============0204347185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0204347185==--
