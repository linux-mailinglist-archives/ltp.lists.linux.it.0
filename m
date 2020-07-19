Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A20612250EB
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 11:36:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88F713C4E50
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 11:36:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3AB253C2856
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 11:36:24 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id DA0CC600AB7
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 11:35:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595151381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nRgViO+BrauEOmItSALzDeRGqIdZMRFQXmqwxZDOT3o=;
 b=aZq8Yxym6FxqaBiXkUehJznSrmSCl0PJ7guiX9AaaSOvsLWcFAKFojtYipwIOy6Xjqn9i5
 OmkZQTbPEtk6c/ACdAKGUQ4ZDVM5rktgGAm9jBvRlRdFiGBBUWlVRGC+fx+DVy8CnaxFZ5
 2ZwYkjPOpKPZXaoMgP5pBtFagXB3fWY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-QP2OLmOfNaKGNHtCRTZZWA-1; Sun, 19 Jul 2020 05:36:18 -0400
X-MC-Unique: QP2OLmOfNaKGNHtCRTZZWA-1
Received: by mail-lf1-f71.google.com with SMTP id x190so15553lff.17
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 02:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRgViO+BrauEOmItSALzDeRGqIdZMRFQXmqwxZDOT3o=;
 b=dI9qo9NkmAxRodbXUfUa/wc0/TAk5Ia2u2Z/SxmbueV4NcrC0TgZK+IGk4Vzg8rCNM
 kBGdCqvR1/ZO9g0vM1VkaRQJou9pqRrv4+8BJ+E+0TFDZPuV5fJGfAfVG0Ell0S292IA
 q2LpKqNljY5BqOvrNqAaiAfqB54aEgsr/SZStyUMEHj5SuR379a6yyLEG7sTe51WlX5i
 JhPP4H9nI7knPdPuI46mP5JJWl31+S+s6sCIHv+v1RF6afsL30lPYTVLLLBAV5zIq2SV
 +UWz0SM0Gf5qYZYag845upwoIB4da4SHR/zkD9j2cXzruvx+KDyYSlL5FsQ5Xx8uPCdp
 OeRg==
X-Gm-Message-State: AOAM532if4YgWu9w2IQ6dLsnSM35wVprZzWBegg5MjZOFeg6DUoynddE
 eHnkUtBbY1UClQmgvH7QVrkPabRb4SaEg17IWKrStgs9IV/jsBzpT1vK/hIXLmgQbZJXcndZ5S7
 wpLvPowtyuRFodu9mnl8tJ67tADM=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr8301984ljk.309.1595151376953; 
 Sun, 19 Jul 2020 02:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy1jJ2JOH3ZuzRkDhiK7rvt8y0ef0B/NrQ7sla4akJRuvgyzyLl8HrKE8e1U/xQir9S5bM5BK5m31KrWV4pZE=
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr8301981ljk.309.1595151376703; 
 Sun, 19 Jul 2020 02:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-7-chrubis@suse.cz>
In-Reply-To: <20200717163453.9587-7-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sun, 19 Jul 2020 17:36:04 +0800
Message-ID: <CAEemH2fxcMFNqpsR4RAh5_XSX1kf2JHHX=md5krfyAw5nixH8w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/9] syscalls/ipc: Add shmctl() IPC_INFO test
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
Content-Type: multipart/mixed; boundary="===============1336457888=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1336457888==
Content-Type: multipart/alternative; boundary="0000000000002bfc6c05aac81f2a"

--0000000000002bfc6c05aac81f2a
Content-Type: text/plain; charset="UTF-8"

For patches 2/4/5/6:
  Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000002bfc6c05aac81f2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">For patches 2/4/5/6:</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">=C2=A0 Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.c=
om" target=3D"_blank">liwang@redhat.com</a>&gt;<br></div></div><div><br></d=
iv>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>=
Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000002bfc6c05aac81f2a--


--===============1336457888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1336457888==--

