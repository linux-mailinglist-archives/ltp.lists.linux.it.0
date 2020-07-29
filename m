Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B87DE231A68
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 09:37:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66CFA3C2656
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 09:37:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AF1BD3C05A1
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 09:37:50 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B480360067C
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 09:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596008268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zDK8HME8cE2z2FSTGo5nl7XLeF9eBtNZJG8lEOWcgCc=;
 b=IwNljZjG0Qi7OcsMnxWnymxGVsIHyWLN7mUc3eXSymB1PZ/WcKe6MeZSGkErdDfOJ9j9B1
 Q4iFfIbQW+obUOFE9etPBIzjSkfzgsit92N5AYsLb7ZKkNfP9tQEVJ+GfYyZCa9+QMvrTq
 H72rPeTwoQmSFBov56Kypb5L9RUuuxU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-TiYwJVYmPWqFAX1lUe5Z7g-1; Wed, 29 Jul 2020 03:37:45 -0400
X-MC-Unique: TiYwJVYmPWqFAX1lUe5Z7g-1
Received: by mail-lf1-f71.google.com with SMTP id o9so6197150lfi.23
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 00:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDK8HME8cE2z2FSTGo5nl7XLeF9eBtNZJG8lEOWcgCc=;
 b=spCd1JQdhhuIfW+nixIryvYMeohvsOyBCN0KwbYk/yDJ8mk/8fKKekh/bicZmRauY9
 z7QwZUEAmYD62rZF+yaelFEUlY1ahuG2EVqkATVyqE5gH5YIn3blQIjgdhReo1qhjbLF
 r6Nxxw4atr1UJmj+GlILuMOB7m9wI2sI2bLwjgujsk4BHP5ScZXZl9s9Br0w063wdVi2
 x/m1qNwpKdnprW9o52amS3xLwaUWCAyGWVUQTlNDof3CW4ZMPsFxbZm9w6l2cn4t24uU
 /dBUymsA1w2rDZSXKvEcQCDIx0CMQgWae0P5FKtV3xKVXT6/OPHCwTn89F95xS1qg6N4
 L3rQ==
X-Gm-Message-State: AOAM531vKw82TZPX9lQSMS6g3kzclcw3zwhYbB3483a0H7JgXrVSK+31
 rbc4MozBUsuuyOm6njHE45PwFfLF5XbHc40QASmVmh5vt9J09iTiNXM9KM8rqcqpTwR/aW3WaiO
 1fZPJlfaXWQxqEgnKLM3QPVnX84U=
X-Received: by 2002:a2e:7010:: with SMTP id l16mr14706688ljc.353.1596008264015; 
 Wed, 29 Jul 2020 00:37:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQeK9s2TTVAs4TlFZhTStLf5wjvx4jYqSVAGmcMQVYE1JAE5iczQVJa6NZSF/UZlLMycUYzoOrczdnky6nUug=
X-Received: by 2002:a2e:7010:: with SMTP id l16mr14706675ljc.353.1596008263777; 
 Wed, 29 Jul 2020 00:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595911224-12470-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1595911224-12470-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 29 Jul 2020 15:37:32 +0800
Message-ID: <CAEemH2eFrsa0rNfjcKrdQpUkV6YvbQR10tbzy4F5jXVQOrra7w@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] libs/libltpnewipc: Add libmsgctl.c into
 new ipc library
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
Content-Type: multipart/mixed; boundary="===============1681544363=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1681544363==
Content-Type: multipart/alternative; boundary="0000000000009f179405ab8fa15b"

--0000000000009f179405ab8fa15b
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

On Tue, Jul 28, 2020 at 12:40 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Add libmsgctl.c into new ipc library, so we can use it
> in new api msgstress test case.
>

It's fine to maintain only a single System V IPC library in LTP.
BTW, do you have a plan to remove the old libmsgctl.c after merging this?
Series:
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000009f179405ab8fa15b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Jul 28, 2020 at 12:40 PM Yang Xu &lt;<a h=
ref=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy=
@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Add libmsgctl.c into new ipc library, so we can use it<br>
in new api msgstress test case.<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">It&#39;s fine to maintain o=
nly a single System V IPC library in LTP.=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">BTW, do you have a plan to remove the old =
libmsgctl.c after merging this?</div><div></div><div class=3D"gmail_default=
" style=3D"font-size:small"></div></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><span class=3D"gmail-il">Series</span>:<br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang =
&lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.co=
m</a>&gt;</div></div><div><br></div></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000009f179405ab8fa15b--


--===============1681544363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1681544363==--

